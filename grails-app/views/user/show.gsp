<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main-bo" />
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
<a href="#show-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div id="show-user" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <ol class="property-list user">

        <li class="fieldcontain">
            <span id="username-label" class="property-label">Username</span>
            <div class="property-value" aria-labelledby="username-label">${this.user.username}</div>
        </li>

        <li class="fieldcontain">
            <span id="passwordExpired-label" class="property-label">Password Expired</span>
            <div class="property-value" aria-labelledby="passwordExpired-label">${this.user.passwordExpired}</div>
        </li>

        <li class="fieldcontain">
            <span id="accountLocked-label" class="property-label">Account Locked</span>
            <div class="property-value" aria-labelledby="accountLocked-label">${this.user.accountLocked}</div>
        </li>

        <li class="fieldcontain">
            <span id="accountExpired-label" class="property-label">Account Expired</span>
            <div class="property-value" aria-labelledby="accountExpired-label">${this.user.accountExpired}</div>
        </li>

        <li class="fieldcontain">
            <span id="enabled-label" class="property-label">Enabled</span>
            <div class="property-value" aria-labelledby="enabled-label">${this.user.enabled}</div>
        </li>

        <li class="fieldcontain">
            <span id="annonces-label" class="property-label">Annonces</span>
            <ul>
                <g:each in="${annonces}" var="annonce">
                    <g:link controller="annonce" action="show" id="${annonce.id}">
                        <li>
                            ${annonce.title}
                        </li>
                    </g:link>
                </g:each>
            </ul>
        </li>

        <li class="fieldcontain">
            <span class="property-label">Role</span>
            <div class="property-value">${myRole.authority}</div>
        </li>

    </ol>

    <g:form resource="${this.user}" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${this.user}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
            <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
        </fieldset>
    </g:form>
</div>
</body>
</html>
