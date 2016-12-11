<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta content="BlendTrans(Duration=0.9)" http-equiv="Page-Enter">
	<meta content="BlendTrans(Duration=0.9)" http-equiv="Page-exit">
	<title>Marvel Cinema</title>
	<script type="text/javascript" src="jStyles/sliderengine/jquery.js"></script>
	<script type="text/javascript" src="jStyles/jquery-ui.min.js"></script>
	<script type="text/javascript" src="jStyles/myJavascript.js"></script>
	<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>	
	<link rel="stylesheet" type="text/css" href="jStyles/jquery-ui.css">
	<link rel="stylesheet" type="text/css" href="jStyles/jquery-ui.structure.css">
	<link rel="stylesheet" type="text/css" href="jStyles/jquery-ui.theme.css">
	<link rel="stylesheet" type="text/css" href="main/main_style.css">
	<link rel="shortcut icon" href="favicon.ico" type="image/x-ico" />
	<link rel="icon" href="favicon.ico" type="image/x-ico" />	
	<script type="text/javascript">
		/* 결제 모듈 사용을 위한 초기화 및 세션 시간관리 메서드 호출*/
	 	window.onload=function(){
	 		startPayment();
			if(${mvo.name != null}){
	 			sessionCheck();
				return;
			}			
	 	}			
	</script>
</head>
<body>
	<div align="center">
		<div id="header">
			<div id="mini_nav">
				<ul>
				<c:if test="${mvo.name==null }">
					<li><a href="login.do">로그인</a></li>
					<li><a href="join.do">회원가입</a></li>					
				</c:if>
				<c:if test="${mvo.name!=null }">					
					<li>${mvo.name }님 반갑습니다!</li>
					<li>
						<font class="conn">접속중</font> 
						<span class="timezone">
						<input id="txtMins" placeholder="00" readonly="readonly"> 
						<font>:</font> 
						<input id="txtSecs" placeholder="00" readonly="readonly">
						</span>
						<button class="refresh" onclick="reloadTime()">연장</button> 
					</li>					
					<li><a href="logout.do">로그아웃</a></li>
					<li><a href="reserveList.do?no=${mvo.no }">마이페이지</a></li>
				</c:if>					
					<li><a href="customer.do">고객센터</a></li>
				</ul>
			</div>
			<br/>
			<a href="main.do">
				<img alt="logo" class="logo" src="image/marvel_cinema_logo.png">
			</a>
		</div>
		<div id="nav">
			<ul>
				<li onclick="javascript:location.href='reserve.do'">
					<a href="reserve.do">예매</a>
				</li>
				<li class="noeffect">|</li>
				<li onclick="javascript:location.href='movieList.do'">
					<a href="movieList.do">영화</a>
				</li>
				<li class="noeffect">|</li>
				<li onclick="javascript:location.href='theater.do'">
					<a href="theater.do">영화관</a>
				</li>
			</ul>
		</div>
		<div id="article">
			<jsp:include page="${jsp }"></jsp:include>
		</div>
		<div id="footer">
			<span>&copy;2016 Shin Eun Hye / Kim Ho Hyun / Jun Jin Tae / Choi Tae Soek / Park Jung Hwan</span>
		</div>
	</div>
</body>
</html>