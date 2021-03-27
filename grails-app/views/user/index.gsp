<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main-bo" />
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
%{--<a href="#list-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%
<div class="content scaffold-list" role="main">
    <div class="tp-header">
        <h3><g:message code="default.list.label" args="[entityName]" /></h3>
        <div class="tp-toolbar-action" style="margin-bottom: 10px">
            <a href="/projet/user/create" class="btn btn-primary">Create</a>
        </div>
    </div>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <div id="list-user" class="content scaffold-list" role="main">
        <table class="table table-hover">
            <thead>
            <tr>
                <th class="sortable"><g:link controller="user" action="index" params="[sort:'username' ,max: '10', order: 'desc']">Username</g:link></th>
                <th class="sortable"><g:link controller="user" action="index" params="[sort:'username' ,max: '10', order: 'desc']">Password Expired</g:link></th>
                <th class="sortable"><g:link controller="user" action="index" params="[sort:'accountLocked' ,max: '10', order: 'desc']">Account Locked</g:link></th>
                <th class="sortable"><g:link controller="user" action="index" params="[sort:'accountExpired',max:'10', order:'asc']">Account Expired</g:link></th>
                <th class="sortable"><g:link controller="user" action="index" params="[sort:'enabled',max:'10',order:'asc']">Enabled</g:link></th>
                <th>-</th>
            </tr>
            </thead>
            <tbody>
                <g:each in="${userList}" var="user">
                    <tr>
                        <td><g:link controller="user" action="show" id="${user.id}">${user.username}</g:link></td>
                        <td>${user.passwordExpired}</td>
                        <td>${user.accountLocked}</td>
                        <td>${user.accountExpired}</td>
                        <td>${user.enabled}</td>
                        <td><g:link class="edit" action="edit" resource="${user}"><g:message code="default.button.edit.label" default="Edit" /></g:link></td>
                    </tr>
                </g:each>
            </tbody>
        </table>
    </div>

    <div class="pagination">
        <g:paginate total="${userCount ?: 0}" />
    </div>
</div>
</body>
</html>
