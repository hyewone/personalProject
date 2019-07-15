<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/header.jsp"%>

<style>
#divPageHeading {
	
}

#divBoardTable {
	width: 100%;
	margin-left: 5px;
	margin-right: 5px;
}

.pagination {
	margin-left: 50%;
	margin-right: 50%;
}

#dataTable_paginate {
	margin-top: 20px;
}

</style>


<!-- Page Heading -->
<div class="row">
	<div class="col-lg-8 p-r-0 title-margin-right">
		<div class="page-header">
			<div class="page-title">
				<h1>
					BoardList <span></span>
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

	<!-- DataTales Example -->
	<div class="card shadow mb-4" id="divBoardTable">
		<div class="card-header py-3" style="text-align: right; ">
			<form action="/board/boardList" method="post"
				onsubmit="return fnOnSubmit()">
				<select id="viewCount" name="view_count" class="form-control pull-left" style="width: 100px; display: inline;">
					<option selected="selected" value="10">10</option>
					<option value="20">20</option>
					<option value="30">30</option>
				</select>
				<input type="checkbox" id="periodYN" name="period_yn"
					value="${searchDto.period_yn}"> <input type="date"
					id="startDate" name="start_date" class="form-control" style="width: 160px; display: inline;"> <input type="date"
					id="endDate" name="end_date" class="form-control" style="width: 160px; display: inline;"> <select id="boardType"
					name="board_type" class="form-control" style="width: 100px; display: inline;">
					<option selected="selected" value="default">분류</option>
					<c:forEach var="e" items="${boardTypeList}">
						<option value="${e.type_code}">${e.type_name}</option>
					</c:forEach>
				</select> <select id="searchType" name="search_type" class="form-control" style="width: 100px; display: inline;">
					<option selected="selected" value="default">선택</option>
					<option value="board_title">제목</option>
					<option value="board_writer">작성자</option>
				</select>
				<input type="search" id="searchWord" name="search_word" class="form-control" style="width: 200px; display: inline;"> <input
					type="submit" value="조회" class="btn btn-primary btn-sm">
			</form>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered table-hover" id="dataTable"
					width="100%" cellspacing="0">
					<thead>
						<tr>
							<td>순번</td>
							<td>분류</td>
							<td>제목</td>
							<td>작성자</td>
							<td>작성일</td>
							<td>조회수</td>
						</tr>
					</thead>
					<tbody id="listTableBody">
						<c:if test="${boardList == null}">
							<tr>
								<td colspan="7"><h2>게시물이 존재하지 않습니다.</h2></td>
							</tr>
						</c:if>
						<c:if test="${boardList != null}">
							<c:forEach var="e" items="${boardList}">
								<tr>
									<td>${e.board_no}</td>
									<td>${e.board_type_name}</td>
									<td>${e.board_title}</td>
									<td>${e.writer_name}</td>
									<td><fmt:parseDate var="dateString" value="${e.reg_dt}"
											pattern="yyyy-MM-dd HH:mm:ss" /> <fmt:formatDate
											value="${dateString}" pattern="yyyy.MM.dd" /></td>
									<td>${e.view_count}</td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>
			<div class="dataTables_paging_simple_numbers "
				id="dataTable_paginate">
				<ul class="pagination">
					<li class="paginate_button page-item previous disabled"
						id="btnPrevious"></li>
						<c:forEach var="i" begin="1" end="${boardList[0].total_page}"
							step="1">
							<li class="paginate_button page-item">
							<a href="/board/boardList?current_page=${i}" class="page-link" style="<c:if test="${boardList[0].current_page == i}">background-color: #6495ED; color:white;</c:if>"
							>
							<c:out value="${i}"></c:out></a></li>
						</c:forEach>
				</ul>

			</div>
			<div style="text-align: right; margin-right: 15px;">
				<button type="button" id="btnRegister"
					class="btn btn-primary btn-fw">등록하기</button>
			</div>
		</div>
	</div>

</div>


<script>
	$(document).ready(function() {

		//date값 기본세팅 및 검색조건 세팅
		//view_count 


	//td클릭시 해당 td의 boardNo을 얻어서 goto detailPage

	$('#listTableBody > tr').click(function() {
		var boardNo = $(this).find('td').eq(0).text();
		console.log(boardNo);
		location.href = "/board/boardDetail?boardNo=" + boardNo;
	});

	function fnOnSubmit() {
		//검색유효성체크

	}

	$('#btnRegister').click(function() {
		location.href = "/board/insertBoardPage";
	});
});
</script>

<%@ include file="/WEB-INF/views/footer.jsp"%>