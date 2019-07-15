<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/header.jsp"%>

<!-- Page Heading -->
<div class="row">
	<div class="col-lg-8 p-r-0 title-margin-right">
		<div class="page-header">
			<div class="page-title">
				<h1>
					BoardDetail <span></span>
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
					<div class="form-group" style="border-bottom: 1px solid #e7e7e7;">
						<div id="divWriterName">
							<input type="hidden" value="${boardDto.board_no}" id="boardNo">
							<p>${boardDto.writer_name}</p>
						</div>
					</div>
					<div class="form-group" style="padding-bottom: 20px;">
						<div id="divTitle">
							<div style="float: left; width: 50%;">
								<p>
									<b>[${boardDto.board_type_name}]</b> ${boardDto.board_title}
								</p>
							</div>
							<div style="float: right; width: 50%; text-align: right;">
								<p>
									<fmt:parseDate var="dateString" value="${boardDto.reg_dt}"
										pattern="yyyy-MM-dd HH:mm:ss" />
									<fmt:formatDate value="${dateString}"
										pattern="yyyy-MM-dd HH:mm" />
								</p>
							</div>
						</div>
					</div>
					<div class="form-group"
						style="border-top: 1px solid #e7e7e7; border-bottom: 1px solid #e7e7e7; height: 350px;">
						<div id=divContent>
							<p>${boardDto.board_content}</p>
						</div>
					</div>
					<div class="form-group" style="border-bottom: 1px solid #e7e7e7;">
						<div id="divFileList" style="margin-bottom: 15px; margin-left: 10px;">
							<table>
								<c:forEach var="e" items="${boardFileList}">
									<tr>
										<c:set value="${e.physicalfile_name}${e.file_ext}"
											var="fileName"></c:set>
										<td><img src="/img/download.png"
													style="width: 25px; height: 25px; margin-right: 10px;" /></td>
										<td><a href="../resources/uploadFile/${fileName}"
											download>${e.originalfile_name}</a></td>
									</tr>
								</c:forEach>

							</table>
						</div>
					</div>
					<div class="form-group" style="width: 100%; margin-bottom: 60px;">
						<c:if test="${sessionScope.userInfo.user_no == boardDto.user_no}">
							<button type="button" id="btnUpdate"
								class="btn btn-primary btn-sm pull-right"
								style="margin-left: 3px;">수정</button>
							<button type="button" id="btnDelete"
								class="btn btn-primary btn-sm pull-right"
								style="margin-left: 3px;">삭제</button>
						</c:if>
						<button type="button" id="btnList"
							class="btn btn-primary btn-outline btn-sm pull-right">목록</button>
					</div>
					<div class="form-group card">
						<div id="divComment">
							<div id="divCommentTop" style="border-bottom: 2px solid #e7e7e7;">
								<span>댓글(0)</span><span>조회수 ${boardDto.view_count}</span>
							</div>
							<div>
								<c:forEach var="c" items="${commentList}">
									<div class="divCommentList"
										style="border-bottom: 1px solid #e7e7e7; padding-top: 5px; padding-bottom: 5px;">
										<div class="divCommentListHeader">
											<input type="hidden" name="groupNo" value="${c.group_no}">
											<input type="hidden" name="commentNo" value="${c.comment_no}">
											<c:if test="${'N' eq fn:trim(c.parent_yn)}">
												<span><img src="/img/arrow.png"
													style="width: 20px; height: 20px;" /></span>
											</c:if>
											<span>${c.user_name}</span> <span><fmt:parseDate
													var="commentDateString" value="${c.reg_dt}"
													pattern="yyyy-MM-dd HH:mm:ss" /> <fmt:formatDate
													value="${commentDateString}" pattern="yyyy.MM.dd HH:mm" /></span>
											<span><button type="button" class="btnShowSubComment"
													class="btn btn-primary btn-sm pull-right">답글</button></span>
											<c:if test="${sessionScope.userInfo.user_no == c.user_no}">
												<span><button type="button" class="btnRemoveComment" onclick="FnCommentDelete(${c.comment_no}, ${boardDto.board_no})">X</button></span>
											</c:if>
										</div>
										<c:if test="${'Y' eq fn:trim(c.parent_yn)}">
											<div style="margin-left: 10px;">${c.comment_content}</div>
										</c:if>
										<c:if test="${'N' eq fn:trim(c.parent_yn)}">
											<div style="margin-left: 30px;">${c.comment_content}</div>
										</c:if>
									</div>
								</c:forEach>
								<div id="divCommentRegister"
									style="border-top: 2px solid #e7e7e7;">
									<form action="/board/insertComment" method="post"
										onsubmit="return fnOnSubmit()">
										<div>
											<input type="hidden" id="boardNo" name="board_no"
												value="${boardDto.board_no}"> <input type="hidden"
												id="userNo" name="user_no" value="1"> <input
												type="hidden" id="parentYn" name="parent_yn" value="Y">
										</div>
										<div style="margin-top: 5px;">
											<textarea rows="3" cols="100%" name="comment_content"
												class="form-control"
												style="width: 95%; height: 70px; margin: 0, 0, 0, 0; float: left;"></textarea>
											<button type="submit" class="btn btn-primary btn-sm"
												style="height: 70px; float: rigth;">등록</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div id="divBeforeAfterBoard"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /# column -->
</div>

<div id="divSubComment" hidden="true" style="margin-top: 10px;">
	<form action="/board/insertComment" method="post"
		onsubmit="return fnOnSubmit()">
		<label></label> <input type="hidden" id="boardNo" name="board_no"
			value="${boardDto.board_no}"> <input type="hidden"
			id="groupNo" name="group_no"><input type="hidden"
			id="parentYn" name="parent_yn" value="N">
			<div style="margin-left: 30px; margin-right: 150px; display: inline-block;">
			<img src="/img/arrow.png"
			style="width: 20px; height: 20px; float: left;" />
			<textarea rows="3" cols="100%" name="comment_content" class="form-control"
				style="width: 80%; height: 70px; margin: 0, 0, 0, 0; float: left;"></textarea>
			<button type="submit" class="btn btn-primary btn-sm"
				style="height: 70px; float: left;">등록</button>
			</div>
	</form>
</div>

<script>
	//GO TO UPDATE_PAGE
	$('#btnUpdate').click(function() {
		var boardNo = $('#boardNo').val();
		location.href = "/board/updateBoardPage?boardNo=" + boardNo;
	});

	//DELETE
	$('#btnDelete').click(function() {
		var boardNo = $('#boardNo').val();
		bootbox.confirm("삭제하시겠습니까?", function(result) {
			if (result == true) {
				location.href = "/board/deleteBoard?boardNo=" + boardNo;
			}
		});
	});

	//GO TO LIST_PAGE
	$('#btnList').click(function() {
		//최근페이지값...보류
		location.href = "/board/boardList";
	});

	//SHOW SUBCOMMENT_DIV
	function fnAppendSubCommentBox(group_no, event) {

		debugger;
		console.log(group_no);
		console.log(this);
	}

	$('.btnShowSubComment').click(
			function() {

				var divSubCommentElement = $('#divSubComment');

				var target = $(this).parents('div.divCommentList');

				var groupNo = $(this).parents('div.divCommentListHeader')
						.children('input').attr('name', 'groupNo').val();

				//show div
				target.append(divSubCommentElement);
				divSubCommentElement.attr('hidden', false);

				//set group_no value
				$('#groupNo').val(groupNo);

			});
	
	function FnCommentDelete(commentNo, boardNo){
		console.log(commentNo);
		console.log(boardNo);
		bootbox.confirm("삭제하시겠습니까?", function(result) {
			if (result == true) {
				location.href = "/board/deleteComment?commentNo=" + commentNo + "&boardNo=" + boardNo;
			}
		});
	}
	//ONSUBMIT
	function fnOnSubmit() {
		//댓글입력안됐따 
	}
</script>

<%@ include file="/WEB-INF/views/footer.jsp"%>