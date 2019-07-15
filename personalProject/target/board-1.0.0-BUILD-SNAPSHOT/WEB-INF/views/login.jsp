<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Landing &mdash; Free One Page Bootstrap 4 Template by
	uicookies.com</title>
<meta name="description"
	content="Free Bootstrap 4 Template by uicookies.com">
<meta name="keywords"
	content="Free website templates, Free bootstrap themes, Free template, Free bootstrap, Free website template">

<link
	href="https://fonts.googleapis.com/css?family=Crimson+Text:400,400i,600|Montserrat:200,300,400"
	rel="stylesheet">

<link rel="stylesheet" href="assets2/css/bootstrap/bootstrap.css">
<link rel="stylesheet"
	href="assets2/fonts/ionicons/css/ionicons.min.css">
<link rel="stylesheet" href="assets2/fonts/law-icons/font/flaticon.css">

<link rel="stylesheet"
	href="assets2/fonts/fontawesome/css/font-awesome.min.css">


<link rel="stylesheet" href="assets2/css/slick.css">
<link rel="stylesheet" href="assets2/css/slick-theme.css">

<link rel="stylesheet" href="assets2/css/helpers.css">
<link rel="stylesheet" href="assets2/css/style.css">
<link rel="stylesheet" href="assets2/css/landing-2.css">


<style>
.pb_form_v1 {
	padding-top: 50px;
}

#btnLogin:hover, #btnSignUp:hover {
	background-color: #1E90FF;
	color: white;
}

#btnLogin:hover {
	
}
</style>


</head>
<body data-spy="scroll" data-target="#pb-navbar" data-offset="200">


	<section
		class="pb_cover_v3 overflow-hidden cover-bg-indigo cover-bg-opacity text-left pb_gradient_v1 pb_slant-light"
		id="section-home">
		<div class="container">
			<div class="row align-items-center justify-content-center">
				<div class="col-md-6">
					<h2 class="heading mb-3">Welcome</h2>
					<div class="sub-heading">
						<p class="mb-4">
							New free template by <a href="http://uicookies.com"
								target="_blank">uicookies.com</a>. For more templates visit the
							<a href="http://uicookies.com" target="_blank">site</a>. Lorem
							ipsum dolor sit amet, consectetur adipisicing elit.
						</p>
						<p class="mb-5">
							<span class="pb_font-14 text-uppercase pb_letter-spacing-1"></span>
						</p>
					</div>
				</div>
				<div class="col-md-1"></div>
				<div class="col-md-5 relative align-self-center">

					<div>
						<input type="button" value="LOGIN" class="btn btn-flat btn-block"
							style="float: left; width: 50%; height: 50px; color: #007bff;"
							id="btnLogin"> <input type="button" value="SIGNUP"
							class="btn btn-flat btn-block"
							style="float: right; width: 50%; margin-top: 0; height: 50px; background-color: #e7e7e7; color: darkgray;"
							id="btnSignUp">
					</div>
					<form action="/user/login" method="post"
						class="bg-white rounded pb_form_v1" id="formLogin"
						onsubmit="return fnLoginOnSubmit();">
						<div class="form-group" style="margin-top: 50px;">
							<input type="text" class="form-control pb_height-50 reverse"
								placeholder="ID" id="userId" name="user_id">
						</div>
						<div class="form-group">
							<input type="password" class="form-control pb_height-50 reverse"
								placeholder="Password" id="userPassword" name="user_password">
						</div>
						<div class="form-group"
							style="margin-top: 30px; border-bottom: 1px solid #e7e7e7; padding-bottom: 40px;">
							<button type="submit" id="btnLoginSubmit"
								class="btn btn-primary btn-lg btn-block pb_btn-pill  btn-shadow-blue">Login</button>
								<input type="hidden" id="joinType" name="join_type">
								<input type="hidden" id="userName" name="user_name">
						</div>
						<div class="form-group">
							<a id="kakao-login-btn"></a>
						
						</div>
					</form>

					<form action="/user/signup" method="post"
						class="bg-white rounded pb_form_v1" hidden="true" id="formSignUp"
						onsubmit="return fnSignUpOnSubmit();">
						<div class="form-group"
							style="margin-top: 60px; margin-bottom: 20px;">
							<input type="text" class="form-control pb_height-50 reverse"
								placeholder="ID" style="float: left; width: 80%;" id="userId"
								name="user_id"> <input type="button"
								class="btn btn-primary btn-outline"
								style="float: right; width: 17%; margin-left: 3px; margin-top: 4px;"
								value="확인" id="btnCheckId" /> <input type="hidden" id="enablId"
								value="N">
						</div>
						<div class="form-group" style="margin-top: 125px;">
							<input type="password" class="form-control pb_height-50 reverse"
								placeholder="Password" id="userPassword" name="user_password">
						</div>
						<div class="form-group">
							<input type="text" class="form-control pb_height-50 reverse"
								placeholder="Name" id="userName" name="user_name">
						</div>
						<div class="form-group"
							style="margin-top: 30px; padding-top: 10px; padding-bottom: 10px;">
							<button type="submit" id="btnSignUpSubmit"
								class="btn btn-primary btn-lg btn-block pb_btn-pill  btn-shadow-blue">SignUp</button>
						</div>
					</form>

				</div>
			</div>
		</div>
	</section>
	<!-- END section -->

	<footer class="pb_footer bg-light" role="contentinfo">
		<div class="container">
			<div class="row text-center">
				<div class="col">
					<ul class="list-inline">
						<li class="list-inline-item"><a href="#" class="p-2"><i
								class="fa fa-facebook"></i></a></li>
						<li class="list-inline-item"><a href="#" class="p-2"><i
								class="fa fa-twitter"></i></a></li>
						<li class="list-inline-item"><a href="#" class="p-2"><i
								class="fa fa-linkedin"></i></a></li>
					</ul>
				</div>
			</div>
			<div class="row">
				<div class="col text-center">
					<p class="pb_font-14">
						&copy; 2019. All Rights Reserved. <br> <a
							href="https://uicookies.com/bootstrap-html-templates/">Bootstrap
							Templates</a> by uiCookies
					</p>
					<p class="pb_font-14">
						Demo Images: <a href="https://unsplash.com/" target="_blank"
							rel="nofollow">Unsplash</a>
					</p>
				</div>
			</div>
		</div>
	</footer>

	<!-- loader -->
	<div id="pb_loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#1d82ff" /></svg>
	</div>



	<script src="assets2/js/jquery.min.js"></script>

	<script src="assets2/js/popper.min.js"></script>
	<script src="assets2/js/bootstrap.min.js"></script>
	<script src="assets2/js/slick.min.js"></script>
	<script src="assets2/js/jquery.mb.YTPlayer.min.js"></script>

	<script src="assets2/js/jquery.waypoints.min.js"></script>
	<script src="assets2/js/jquery.easing.1.3.js"></script>

	<script src="assets2/js/main.js"></script>

	<script src="assets2/bootbox/bootbox.all.js"></script>
	<script src="assets2/bootbox/bootbox.js"></script>
	<script src="assets2/bootbox/bootbox.locales.js"></script>
	<script src="assets2/bootbox/bootbox.all.min.js"></script>
	<script src="assets2/bootbox/bootbox.locales.min.js"></script>
	<script src="assets2/bootbox/bootbox.min.js"></script>

	<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script>
	
	$(document).ready(function(){

		
		 Kakao.init('a010b1b2adbbad30962cdd88c8bb5cad');
	     // 카카오 로그인 버튼을 생성합니다.
	     Kakao.Auth.createLoginButton({
	       container: '#kakao-login-btn',
	       success: function(authObj) {
	           console.log(JSON.stringify(authObj));
	           
	        // 로그인 성공시, API를 호출합니다.
	           Kakao.API.request({
	            url: '/v1/user/me',
	            success: function(res) {
	             console.log(res);
	             
	             var userId = res.id;      //유저의 카카오톡 고유 id
	             var userNickName = res.properties.nickname; //유저가 등록한 별명
	             var joinType = "102";
	             
	             console.log(userId);
	             console.log(userNickName);
	             
	             $('#formLogin #userId').val(userId);
	             $('#formLogin #userName').val(userNickName);
	             $('#formLogin #joinType').val(joinType);
	             
	             $('#formLogin').submit();
	             
	            },
	            fail: function(error) {
	             alert(JSON.stringify(error));
	            }
	           });
	           
	       },
	       fail: function(err) {
	    	   console.log(JSON.stringify(err));
	       }
	     });
		
		
		$('#btnLogin').click(function(){
			//버튼처리
			$(this).css('background-color','');
			$(this).css('color','#007bff');
			$('#btnSignUp').css({'background-color':'#e7e7e7', 'color': 'darkgray'});
			
			//폼처리
			$('#formSignUp').attr('hidden',true);
			$('#formLogin').attr('hidden',false);
		});
		
		$('#btnSignUp').click(function(){
			
			//버튼처리
			$(this).css('background-color','');
			$(this).css('color','#007bff');
			$('#btnLogin').css({'background-color':'#e7e7e7', 'color': 'darkgray'});
			
			//폼처리
			$('#formLogin').attr('hidden',true);
			$('#formSignUp').attr('hidden',false);
			
		});
		
		//회원가입 아이디 중복확인
		$('#btnCheckId').click(function(){
			//유효성 체크
			debugger;
			var userId = $('#formSignUp #userId').val();
			
			console.log($('#formSignUp #userId').val());
			 $.ajax({
			        url : "/user/do.checkId",
			        type: "post",
           		 	dataType:"json",
			        data : { "userId" : userId },
			        success : function(responseData){
			        	console.log(responseData);
			           // var data = JSON.parse(responseData);
		            	if(responseData > 0){
		            		bootbox.alert(userId + ' 는 이미 존재하는 ID 입니다.');
		            		$('#enablId').val('N');
		            	}else{
		            		bootbox.alert(userId + ' 는 사용 가능한 ID 입니다.');
		            		$('#enablId').val('Y');
		            	}
			        }
			    });
		});
		
	});
	
	//로그인 확인
	function fnLoginOnSubmit(){
		//유효성 체크
		var userId = $('#formLogin #userId').val();
		var userPassword = $('#formLogin #userPassword').val();
		var joinType = $('#joinType').val();
		
		//joinType이 없을 경우만 체크 102, 103은 바로 submit
		if(joinType == ''){
		
			if(userId == ''){
				bootbox.alert('아이디를 입력해주세요.');
				return false;
			}else if(userPassword == ''){
				bootbox.alert('비밀번호를 입력해주세요.');
				return false;
			}	
				 $.ajax({
				        url : "/user/do.checkLogin",
				        type: "post",
				        dataType: "json",
				        data : { "user_id" : userId , "user_password" : userPassword },
				        success : function(responseData){
				        	console.log(responseData);
				        	if(responseData > 0){
				        		return true;
				        	}else{
			            		bootbox.alert('아이디와 패스워드를 다시 확인해주세요.');
				        		return false;
			            	}
				        }
				    });
		}
	}
	
	function fnSignUpOnSubmit(){
		debugger;
		var joinType = $('#joinType').val();
		
		//joinType이 없을 경우만 체크 102, 103은 바로 submit
		if(joinType == ''){
		//유효성 체크
			if($('#formSignUp #userId').val() == ''){
				bootbox.alert('아이디를 입력해주세요.');
				return false;
			}else if($('#formSignUp #userPassword').val() == ''){
				bootbox.alert('비밀번호를 입력해주세요.');
				return false;
			}else if($('#formSignUp #userName').val() == ''){
				bootbox.alert('이름을 입력해주세요.');
				return false;
			}else if($('#enablId').val() == 'N'){
				bootbox.alert('아이디 중복검사를 진행해주세요.');
				return false;
			}
		}
	}
	
	</script>
</body>

</html>
