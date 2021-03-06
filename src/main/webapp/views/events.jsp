<%@page import="temp.JSPHelper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="by">
<%@include file='head.jsp'%>
<body>
<%@include file='header.jsp'%>
	<div id="content">
		<div class="inner">
			<div class="container_12">
				<div class="wrapper">
					<div class="grid_12">
						<div class="block">
							<div class="info-block">
								<h1>Тут могла бы быть Ваша реклама!</h1>
							</div>
						</div>
					</div>
					<div class="wrapper">
						<div class="grid_12">
							<h2 class="h-pad1">События</h2>
							<ul class="wrapper works">

								<%
									int a = 0;
								%>


								<c:forEach var="event" items="${events}">

									<li class="<%=JSPHelper.getColumnPosition(a)%>">
									<div align="center" >
										<figure>
										<img src="/<c:out value="${appName}" /><c:out value="${event.imageUri}" />" height="200" alt="">
											
										</figure>
										<p>
											<a href="event/<c:out	value="${event.id}" />" class="link"><c:out value="${event.name}" /></a>
											
										</p>
										</div> <br> <c:out value="${event.startEvent}" /> <br> <c:out
											value="${fn:substring(event.description,0,200)}" /> ..... <br>
										COST : <c:out value="${event.cost}" /> <br> 
										<p>
											<a href="event/<c:out	value="${event.id}" />" class="button">Читать
												далее</a>
										</p>
									</li>
									<%
										if (a == 2) {
												a = 0;
											} else {
												a++;
											}
											;
									%>
								</c:forEach>


							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file='footer.jsp'%>
</body>
</html>
