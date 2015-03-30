<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page session="false" %>
<!DOCTYPE html>

<%@include file='head.jsp' %>

<head>
    <link rel="stylesheet" href="/<c:out value="${appName}" />/css/map/map.css" type="text/css"
          media="screen">
    <link rel="stylesheet" href="/<c:out value="${appName}" />/css/tree/style.min.css" type="text/css" />

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
        $('#html').jstree();
        $('#htree').jstree({
            'core' : {
                'data' : [
                    { "text" : "Root node", "children" : [
                        { "text" : "Child node 1" },
                        { "text" : "Child node 2" }
                    ]}
                ]
            }
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
                    <div id="htree"></div>
                </div>
            </div>
        </div>
    </div>
</div>


<%@include file='footer.jsp' %>
</body>
</html>