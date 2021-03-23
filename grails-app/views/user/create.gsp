<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main-bo" />
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
</head>
<body>
<a href="#create-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div id="create-user" class="content scaffold-create" role="main">
    <h1><g:message code="default.create.label" args="[entityName]" /></h1>
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
    <g:form resource="${this.user}" method="POST">
        <fieldset class="form">
            <div class="fieldcontain required">
                <label for="username">Username
                    <span class="required-indicator">*</span>
                </label>
                <g:field type="text" name="username" id="username"/>
            </div>

            <div class="fieldcontain required">
                <label for="password">Password
                    <span class="required-indicator">*</span>
                </label>
                <g:field type="password" name="password" required="true" id="password"/>
            </div>

            <div class="fieldcontain">
                <label>Role</label>
                <g:select from="${rolesList}" name="role" optionKey="id" optionValue="authority"/>
            </div>
            <div class="fieldcontain">
                <label for="passwordExpired">Password Expired</label>
                <g:checkBox name="passwordExpired" id="passwordExpired"/>
            </div>
            <div class="fieldcontain">
                <label for="accountLocked">Account Locked</label>
                <g:checkBox name="accountLocked" id="accountLocked"/>
            </div>
            <div class="fieldcontain">
                <label for="accountExpired">Account Expired</label>
                <g:checkBox name="accountExpired" id="accountExpired"/>
            </div>
            <div class="fieldcontain">
                <label for="enabled">Enabled</label>
                <g:checkBox name="enabled" id="enabled"/>
            </div>
        </fieldset>
        <fieldset class="buttons">
            <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
        </fieldset>
    </g:form>
</div>
</body>
</html>
