package com.mbds.grails

import grails.gorm.transactions.Transactional
import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class UserController {

    UserService userService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    @Secured(['ROLE_ADMIN', 'ROLE_MODO'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond userService.list(params), model:[userCount: userService.count()]
    }

    @Secured(['ROLE_ADMIN', 'ROLE_MODO'])
    def show(Long id) {
        User user = userService.get(id)
        def roleId = UserRole.findByUser(user).roleId
        Role userRole = Role.get(roleId)
        respond user, model: [myRole: userRole, annonces: Annonce.findAllByAuthor(user)]
    }

    @Secured(['ROLE_ADMIN'])
    def create() {
        respond new User(params), model: [rolesList: Role.list()]
    }

    @Secured(['ROLE_ADMIN'])
    def save(User user) {
        if (user == null) {
            notFound()
            return
        }

        try {
            userService.save(user)
            Integer roleId = params.role.toInteger()
            Role newUserRole = Role.findById(roleId)

            UserRole.create(user,newUserRole,true)

        } catch (ValidationException e) {
            respond user.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                //Use userId for redirect method
                Integer newUserId = User.findByUsername(user.username).id

                flash.message = message(code: 'default.created.message', args: [message(code: 'user.username', default: 'User'), user.id])
                redirect(action: "show", id: newUserId)
            }
            '*' { respond user, [status: CREATED] }
        }
    }

    @Secured(['ROLE_ADMIN', 'ROLE_MODO'])
    def edit(Long id) {
        def user = userService.get(id)
        def userRoleID = UserRole.findByUser(user).getRole().id
        def role = Role.get(userRoleID)

        respond user, model: [rolesList: Role.list(), userRole: role]
    }

    @Secured(['ROLE_ADMIN', 'ROLE_MODO'])
    def update(User user) {
        if (user == null) {
            notFound()
            return
        }

        try {
            UserRole.withTransaction {

                Role userNewRole = Role.findById params.role

                UserRole currentUserRole = UserRole.findByUser(user)
                Role userCurrentRole = currentUserRole.role

                userService.save(user)
                UserRole.remove(user,userCurrentRole)
                UserRole.create(user,userNewRole)
            }

        } catch (ValidationException e) {
            respond user.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), user.id])
                redirect user
            }
            '*'{ respond user, [status: OK] }
        }
    }

    @Secured(['ROLE_ADMIN'])
    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        UserRole.withTransaction {
            def user = User.get(id)
            def role = UserRole.findByUser(user).role
            UserRole.remove(user,role)
            user.delete()
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
