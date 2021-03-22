package com.mbds.grails

import grails.converters.JSON
import grails.converters.XML
import grails.plugin.springsecurity.annotation.Secured

import javax.servlet.http.HttpServletResponse

@Secured('ROLE_ADMIN')
class ApiController {

    AnnonceService annonceService
    UserService userService
//    GET / PUT / PATCH / DELETE
//    url : localhost:8081/projet/api/annonce(s)/{id}
    def annonce() {
        switch (request.getMethod()) {
            case "GET":
                if (!params.id)
                    return response.status = HttpServletResponse.SC_BAD_REQUEST
                def annonceInstance = annonceService.get(params.id)
                if (!annonceInstance)
                    return response.status = HttpServletResponse.SC_NOT_FOUND
                response.withFormat {
                    xml { render annonceInstance as XML }
                    json { render annonceInstance as JSON }
                }
                //serializeData(annonceInstance, request.getHeader("Accept"))
                break
            case "PUT":
                if (!params.id)
                    return response.status = HttpServletResponse.SC_BAD_REQUEST
                def annonceInstance = annonceService.get(params.id)
                if (!annonceInstance)
                    return response.status = HttpServletResponse.SC_NOT_FOUND

                annonceInstance.title = request.JSON.title
                annonceInstance.description = request.JSON.description
                annonceInstance.price = Double.parseDouble(request.JSON.price)

                def idUser = Long.parseLong(request.JSON.authorId)
                def userToUse = userService.get(idUser)
                annonceInstance.author = userToUse

                annonceService.save(annonceInstance)
                return response.status = HttpServletResponse.SC_OK
                break
            case "PATCH":
                if (!params.id)
                    return response.status = HttpServletResponse.SC_BAD_REQUEST
                def annonceInstance = annonceService.get(params.id)
                if (!annonceInstance)
                    return response.status = HttpServletResponse.SC_NOT_FOUND

                if(request.JSON.title != null)
                {
                    annonceInstance.title = request.JSON.title
                }
                if(request.JSON.description != null)
                {
                    annonceInstance.description = request.JSON.description
                }
                if(request.JSON.price != null)
                {
                    annonceInstance.price = Double.parseDouble(request.JSON.price)
                }
                if(request.JSON.authorId != null)
                {
                    def idUser = Long.parseLong(request.JSON.authorId)
                    def userToUse = userService.get(idUser)
                    annonceInstance.author = userToUse
                }

                annonceService.save(annonceInstance)
                return response.status = HttpServletResponse.SC_OK
                break
            case "DELETE":
                if (!params.id)
                    return response.status = HttpServletResponse.SC_BAD_REQUEST
                annonceService.delete(params.id)
                return response.status = HttpServletResponse.SC_OK
                break
            default:
                return response.status = HttpServletResponse.SC_METHOD_NOT_ALLOWED
                break
        }
        return response.status = HttpServletResponse.SC_NOT_ACCEPTABLE
    }

//    GET / POST
    def annonces() {
        switch (request.getMethod()) {
            case "GET":
                if (!params.id)
                {
                    def listannonceInstance = annonceService.list()
                    response.withFormat {
                        xml { render listannonceInstance as XML }
                        json { render listannonceInstance as JSON }
                    }
                }
                else
                {
                    def annonceInstance = annonceService.get(params.id)
                    response.withFormat {
                        xml { render annonceInstance as XML }
                        json { render annonceInstance as JSON }
                    }
                }
                break
            case "POST":
                def annonce = new Annonce()

                annonce.title = request.JSON.title
                annonce.description = request.JSON.description
                annonce.price = Double.parseDouble(request.JSON.price)

                def idUser = Long.parseLong(request.JSON.authorId)
                def userToUse = userService.get(idUser)
                annonce.author = userToUse

                annonceService.save(annonce)
                return response.status = HttpServletResponse.SC_CREATED
                break
            default:
                return response.status = HttpServletResponse.SC_METHOD_NOT_ALLOWED
                break
        }
        return response.status = HttpServletResponse.SC_NOT_ACCEPTABLE
    }

//    GET / PUT / PATCH / DELETE
    def user() {
        switch (request.getMethod()) {
            case "GET":
                if (!params.id)
                    return response.status = HttpServletResponse.SC_BAD_REQUEST
                def userInstance = userService.get(params.id)
                if (!userInstance)
                    return response.status = HttpServletResponse.SC_NOT_FOUND
                response.withFormat {
                    xml { render userInstance as XML }
                    json { render userInstance as JSON }
                }
                break
            case "PUT":
                if (!params.id)
                    return response.status = HttpServletResponse.SC_BAD_REQUEST
                def userInstance = userService.get(params.id)
                if (!userInstance)
                    return response.status = HttpServletResponse.SC_NOT_FOUND
                userInstance.username = request.JSON.username
                userInstance.password = request.JSON.password

                userService.save(userInstance)
                return response.status = HttpServletResponse.SC_OK
                break
            case "PATCH":
                if (!params.id)
                    return response.status = HttpServletResponse.SC_BAD_REQUEST
                def userInstance = userService.get(params.id)
                if (!userInstance)
                    return response.status = HttpServletResponse.SC_NOT_FOUND
                if(request.JSON.username != null)
                {
                    userInstance.username = request.JSON.username
                }
                if(request.JSON.password != null)
                {
                    userInstance.password = request.JSON.password
                }

                userService.save(userInstance)
                return response.status = HttpServletResponse.SC_OK
                break
            case "DELETE":
                if (!params.id)
                    return response.status = HttpServletResponse.SC_BAD_REQUEST

                def userToDelete = userService.get(params.id)

                //Pas de service pour UserRole
                UserRole.removeAll(userToDelete)

                userService.delete(params.id)

                return response.status = HttpServletResponse.SC_OK
                break
            default:
                return response.status = HttpServletResponse.SC_METHOD_NOT_ALLOWED
                break
        }
        return response.status = HttpServletResponse.SC_NOT_ACCEPTABLE
    }

//    GET / POST
    def users() {
        switch (request.getMethod()) {
            case "GET":
                if (!params.id)
                {
                    def listUserInstance = userService.list()
                    response.withFormat {
                        xml { render listUserInstance as XML }
                        json { render listUserInstance as JSON }
                    }
                }
                else
                {
                    def userInstance = userService.get(params.id)
                    response.withFormat {
                        xml { render userInstance as XML }
                        json { render userInstance as JSON }
                    }
                }
                break
            case "POST":
                def user = new User()
                user.username = request.JSON.username
                user.password = request.JSON.password

                userService.save(user)
                return response.status = HttpServletResponse.SC_CREATED
                break
            default:
                return response.status = HttpServletResponse.SC_METHOD_NOT_ALLOWED
                break
        }
        return response.status = HttpServletResponse.SC_NOT_ACCEPTABLE
    }

    def serializeData(object, format)
    {
        switch (format)
        {
            case 'json':
            case 'application/json':
            case 'text/json':
                render object as JSON
                break
            case 'xml':
            case 'application/xml':
            case 'text/xml':
                render object as XML
                break
        }
    }
}
