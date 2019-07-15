<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp"%>

<style>
.note-insert {
	display: none;
}
</style>


<!-- Page Heading -->
<div class="row">
	<div class="col-lg-8 p-r-0 title-margin-right">
		<div class="page-header">
			<div class="page-title">
				<h1>
					RegisterBoard <span></span>
				</h1>
			</div>
		</div>
	</div>
	<!-- /# column -->
	<div class="col-lg-4 p-l-0 title-margin-left">
		<div class="page-header">
			<div class="page-title">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">Dashboard</a></li>
					<li class="breadcrumb-item active">Form-Basic</li>
				</ol>
			</div>
		</div>
	</div>
	<!-- /# column -->
</div>


<div class="row">
	<div class="col-lg-9">
		<div class="card">
			<div class="card-body">
				<div class="basic-form">
					<form action="/board/insertBoard" method="post"
						 enctype="multipart/form-data" id="registerForm">
						<div class="form-group">
							<input type="text" class="form-control input-flat "
								placeholder="제목" id="title" name="board_title">
						</div>
						<div class="form-group">
							 <select id="boardType"
								name="board_type" class="form-control input-flat">
								<option selected="selected" value="null">선택</option>
								<c:forEach var="e" items="${boardTypeList}">
									<option value="${e.type_code}">${e.type_name}</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<textarea id="summernoteContent"
							name="board_content"></textarea>
						</div>
						<div class="form-group">
							<input type="file" multiple="multiple" name="file_list" class="form-control input-flat">
						</div>
						<div class="form-group pull-right">
							<button type="button" id="btnList" class="btn btn-primary btn-outline  btn-sm">목록</button>
							<button type="button" class="btn btn-primary btn-sm" id="btnRegister">등록</button>
							<button type="submit" hidden="true" class="btn btn-primary btn-sm">등록</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- /# column -->
</div>

<script>
	$(document).ready(function() {
		$('#summernoteContent').summernote({
			tabsize : 2,
			height : 300
		});
	});

	$('#btnRegister').click(function(){
		//유효성 체크
		var title = $('#title').val();
		var boardType = $('#boardType').val();
		var content = $('#summernoteContent').val();

		if (title == '' && boardType == 'null' && content == '') {
			bootbox.alert("입력값이 없습니다.");
			return false;
		} else if (title == '') {
			bootbox.alert("제목을 입력해주세요");
			return false;
		} else if (boardType == 'null') {
			bootbox.alert("분류를 선택해주세요.");
			return false;
		} else if (content == '') {
			bootbox.alert("내용을 입력해주세요")
			return false;
		}
		
		return bootbox.confirm("등록하시겠습니까?", function(result) {
			if(result == true){
				$('#registerForm').submit();
			}
		});
	});
	
		
	$('#btnList').click(function() {
		location.href = "/board/boardList";
	});
</script>

<%@ include file="/WEB-INF/views/footer.jsp"%>