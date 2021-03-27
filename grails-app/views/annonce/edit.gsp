<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main-bo"/>
    <g:set var="entityName" value="${message(code: 'annonce.label', default: 'Annonce')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>

<body>
%{--<a href="#edit-annonce" class="skip" tabindex="-1"><g:message code="default.link.skip.label"--}%
%{--                                                              default="Skip to content&hellip;"/></a>--}%

%{--<div class="nav" role="navigation">--}%
%{--    <ul>--}%
%{--        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--}%
%{--        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>--}%
%{--        <li><g:link class="create" action="create"><g:message code="default.new.label"--}%
%{--                                                              args="[entityName]"/></g:link></li>--}%
%{--    </ul>--}%
%{--</div>--}%

<div id="edit-annonce" class="content scaffold-edit" role="main">
    <div class="tp-header">
        <h3><g:message code="default.edit.label" args="[entityName]" /></h3>
        <div class="tp-toolbar-action" style="margin-bottom: 10px">
            <a href="/projet/annonce/create" class="btn btn-primary">Create</a>
            <a href="/projet/annonce" class="btn btn-secondary">List</a>
        </div>
    </div>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${this.annonce}">
        <ul class="errors" role="alert">
            <g:eachError bean="${this.annonce}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:uploadForm controller="annonce" action="update" id="${annonce.id}">
        <g:hiddenField name="version" value="${this.annonce?.version}"/>
        <fieldset class="form">
            <div class="tp-field fieldcontain required">
                <label for="title">Title<span class="required-indicator">*</span></label>
                <input class="form-control" type="text" name="title" value="${annonce.title}" required="" id="title">
            </div>

            <div class="tp-field fieldcontain required">
                <label for="description">Description<span class="required-indicator">*</span></label>
                <input class="form-control" type="text" name="description" value="${annonce.description}" required="" id="description">
            </div>

            <div class="tp-field fieldcontain required">
                <label for="price">Price<span class="required-indicator">*</span></label>
                <input class="form-control" type="number decimal" name="price" value="${annonce.price}" required="" min="0.0" id="price">
            </div>

            <div class="fieldcontain" style="display: flex;">
                <label for="illustrations">Illustrations</label>
                <g:each in="${annonce.illustrations}" var="illustration">
                    <div style="display: flex;" class="divimagesmallsize">
                        <img src="${baseUrl + illustration.filename}" class="imagesmallsize"/>
                        <g:link controller="annonce" action="deleteIllustration" resource="annonce" params="[annonceId: annonce.id, illustrationId: illustration.id]" style="text-decoration: none">
                            <i class="fa fa-close"></i>
                        </g:link>
                    </div>
                </g:each>
            </div>

            <div class="tp-field fieldcontain">
                <label for="myFile">Upload an image</label>
                <input class="form-control" style="display: inline" type="file" name="myFile" id="myFile" onchange="showPreview(event)"/>
                <div class="preview">
                    <img class="imgprev" id="file-ip-1-preview">
                </div>
            </div>

            <div class="tp-field fieldcontain required">
                <label for="author">Author<span class="required-indicator">*</span></label>
                <g:select class="form-control" name="idauthor" id="idauthor" from="${userList}" optionKey="id" optionValue="username" />
            </div>
        </fieldset>
        <fieldset class="tp-toolbar-action buttons">
            <input class="save btn btn-success" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}"/>
        </fieldset>
    </g:uploadForm>
</div>
</body>
</html>
