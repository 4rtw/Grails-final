<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main-bo" />
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<a href="#list-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div id="list-user" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <div id="list-user" class="content scaffold-list" role="main">
        <table>
            <thead>
            <tr>
                <th class="sortable"><a href="/projet/user/index?sort=username&amp;max=10&amp;order=asc">Username</a></th>
                <th class="sortable"><a href="/projet/user/index?sort=accountLocked&amp;max=10&amp;order=asc">Account Locked</a></th>
                <th class="sortable"><a href="/projet/user/index?sort=accountExpired&amp;max=10&amp;order=asc">Account Expired</a></th>
                <th class="sortable"><a href="/projet/user/index?sort=enabled&amp;max=10&amp;order=asc">Enabled</a></th>
            </thead>
            <tbody>
                <g:each in="${userList}" var="user">
                    <tr>
                        <td><g:link controller="user" action="show" id="${user.id}">${user.username}</g:link></td>
                        <td><g:checkBox name="accountLocked" value="${user.accountLocked}" disabled="true"/></td>
                        <td><g:checkBox name="accountLocked" value="${user.accountExpired}" disabled="true"/></td>
                        <td><g:checkBox name="accountLocked" value="${user.enabled}" disabled="true"/></td>
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
