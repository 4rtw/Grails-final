<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main-bo" />
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
    <title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
%{--<a href="#edit-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%
<div id="edit-user" class="content scaffold-edit" role="main">
    <div class="tp-header">
        <h3><g:message code="default.edit.label" args="[entityName]" /></h3>
        <div class="tp-toolbar-action" style="margin-bottom: 10px">
            <a href="/projet/user/create" class="btn btn-primary">Create</a>
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
    <g:form controller="user" action="update" resource="${this.user}" method="PUT">
        <g:hiddenField name="version" value="${this.user?.version}" />
        <fieldset class="form">

            <div class="tp-field fieldcontain required">
                <label for="password"> New Password
                    <span class="required-indicator">*</span>
                </label>
                <g:passwordField class="form-control" name="password" value=""/>
            </div>
            <div class="tp-field fieldcontain required">
                <label for="username">Username
                    <span class="required-indicator">*</span>
                </label>
                <g:textField class="form-control" type="text" name="username" value="${this.user.username}"/>
            </div>
            <div class="tp-field fieldcontain">
                <label>Role</label>
                <g:select class="form-control" from="${rolesList}" name="role" optionKey="id" optionValue="authority" value="${userRole.id}"/>
            </div>
            <div class="fieldcontain form-group">
                <g:checkBox class="form-check-input" name="passwordExpired" id="passwordExpired" value="${this.user.passwordExpired}"/>
                <label class="form-check-label" for="passwordExpired">Password Expired</label>
            </div>
            <div class="fieldcontain form-group">
                <g:checkBox class="form-check-input" name="accountLocked" id="accountLocked" value="${this.user.accountLocked}"/>
                <label class="form-check-label" for="accountLocked">Account Locked</label>
            </div>
            <div class="fieldcontain form-group">
                <g:checkBox class="form-check-input" name="accountExpired" id="accountExpired" value="${this.user.accountExpired}"/>
                <label class="form-check-label" for="accountExpired">Account Expired</label>
            </div>
            <div class="fieldcontain form-group">
                <g:checkBox class="form-check-input" name="enabled" id="enabled" value="${this.user.enabled}"/>
                <label class="form-check-label" for="enabled">Enabled</label>
            </div>

        </fieldset>
        <fieldset class="tp-toolbar-action buttons">
            <input class="save btn btn-success" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
        </fieldset>
    </g:form>
</div>
</body>
</html>
