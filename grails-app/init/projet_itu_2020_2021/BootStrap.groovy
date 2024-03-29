package projet_itu_2020_2021

import com.mbds.grails.Annonce
import com.mbds.grails.Illustration
import com.mbds.grails.Role
import com.mbds.grails.User
import com.mbds.grails.UserRole
import grails.plugin.awssdk.s3.AmazonS3Service


class BootStrap {

    def random = new Random()
    def intTabVal = 0
    def annonceNames = ["Samsung s20", "Violin", "Fork", "Olive", "Dishwashing liquid", "Earphone"]
    def annonceDescription = ["A great phone", "The greatest musician's violin", "Covered in gold", "something to eat", "To keep a clean house", "to enjoy your music"]
    AmazonS3Service amazonS3Service
    final String bucketName = "bucket-for-grails"

    def init = { servletContext ->

        //try{ amazonS3Service.deleteBucket(bucketName)}catch(Exception e){println e}
        //try{ amazonS3Service.createBucket(bucketName)}catch(Exception e){println e}

        def adminRole = new Role(authority: "ROLE_ADMIN").save()
        def modRole = new Role(authority: "ROLE_MODO").save()
        def userRole = new Role(authority: "ROLE_USER").save()

        def adminUser = new User(username: "admin", password: "password").save()
        def modUser = new User(username: "moderator", password: "password").save()
        def userUser = new User(username: "customer", password: "password").save()

        UserRole.create adminUser, adminRole, true
        UserRole.create(modUser, modRole, true)
        UserRole.create(userUser, userRole, true)

        User.list().each {
            User userInstance ->
                (1..2).each {
                    Integer annonceIdx ->
                        def annonceInstance = new Annonce(
                                title: annonceNames[intTabVal],
                                description: annonceDescription[intTabVal],
                                price: random.nextInt(500)
                        )
                        (1..2).each {
                            def illustrationname = "grails" + userInstance.id.toString() + annonceIdx.toString() + it.toString() + ".svg"
                            annonceInstance.addToIllustrations(new Illustration(filename: illustrationname))
                        }
                        intTabVal = intTabVal + 1
                        userInstance.addToAnnonces(annonceInstance)
                }
                userInstance.save(flush: true, failOnError: true)
        }

    }
    def destroy = {
    }
}
