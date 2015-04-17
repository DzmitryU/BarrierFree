<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page session="false" %>
<!DOCTYPE html>

<%@include file='head.jsp' %>

<head>
    <link rel="stylesheet" href="/<c:out value="${appName}" />/css/map/map.css" type="text/css"
          media="screen">
    <link rel="stylesheet" href="/<c:out value="${appName}" />/css/tree/style.min.css" type="text/css" />
    <link rel="stylesheet" href="/<c:out value="${appName}" />/css/tree/tree.css" type="text/css" />
    <link rel="stylesheet" href="/<c:out value="${appName}" />/css/criteria/criteria.css" type="text/css" />
    <link rel="stylesheet" href="/<c:out value="${appName}" />/css/organization/organization-list.css" type="text/css" />
          media="screen">

    <script type="text/javascript"
            src="http://maps.googleapis.com/maps/api/js?key=AIzaSyC332jqOlGw0-FnUh18dekVtwps8nEJRR0&language=ru-RU">
    </script>
    <script type="text/javascript" src="/<c:out value="${appName}" />/js/map/map.js"></script>
    <script type="text/javascript" src="/<c:out value="${appName}" />/js/tree/jstree.min.js"></script>
    <script type="text/javascript" src="/<c:out value="${appName}" />/js/tree/tree.js"></script>
    <script type="text/javascript" src="/<c:out value="${appName}" />/js/organization/organization-list.js"></script>
    <script>

        //List of organizations
        var organization_list = {};

        google.maps.event.addDomListener(window, 'load', initialize);
        $(document).ready(function() {
            // Google map
           initialize();

            // HTree
            var data = ${category_tree};
            configureHTree("#htree", data);

            //Search
            addSearching("#htree", "#search_field");

            //Criteria
            <c:forEach var="categories" items="${categories}">
                var sel = document.getElementById('criteria-category');
                var opt = document.createElement('option');
                opt.value = ${categories.id};
                opt.innerHTML = "${categories.name}";
                sel.appendChild(opt);
            </c:forEach>

            //Organizations
            <c:forEach var="organization" items="${organizations}">
                organization_list[${organization.id}] =
                {
                    id : ${organization.id},
                    name : "${organization.name}",
                    category : "${organization.category.name}",
                    lat : ${organization.coordinate.x},
                    lng : ${organization.coordinate.y},
                    displayed: false
                };
            </c:forEach>

        });

    </script>
</head>
<body>
<%@include file='header.jsp' %>


<div id="content">
    <div class="inner pad1">
        <div class="container_12">
            <div class="wrapper h-pad">
                <div class="grid_7">
                    <div id="map-canvas"></div>
                    <div class="organization_list">
                        <table>
                            <c:forEach var="organization" items="${organizations}">
                                <tr class="organization-item">
                                    <td class="organization-title">${organization.name}</td>
                                    <td> ${organization.category.name}</td>
                                    <td class="organization-description"> ${organization.description}</td>
                                    <td class="organization-button">
                                        <button id="show-button-${organization.id}"
                                                type="button"
                                                onclick="toggleSelectedOrganizationOnMap(organization_list[${organization.id}])">
                                            Показать</button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>
                <div id="page-menu">
                    <div class="grid_8 criteria">
                        <select id="criteria-category" >
                            <option value="0">= Любая =</option>
                        </select>
                        <c:forEach var="element" items="${elements}">
                            <div class="criteria-item">
                                <input id="checkbox_${element.id}" type="checkbox" class="criteria-checkbox" name="checkbox_${element.id}">
                                <label for="checkbox_${element.id}">${element.name}</label>
                            </div>
                        </c:forEach>
                        <button type="button">Поиск</button>
                    </div>
                    <div class="grid_8 htree">

                        <div id="hsearch">
                            <input type="text" name="search_field" id="search_field" value="" />
                        </div>
                        <div id="htree">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<%@include file='footer.jsp' %>
</body>
</html>