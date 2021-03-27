<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main-bo" />
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
%{--<a href="#show-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%
<div id="show-user" class="content scaffold-show" role="main" style="padding: 0 10px">
    <div class="tp-header">
        <h3><g:message code="default.show.label" args="[entityName]" /></h3>
        <div class="tp-toolbar-action" style="margin-bottom: 10px">
            <a href="/projet/user/create" class="btn btn-primary">Create</a>
            <a href="/projet/user" class="btn btn-secondary">List</a>
        </div>
    </div>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <div class="tp-field">
        <span class="tp-label" id="username-label" class="property-label">Username</span>
        <div class="property-value" aria-labelledby="username-label">${this.user.username}</div>
    </div>
    <div class="tp-field">
        <span class="tp-label" class="property-label">Role</span>
        <div class="property-value">${myRole.authority}</div>
    </div>
    <div class="tp-field">
        <span class="tp-label" id="passwordExpired-label" class="property-label">Password Expired</span>
        <g:checkBox name="passwordExpired" value="${this.user.passwordExpired}" disabled="true"/>
    </div>
    <div class="tp-field">
        <span class="tp-label" id="accountLocked-label" class="property-label">Account Locked</span>
        <g:checkBox name="accountLocked" value="${this.user.accountLocked}" disabled="true"/>
    </div>
    <div class="tp-field">
        <span class="tp-label" id="accountExpired-label" class="property-label">Account Expired</span>
        <g:checkBox name="accountExpired" value="${this.user.accountExpired}" disabled="true"/>
    </div>
    <div class="tp-field">
        <span class="tp-label" id="enabled-label" class="property-label">Enabled</span>
        <g:checkBox name="enabled" value="${this.user.enabled}" disabled="true"/>
    </div>
    <div class="tp-field">
        <span class="tp-label property-label">Annonces</span>
        <div class="content table-responsive table-full-width" id="listeannonce">
            <table class="table table-hover ">
                <thead>
                    <tr>
                        <th>Title</th>
                        <th>Description</th>
                        <th>Price</th>
                    </tr>
                </thead>
                <tbody>
                <g:each in="${annonces}" var="annonce">
                    <tr>
                        <td><g:link action="show" id="${annonce.id}">${annonce.title}</g:link></td>
                        <td>${annonce.description}</td>
                        <td>${annonce.price}</td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>
    </div>

    <div class="tp-toolbar-action">
        <g:form resource="${this.user}" method="DELETE">
            <fieldset class="buttons">
                <g:link class="edit btn btn-success" action="edit" resource="${this.user}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                <input class="delete btn btn-danger" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
            </fieldset>
        </g:form>
    </div>
</div>
</body>
</html>
