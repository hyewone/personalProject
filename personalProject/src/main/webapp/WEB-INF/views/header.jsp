<%@page import="com.exciform.board.dto.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Focus Admin: Creative Admin Dashboard</title>
<!-- ================= Favicon ================== -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<!-- Standard -->
<link rel="shortcut icon" href="http://placehold.it/64.png/000/fff">
<!-- Retina iPad Touch Icon-->
<link rel="apple-touch-icon" sizes="144x144"
	href="http://placehold.it/144.png/000/fff">
<!-- Retina iPhone Touch Icon-->
<link rel="apple-touch-icon" sizes="114x114"
	href="http://placehold.it/114.png/000/fff">
<!-- Standard iPad Touch Icon-->
<link rel="apple-touch-icon" sizes="72x72"
	href="http://placehold.it/72.png/000/fff">
<!-- Standard iPhone Touch Icon-->
<link rel="apple-touch-icon" sizes="57x57"
	href="http://placehold.it/57.png/000/fff">
<!-- Styles -->
<link href="/assets/css/lib/calendar2/pignose.calendar.min.css"
	rel="stylesheet">
<link href="/assets/css/lib/font-awesome.min.css" rel="stylesheet">
<link href="/assets/css/lib/themify-icons.css" rel="stylesheet">
<link href="/assets/css/lib/owl.carousel.min.css" rel="stylesheet" />
<link href="/assets/css/lib/owl.theme.default.min.css" rel="stylesheet" />
<link href="/assets/css/lib/weather-icons.css" rel="stylesheet" />
<link href="/assets/css/lib/menubar/sidebar.css" rel="stylesheet">
<link href="/assets/css/lib/bootstrap.min.css" rel="stylesheet">
<link href="/assets/css/lib/helper.css" rel="stylesheet">
<link href="/assets/css/style.css" rel="stylesheet">

<!-- include summernote css/js -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">


</head>

<body>

<%  UserDto userInfo = (UserDto) session.getAttribute("userInfo");
	int userNo = userInfo.getUser_no();
	String userId = userInfo.getUser_id();
	String userName = userInfo.getUser_name();
	String joinType = userInfo.getJoin_type();
%>
<input type="hidden" id="sessionUserNo" value="${sessionScope.userInfo.user_no}"> 
	<div
		class="sidebar sidebar-hide-to-small sidebar-shrink sidebar-gestures">
		<div class="nano">
			<div class="nano-content">
				<ul>
					<div class="logo">
						<a href="/board/boardList"> <!-- <img src="/assets/images/logo.png" alt="" /> -->
							<span><img style="width: 50px; height: 50px; margin-right: 5px;" src="/resources/img/smile3.png"/>EXCIFORM</span>
						</a>
					</div>
					<li><a class="sidebar-sub-toggle"><i class="ti-home"></i>
							Dashboard <span class="badge badge-primary">2</span> <span
							class="sidebar-collapse-icon ti-angle-down"></span></a>
						<ul>
							<li><a href="/board/chart"> Chart</a></li>
							<li><a href="/board/boardList"> Databoard</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- /# sidebar -->

	<div class="header">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12">
					<div class="float-left">
						<div class="hamburger sidebar-toggle">
							<span class="line"></span> <span class="line"></span> <span
								class="line"></span>
						</div>
					</div>
					<div class="float-right">
						<div class="dropdown dib">
							<div class="header-icon" data-toggle="dropdown">
								<i class="ti-bell"></i>
								<div class="drop-down dropdown-menu dropdown-menu-right">
									<div class="dropdown-content-heading">
										<span class="text-left">Recent Notifications</span>
									</div>
									<div class="dropdown-content-body">
										<ul>
											<li><a href="#"> <img
													class="pull-left m-r-10 avatar-img"
													src="/assets/images/avatar/3.jpg" alt="" />
													<div class="notification-content">
														<small class="notification-timestamp pull-right">02:34
															PM</small>
														<div class="notification-heading">Mr. John</div>
														<div class="notification-text">5 members joined
															today</div>
													</div>
											</a></li>
											<li><a href="#"> <img
													class="pull-left m-r-10 avatar-img"
													src="/assets/images/avatar/3.jpg" alt="" />
													<div class="notification-content">
														<small class="notification-timestamp pull-right">02:34
															PM</small>
														<div class="notification-heading">Mariam</div>
														<div class="notification-text">likes a photo of you</div>
													</div>
											</a></li>
											<li><a href="#"> <img
													class="pull-left m-r-10 avatar-img"
													src="/assets/images/avatar/3.jpg" alt="" />
													<div class="notification-content">
														<small class="notification-timestamp pull-right">02:34
															PM</small>
														<div class="notification-heading">Tasnim</div>
														<div class="notification-text">Hi Teddy, Just wanted
															to let you ...</div>
													</div>
											</a></li>
											<li><a href="#"> <img
													class="pull-left m-r-10 avatar-img"
													src="/assets/images/avatar/3.jpg" alt="" />
													<div class="notification-content">
														<small class="notification-timestamp pull-right">02:34
															PM</small>
														<div class="notification-heading">Mr. John</div>
														<div class="notification-text">Hi Teddy, Just wanted
															to let you ...</div>
													</div>
											</a></li>
											<li class="text-center"><a href="#" class="more-link">See
													All</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<div class="dropdown dib">
							<div class="header-icon" data-toggle="dropdown">
								<i class="ti-email"></i>
								<div class="drop-down dropdown-menu dropdown-menu-right">
									<div class="dropdown-content-heading">
										<span class="text-left">2 New Messages</span> <a
											href="email.html"> <i class="ti-pencil-alt pull-right"></i>
										</a>
									</div>
									<div class="dropdown-content-body">
										<ul>
											<li class="notification-unread"><a href="#"> <img
													class="pull-left m-r-10 avatar-img"
													src="/assets/images/avatar/1.jpg" alt="" />
													<div class="notification-content">
														<small class="notification-timestamp pull-right">02:34
															PM</small>
														<div class="notification-heading">Michael Qin</div>
														<div class="notification-text">Hi Teddy, Just wanted
															to let you ...</div>
													</div>
											</a></li>
											<li class="notification-unread"><a href="#"> <img
													class="pull-left m-r-10 avatar-img"
													src="/assets/images/avatar/2.jpg" alt="" />
													<div class="notification-content">
														<small class="notification-timestamp pull-right">02:34
															PM</small>
														<div class="notification-heading">Mr. John</div>
														<div class="notification-text">Hi Teddy, Just wanted
															to let you ...</div>
													</div>
											</a></li>
											<li><a href="#"> <img
													class="pull-left m-r-10 avatar-img"
													src="/assets/images/avatar/3.jpg" alt="" />
													<div class="notification-content">
														<small class="notification-timestamp pull-right">02:34
															PM</small>
														<div class="notification-heading">Michael Qin</div>
														<div class="notification-text">Hi Teddy, Just wanted
															to let you ...</div>
													</div>
											</a></li>
											<li><a href="#"> <img
													class="pull-left m-r-10 avatar-img"
													src="/assets/images/avatar/2.jpg" alt="" />
													<div class="notification-content">
														<small class="notification-timestamp pull-right">02:34
															PM</small>
														<div class="notification-heading">Mr. John</div>
														<div class="notification-text">Hi Teddy, Just wanted
															to let you ...</div>
													</div>
											</a></li>
											<li class="text-center"><a href="#" class="more-link">See
													All</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<div class="dropdown dib">
							<div class="header-icon" data-toggle="dropdown">
								<span class="user-avatar"><%=userName %> 님<i
									class="ti-angle-down f-s-10"></i>
								</span>
								<div
									class="drop-down dropdown-profile dropdown-menu dropdown-menu-right">
									<div class="dropdown-content-body">
										<ul>
											<li><a href="#" id="btnLogout"> <i class="ti-power-off"></i> <span>Logout</span>
											</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script>
	
		$('#btnLogout').click(function(){
			bootbox.confirm("로그아웃 하시겠습니까?", function(result) {
				debugger;
				if (result == true) {
					location.href = "/user/logout";
				}
			});
		});
	
	</script>

	<!-- Begin Page Content -->
	<div class="content-wrap">
		<div class="main">
			<div class="container-fluid">