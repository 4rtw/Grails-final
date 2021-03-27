<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main-bo" />
        <g:set var="entityName" value="${message(code: 'annonce.label', default: 'Annonce')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
%{--        <a href="#list-annonce" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%

        <div id="list-annonce" class="content scaffold-list" role="main">
%{--            <h1><g:message code="default.list.label" args="[entityName]" /></h1>--}%
            <div class="row">
%{--                <nav class="navbar navbar-light bg-light">--}%
%{--                <p>Here you can try to search for an item</p>--}%
                <div class="tp-toolbar">
                    <fieldset class="form">
                        <g:form class="form-inline" action="searchAnnonce" method="GET">
                            <label for="query">Enter a title of an item:</label>
                            <div>
                                <g:textField class="form-control" name="query" value="${params.query}"/>
                                <button class="btn btn-outline-info my-2 my-sm-0" type="submit">Search</button>
                            </div>
                        </g:form>
                    </fieldset>
                    <fieldset class="form">
                        <g:form class="form-inline" action="filterAnnonce" method="GET">
                            <label>Select a filter:</label>
                            <div>
                                <g:select class="form-control" name="filterbycrit" from="${['title', 'description', 'price']}" value="${params.filterbycrit}"/>
                                <button class="btn  my-2 my-sm-0" type="submit">Filter</button>
                            </div>
                        </g:form>
                    </fieldset>
                    <div class="tp-toolbar-action">
                        <a href="/projet/annonce/create" class="btn btn-primary">Create</a>
                    </div>
                </div>
%{--                </nav>--}%
            </div>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <div class="content table-responsive table-full-width" id="listeannonce">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>Title</th>
                        <th>Description</th>
                        <th>Price</th>
                        <th>Illustrations</th>
                        <th>User name</th>
                        <th>-</th>
                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${annonceList}" var="annonce">
                        <tr>
                            <td><g:link action="show" id="${annonce.id}">${annonce.title}</g:link></td>
                            <td>${annonce.description}</td>
                            <td>${annonce.price}</td>
                            <td>
                                <g:each in="${annonce.illustrations}" var="illustration">
                                    <img src="${baseUrl + illustration.filename}" class="imagesmallsize"/>
                                </g:each>
                            </td>
                            <td>${annonce.author.username}</td>
                            <td>
                                <g:link style="margin-top: 28px" class="edit" action="edit" resource="${annonce}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
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