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
          media="screen">

    <script type="text/javascript" src="/<c:out value="${appName}" />/js/map/google.maps.api.js"></script>
    <script type="text/javascript" src="/<c:out value="${appName}" />/js/map/map.js"></script>
    <script type="text/javascript" src="/<c:out value="${appName}" />/js/tree/jstree.min.js"></script>
    <script type="text/javascript" src="/<c:out value="${appName}" />/js/tree/tree.js"></script>
    <script>


        google.maps.event.addDomListener(window, 'load', initialize);
        $(document).ready(function() {
            // Google map
           initialize();

            // HTree
            var data = ${categories};
            configureHTree("#htree", data);

            //Search
            addSearching("#htree", "#search_field");

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
                <div id="page-menu">
                    <div class="grid_8 criteria">
                        <select id="criteria-category">
                            <option value="volvo">Volvo</option>
                            <option value="saab">Saab</option>
                            <option value="mercedes">Mercedes</option>
                            <option value="audi">Audi</option>
                        </select>
                        <div class="criteria-item">
                            <input id="checkbox_1" type="checkbox" class="criteria-checkbox" name="checkbox_1">
                            <label for="checkbox_1">1</label>
                        </div>
                        <div class="criteria-item">
                            <input id="checkbox_2" type="checkbox" class="criteria-checkbox" name="checkbox_2">
                            <label for="checkbox_2">2</label>
                        </div>
                        <div class="criteria-item">
                            <input id="checkbox_3" type="checkbox" class="criteria-checkbox" name="checkbox_3">
                            <label for="checkbox_3">3</label>
                        </div>
                        <div class="criteria-item">
                            <input id="checkbox_4" type="checkbox" class="criteria-checkbox" name="checkbox_4">
                            <label for="checkbox_4">4</label>
                        </div>
                        <div class="criteria-item">
                            <input id="checkbox_5" type="checkbox" class="criteria-checkbox" name="checkbox_5">
                            <label for="checkbox_5">5</label>
                        </div>
                        <div class="criteria-item">
                            <input id="checkbox_6" type="checkbox" class="criteria-checkbox" name="checkbox_6">
                            <label for="checkbox_6">6</label>
                        </div>
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