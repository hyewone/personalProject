<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
	<script type="text/javascript">
		var naver_id_login = new naver_id_login("3IA_kpSklGOV8h9fdMwy",
				"http://localhost:8080/user/loginCallback");
		// 접근 토큰 값 출력
		// alert(naver_id_login.oauthParams.access_token);
		// 네이버 사용자 프로필 조회
		naver_id_login.get_naver_userprofile("naverSignInCallback()");
		// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
		function naverSignInCallback() {
			var id = naver_id_login.getProfileData('id');
			var name = naver_id_login.getProfileData('name');
			console.log(id);
			console.log(name);
			
			//모창으로 데이터 보내기..;
			window.opener.fnGetNaverLoginInfo(id , name);
			
			/*window.opener.$('#socialLoginForm #userId').val(id);
			window.opener.$('#socialLoginForm #userName').val(name);
			window.opener.$('#socialLoginForm #joinType').val("103");
			debugger;
			window.opener.$("#socialLoginForm").submit();
			*/
			window.close();
		}
	</script>
</body>
</html>