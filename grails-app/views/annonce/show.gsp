<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main-bo" />
        <g:set var="entityName" value="${message(code: 'annonce.label', default: 'Annonce')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
        <style>

        </style>

        <script>
            function openImage(imageId) {
                var modal = document.getElementById("myModal");
                var img = document.getElementById(imageId);
                var modalImg = document.getElementById("modalImg");
                var captionText = document.getElementById("caption");
                modal.style.display = "block";
                modalImg.src = img.src;
                captionText.innerHTML = img.alt;

                // Get the <span> element that closes the modal
                var span = document.getElementsByClassName("close")[0];

                // When the user clicks on <span> (x), close the modal
                span.onclick = function() {
                    modal.style.display = "none";
                }
            }
        </script>
    </head>
    <body>
%{--        <a href="#show-annonce" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%
%{--        <div class="nav" role="navigation">--}%
%{--            <ul>--}%
%{--                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--}%
%{--                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>--}%
%{--                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--}%
%{--            </ul>--}%
%{--        </div>--}%
        <div id="show-annonce" class="content scaffold-show" role="main">
%{--            <h1><g:message code="default.show.label" args="[entityName]" /></h1>--}%
            <div class="tp-header">
                <h3><g:message code="default.show.label" args="[entityName]" /></h3>
                <div class="tp-toolbar-action" style="margin-bottom: 10px">
                    <a href="/projet/annonce/create" class="btn btn-primary">Create</a>
                    <a href="/projet/annonce" class="btn btn-secondary">List</a>
                </div>
            </div>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>

            <div id="show-annonce" class="tp-detail-annonce content scaffold-show" role="main">
                <div class="left-section">
                    <div class="tp-field">
                        <span id="title-label" class="tp-label property-label">Title</span>
                        <div class="property-value" aria-labelledby="title-label">${this.annonce.title}</div>
                    </div>
                    <div class="tp-field">
                        <span id="description-label" class="tp-label property-label">Description</span>
                        <div class="property-value" aria-labelledby="description-label">${this.annonce.description}</div>
                    </div>
                    <div class="tp-field">
                        <span id="price-label" class="tp-label property-label">Price</span>
                        <div class="property-value" aria-labelledby="price-label">${this.annonce.price}</div>
                    </div>
                    <div class="tp-field">
                        <span id="author-label" class="tp-label property-label">Author</span>
                        <g:link controller="user" action="show" id="${this.annonce.authorId}">${this.annonce.author.username}</g:link>
                    </div>
                </div>
                <div class="right-section">
                    <h5 id="illustrations-label" class="tp-label property-label">Illustrations</h5>
                    <div class="tp-img-container">
                        <g:each in="${annonce.illustrations}" var="illustration">
                            <div class="tp-illustration-img">
                                <img id="img${illustration.id}" onclick="openImage('img${illustration.id}')" src="${baseUrl + illustration.filename}" class="imagesmallsize"/>
                            </div>
                        </g:each>
                        <!-- The Modal -->
                        <div id="myModal" class="modal">
                            <span class="close">&times;</span>
                            <img style="width: 50%; height: auto" class="modal-content" id="modalImg">
                            <div id="caption"></div>
                        </div>
                    </div>
                </div>
            </div>

        <div class="tp-toolbar-action">
            <g:form resource="${this.annonce}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit btn btn-success" action="edit" resource="${this.annonce}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete btn btn-danger" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
