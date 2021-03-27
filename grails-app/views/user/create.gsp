<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main-bo" />
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
</head>
<body>
%{--<a href="#create-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%
<div id="create-user" class="content scaffold-create" role="main">
    <div class="tp-header">
        <h3><g:message code="default.create.label" args="[entityName]" /></h3>
        <div class="tp-toolbar-action" style="margin-bottom: 10px">
            <a href="/projet/user" class="btn btn-secondary">List</a>
        </div>
    </div>
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
            <div class="tp-field fieldcontain required">
                <label class="tp-label" for="username">Username
                    <span class="required-indicator">*</span>
                </label>
                <g:field class="form-control" type="text" name="username" id="username"/>
            </div>

            <div class="tp-field fieldcontain required">
                <label class="tp-label" for="password">Password
                    <span class="required-indicator">*</span>
                </label>
                <g:field class="form-control" type="password" name="password" required="true" id="password"/>
            </div>

            <div class="tp-field fieldcontain">
                <label class="tp-label">Role</label>
                <g:select class="form-control" from="${rolesList}" name="role" optionKey="id" optionValue="authority"/>
            </div>
            <div class="fieldcontain form-group">
                <g:checkBox class="form-check-input" name="passwordExpired" id="passwordExpired"/>
                <label class="tp-label" for="passwordExpired">Password Expired</label>
            </div>
            <div class="fieldcontain form-group">
                <g:checkBox class="form-check-input" name="accountLocked" id="accountLocked"/>
                <label class="tp-label" for="accountLocked">Account Locked</label>
            </div>
            <div class="fieldcontain form-group">
                <g:checkBox class="form-check-input" name="accountExpired" id="accountExpired"/>
                <label class="tp-label" for="accountExpired">Account Expired</label>
            </div>
            <div class="fieldcontain form-group">
                <g:checkBox class="form-check-input" name="enabled" id="enabled"/>
                <label class="tp-label" for="enabled">Enabled</label>
            </div>
        </fieldset>
        <div class="tp-toolbar-action">
            <fieldset class="buttons">
                <g:submitButton name="create" class="save btn btn-success" value="${message(code: 'default.button.create.label', default: 'Create')}" />
            </fieldset>
        </div>
    </g:form>
</div>
</body>
</html>
