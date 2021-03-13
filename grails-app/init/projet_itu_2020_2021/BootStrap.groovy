package projet_itu_2020_2021

import com.mbds.grails.Annonce
import com.mbds.grails.Illustration
import com.mbds.grails.Role
import com.mbds.grails.User
import com.mbds.grails.UserRole


class BootStrap {

    def init = { servletContext ->

        def adminRole = new Role(authority: "ROLE_ADMIN").save()
        def modRole = new Role(authority: "ROLE_MODO").save()
        def userRole = new Role(authority: "ROLE_USER").save()

        def adminUser = new User(username: "admin", password: "password").save()
        def modUser = new User(username: "moderateur", password: "password").save()
        def userUser = new User(username: "client", password: "password").save()

        UserRole.create adminUser, adminRole, true
        UserRole.create(modUser, modRole, true)
        UserRole.create(userUser, userRole, true)

        User.list().each {
            User userInstance ->
                (1..2).each {
                    Integer annonceIdx ->
                        def annonceInstance = new Annonce(
                                title: "Titre de l'annonce $annonceIdx",
                                description: "Description de l'annonce $annonceIdx",
                                price: 100 * annonceIdx
                        )
                        (1..2).each {
                            def illustrationname = "grails" + userInstance.id.toString() + annonceIdx.toString() + it.toString() + ".svg"
                            annonceInstance.addToIllustrations(new Illustration(filename: illustrationname))
                        }
                        userInstance.addToAnnonces(annonceInstance)

                }
                userInstance.save(flush: true, failOnError: true)
        }

    }
    def destroy = {
    }
}
