<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page session="false" %>
<!DOCTYPE html>

<%@include file='head.jsp' %>

<head>
    <link rel="stylesheet" href="/<c:out value="${appName}" />/css/map/map.css" type="text/css"
          media="screen">
    <link rel="stylesheet" href="/<c:out value="${appName}" />/css/tree/style.min.css" type="text/css" />
    <link rel="stylesheet" href="/<c:out value="${appName}" />/css/tree/tree.css" type="text/css"
          media="screen">

    <script type="text/javascript" src="/<c:out value="${appName}" />/js/map/google.maps.api.js"></script>
    <script type="text/javascript" src="/<c:out value="${appName}" />/js/map/map.js"></script>
    <script type="text/javascript" src="/<c:out value="${appName}" />/js/tree/jstree.min.js"></script>
    <script>

        // Google map
        google.maps.event.addDomListener(window, 'load', initialize);
        $(document).ready(function() {
            <c:forEach var="organization" items="${organizations}">
                var lat = <c:out value="${organization.coordinate.x}"/>;
                var lng = <c:out value="${organization.coordinate.y}"/>;
                var name =  "<c:out value="${organization.name}"/>";
                addOrganization(lat, lng, name);
            </c:forEach>
        });

        // HTree
        $(function() {
            $('#htree').jstree(
                    {
                        "checkbox" : {
                            "keep_selected_style": false
                        },
                        "plugins" : ["checkbox"]
                    }
            );
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
                </div>
                <div class="grid_8">
                    <div id="htree">
                        <ul>
                            <li>Кафе, рестораны
                                <ul>
                                    <li>Бары</li>
                                    <li>Кафе</li>
                                    <li>Рестораны</li>
                                </ul>
                            </li>
                            <li>Спорт
                                <ul>
                                    <li>Тренажерные залы</li>
                                    <li>Клубы
                                        <ul>
                                            <li>Шахматно-шашечный клуб</li>
                                            <li>Бойцовский клуб</li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                            <li>Здравоохранение
                                <ul>
                                    <li>Аптеки
                                        <ul>
                                            <li>Дежурная аптека</li>
                                            <li>Фито аптека</li>
                                            <li>Аптека №2</li>
                                        </ul>
                                    </li>
                                    <li>Поликлиники</li>
                                </ul>
                            </li>
                            <li>Образование
                                <ul>
                                    <li>Школы</li>
                                    <li>Университеты</li>
                                </ul>
                            </li>
                            <li>Культура
                                <ul>
                                    <li>Кинотеатры</li>
                                    <li>Театры</li>
                                </ul>
                            </li>
                            <li>Прочее</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<%@include file='footer.jsp' %>
</body>
</html>