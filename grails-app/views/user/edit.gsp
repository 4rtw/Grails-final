<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main-bo" />
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
    <title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
<a href="#edit-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div id="edit-user" class="content scaffold-edit" role="main">
    <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${this.user}">
        <ul class="errors" role="alert">
            <g:eachError bean="${this.user}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form controller="user" action="update" resource="${this.user}" method="PUT">
        <g:hiddenField name="version" value="${this.user?.version}" />
        <fieldset class="form">

            <div class="fieldcontain required">
                <label for="password"> New Password
                    <span class="required-indicator">*</span>
                </label>
                <g:passwordField name="password" value=""/>
            </div>
            <div class="fieldcontain required">
                <label for="username">Username
                    <span class="required-indicator">*</span>
                </label>
                <input type="text" name="username" value="${this.user.username}" required="" id="username">
            </div>
            <div class="fieldcontain">
                <label>Role</label>
                <g:select from="${rolesList}" name="role" optionKey="id" optionValue="authority" value="${userRole.id}"/>
            </div>
            <div class="fieldcontain">
                <label for="passwordExpired">Password Expired</label>
                <g:checkBox name="passwordExpired" id="passwordExpired" value="${this.user.passwordExpired}"/>
            </div>
            <div class="fieldcontain">
                <label for="accountLocked">Account Locked</label>
                <g:checkBox name="accountLocked" id="accountLocked" value="${this.user.accountLocked}"/>
            </div>
            <div class="fieldcontain">
                <label for="accountExpired">Account Expired</label>
                <g:checkBox name="accountExpired" id="accountExpired" value="${this.user.accountExpired}"/>
            </div>
            <div class="fieldcontain">
                <label for="enabled">Enabled</label>
                <g:checkBox name="enabled" id="enabled" value="${this.user.enabled}"/>
            </div>

        </fieldset>
        <fieldset class="buttons">
            <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
        </fieldset>
    </g:form>
</div>
</body>
</html>
