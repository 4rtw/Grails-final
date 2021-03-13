<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main-bo" />
        <g:set var="entityName" value="${message(code: 'annonce.label', default: 'Annonce')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-annonce" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

        <div id="list-annonce" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <div class="table-responsive" id="listeannonce">
                <table class="table">
                    <thead>
                    <tr>
                        <th>
                            Name
                        </th>
                        <th>
                            Description
                        </th>
                        <th>
                            Price
                        </th>
                        <th>
                            Illustrations
                        </th>
                        <th>
                            User name
                        </th>
                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${annonceList}" var="annonce">
                        <tr>
                            <td>
                                <g:link action="show" id="${annonce.id}">${annonce.title}</g:link>
                            </td>
                            <td>
                                ${annonce.description}
                            </td>
                            <td>
                                ${annonce.price}
                            </td>
                            <td>
                                <g:each in="${annonce.illustrations}" var="illustration">
                                    <img src="${baseUrl + illustration.filename}" class="imagesmallsize"/>
                                </g:each>
                            </td>
                            <td>
                                ${annonce.author.username}
                            </td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>

            <div class="pagination">
                <g:paginate total="${annonceCount ?: 0}" />
            </div>
        </div>
    </body>
</html>