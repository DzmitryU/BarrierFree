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
		<div class="inner pad1">
			<div class="container_12">
				<div class="wrapper h-pad">

					<div class="grid_7">
						<h2>${title}</h2>
						<br>
						<h3>
						<font color="red">${result}</font>
						</h3>
						<form method="POST" action="saveprofileupdate" id="contact-form" enctype="multipart/form-data">
							<fieldset>
								<label>
								Почта
								<input id="email" type="text" name="email" value="${appUser.email}">	</label>
								<label>
								Имя
								<input id="firstname" type="text" name="firstname" value="${appUser.firstname}">	</label>
								<label>
								Отчество
								<input id="lastname" type="text" name="lastname" value="${appUser.lastname}">	</label>

								<button id="cryptstr" class="button1">Обновить данные</button>
							</fieldset>
						</form>
						<a href="/<c:out value="${appName}" />/setnewpassword">Сменить пароль</a>.
					</div>

				</div>
			</div>
		</div>
	</div>
	


<%@include file='footer.jsp'%>
</body>
</html>