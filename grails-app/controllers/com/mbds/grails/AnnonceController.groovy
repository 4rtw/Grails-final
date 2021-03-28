package com.mbds.grails

import grails.plugin.awssdk.s3.AmazonS3Service
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.web.multipart.MultipartFile

import java.text.DateFormat
import java.text.SimpleDateFormat
import grails.validation.ValidationException
import org.joda.time.DateTime

import static org.springframework.http.HttpStatus.*

class AnnonceController {

    AnnonceService annonceService
    IllustrationService illustrationService
    UserService userService
    AmazonS3Service amazonS3Service

    @Secured(['ROLE_ADMIN', 'ROLE_MODO'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond annonceService.list(params), model:[annonceCount: annonceService.count(), baseUrl: grailsApplication.config.annonces.illustrations.url]
    }

    @Secured(['ROLE_ADMIN', 'ROLE_MODO'])
    def show(Long id) {
        respond annonceService.get(id), model:[baseUrl: grailsApplication.config.annonces.illustrations.url]
    }

    @Secured(['ROLE_ADMIN'])
    def create() {
        respond new Annonce(params), model: [userList: User.list(), baseUrl: grailsApplication.config.annonces.illustrations.url]
    }

    @Secured(['ROLE_ADMIN'])
    def save(Annonce annonce) {
        if (annonce == null) {
            notFound()
            return
        }

        //1. Récupérer le fichier dans la requête
        MultipartFile f = request.getFile('myFile')
        def a = params.idauthor
        def userChosen = userService.get(a)
        annonce.author = userChosen
        if (f.empty) {
            try {
                annonceService.save(annonce)
            } catch (ValidationException e) {
                respond annonce.errors, view:'edit'
                return
            }
        }
        else {
            def filenameRSplited = f.originalFilename.split("\\.")
            String pattern = "yyyymmddhhmmss."
            DateFormat df = new SimpleDateFormat(pattern)
            Date date = Calendar.getInstance().getTime()
            String todayAsString = df.format(date)
            def filenameR = filenameRSplited[0] + todayAsString + filenameRSplited[1]
            //2. Sauvegarder le fichier localement
            def path = grailsApplication.config.annonces.illustrations.path + filenameR
            //f.transferTo(new File(path))
            //
            //
            try{
                amazonS3Service.storeMultipartFile('bucket-for-grails', f.originalFilename, f)
            }
            catch(Exception e){
                println e
            }
            //3. Créer un illustration sur le fichier que vous avez sauvegardé
            //4. Attacher l'illustration nouvellement créée à l'annonce
            annonce.addToIllustrations(new Illustration(filename: filenameR))
            annonceService.save(annonce)
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'annonce.label', default: 'Annonce'), annonce.id])
                redirect annonce
            }
            '*' { respond annonce, [status: CREATED] }
        }
    }

    @Secured(['ROLE_ADMIN', 'ROLE_MODO'])
    def edit(Long id) {
        respond annonceService.get(id), model: [userList: User.list(), baseUrl: grailsApplication.config.annonces.illustrations.url]
    }

    @Secured(['ROLE_ADMIN', 'ROLE_MODO'])
    def update() {
        def annonce = Annonce.get(params.id)

        annonce.title = params.title
        annonce.description = params.description
        annonce.price = Double.parseDouble(params.price)

        //1. Récupérer le fichier dans la requête
        def f = request.getFile('myFile')

        def a = params.idauthor
        def userChosen = userService.get(a)
        annonce.author = userChosen

        if (annonce == null) {
            notFound()
            return
        }
        if (f.empty) {
            try {
                annonceService.save(annonce)
            } catch (ValidationException e) {
                respond annonce.errors, view:'edit'
                return
            }
        }
        else {
            def filenameRSplited = f.originalFilename.split("\\.")
            String pattern = "yyyymmddhhmmss."
            DateFormat df = new SimpleDateFormat(pattern)
            Date date = Calendar.getInstance().getTime()
            String todayAsString = df.format(date)
            def filenameR = filenameRSplited[0] + todayAsString + filenameRSplited[1]
            //2. Sauvegarder le fichier localement
            def path = grailsApplication.config.annonces.illustrations.path + filenameR
            f.transferTo(new File(path))
            //3. Créer un illustration sur le fichier que vous avez sauvegardé
            //4. Attacher l'illustration nouvellement créée à l'annonce
            annonce.addToIllustrations(new Illustration(filename: filenameR))
            annonceService.save(annonce)
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(default: 'Annonce'), annonce.id])
                redirect annonce
            }
            '*'{ respond annonce, [status: OK] }
        }
    }

    @Secured(['ROLE_ADMIN', 'ROLE_MODO'])
    def deleteIllustration() {
        try {
            def illustration = illustrationService.get(params.illustrationId)
            def file = new File(grailsApplication.config.annonces.illustrations.path + illustration.filename)
            file.delete()
            illustrationService.delete(params.illustrationId)
            redirect action: "edit", method: "GET", id: params.annonceId
        } catch (Exception e) {
            flash.message = message(e.message)
            def annonce = Annonce.get(params.annonceId)
            respond annonce, view:'edit'
            return
        }

    }

    @Secured(['ROLE_ADMIN'])
    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        def annonceToDelete = annonceService.get(id)

        if(annonceToDelete.illustrations.size() > 0)
        {
            for(def s : annonceToDelete.illustrations){
                def p = s.asType(Illustration)
                def illustration = illustrationService.get(p.id)
                def file = new File(grailsApplication.config.annonces.illustrations.path + illustration.filename)
                file.delete()
            }
        }

        annonceService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'annonce.label', default: 'Annonce'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'annonce.label', default: 'Annonce'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    @Secured(['ROLE_ADMIN', 'ROLE_MODO'])
    def searchAnnonce() {
        try {
            def annList = Annonce.createCriteria().list (params) {
                if ( params.query ) {
                    ilike("title", "%${params.query}%")
                }
            }
            render (view:'index.gsp',model:[annonceList: annList, annonceCount: annonceService.count(), baseUrl: grailsApplication.config.annonces.illustrations.url])
        } catch (Exception e) {
            params.max = Math.min(max ?: 10, 100)
            render (view:'index.gsp',model:[annonceList: annonceService.list(params), annonceCount: annonceService.count(), baseUrl: grailsApplication.config.annonces.illustrations.url])
        }
    }

    @Secured(['ROLE_ADMIN', 'ROLE_MODO'])
    def filterAnnonce() {
        try {
            render (view:'index.gsp',model:[annonceList: Annonce.list(sort:params.filterbycrit), annonceCount: annonceService.count(), baseUrl: grailsApplication.config.annonces.illustrations.url])
        } catch (Exception e) {
            params.max = Math.min(max ?: 10, 100)
            render (view:'index.gsp',model:[annonceList: annonceService.list(params), annonceCount: annonceService.count(), baseUrl: grailsApplication.config.annonces.illustrations.url])
        }
    }
}
