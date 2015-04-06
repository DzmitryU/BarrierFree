<%@page import="temp.JSPHelper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
		<footer>
			<div class="container_12">
				<div class="wrapper">
					<div class="grid_7">
						<c:if test="${guest}">
								Привет, Гость. <a href="/<c:out value="${appName}" />/registration">Зарегистрируйся
									пожалуйста</a> или <a href="/<c:out value="${appName}" />/login">войди</a>.
						</c:if>
						<c:if test="${user}">
		Привет. ${appUserName}.
							<a href="/<c:out value="${appName}" />/profile">Личный кабинет</a>.
							<a href="/<c:out value="${appName}" />/logout">Выйти</a>
						</c:if>
					</div>
					<div class="grid_5">
						<div class="social">
						</div>
					</div>
				</div>
			</div>
		</footer>
		<!-- ${timeNow} -->