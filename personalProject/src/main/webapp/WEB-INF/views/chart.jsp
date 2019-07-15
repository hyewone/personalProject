<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="/assets/dist/Chart.min.js"></script>
<script src="/assets/dist/Chart.bundle.js"></script>
<script src="/assets/dist/Chart.bundle.min.js"></script>
<script src="/assets/dist/Chart.js"></script>
<script src="/assets/dist/utils.js"></script>
<link rel="stylesheet" href="/assets/dist/Chart.css">
<link rel="stylesheet" href="/assets/dist/Chart.min.css">

<style>
canvas {
	-moz-user-select: none;
	-webkit-user-select: none;
	-ms-user-select: none;
}

.firstRow {
	height: 350px;
}

.secondRow {
	height: 550px;
}

.chartjs-size-monitor {
	display: inline-block !important;
}
</style>
<div class="row">
	<div class="card shadow col-md-4 firstRow">
		<div id="canvas-holder">
			<canvas id="radialBar1"></canvas>
		</div>
	</div>
	<div class="card shadow col-md-4 firstRow">
		<div id="canvas-holder">
			<canvas id="radialBar2"></canvas>
		</div>
	</div>
	<div class="card shadow col-md-4 firstRow">
		<div id="canvas-holder">
			<canvas id="pieChart"></canvas>
		</div>
	</div>
</div>
<div class="row">
	<div class="card shadow col-md-12 secondRow"
		style="text-align: center;">
		<div id="canvas-holder" style="width: 1000px; height: 500px;">
			<canvas id="lineChart"></canvas>
		</div>
	</div>
</div>
<script>
	var randomScalingFactor = function() {
		return Math.round(Math.random() * 100);
	};

	function fnChart1(data) {
		console.log(data);
		console.log(data.GPA);
		
		var pullGpa = 4.3;
		var remainderGPA = pullGpa - data.GPA;
		
		var config1 = {
			type : 'doughnut',
			data : {
				datasets : [ {
					data : [ data.GPA, remainderGPA ],
					backgroundColor : [ window.chartColors.blue, "#D3D3D3" ],
					label : 'Dataset 1'
				} ],
				labels : [ 'GPA' ]
			},
			options : {
				responsive : true,
				legend : {
					position : 'top',
				},
				title : {
					display : true,
					text : 'GPA'
				},
				animation : {
					animateScale : true,
					animateRotate : true
				},
				cutoutPercentage : 80
			}
		};

		var ctx1 = document.getElementById('radialBar1').getContext('2d');
		window.myDoughnut = new Chart(ctx1, config1);
	}

	function fnChart2(data) {
		console.log(data);
		console.log(data.COMPLETE_CREDIT);
		
		var pullCredit = 150;
		var beforeCompleteCrefit = pullCredit - data.COMPLETE_CREDIT;
		
		var config2 = {
			type : 'doughnut',
			data : {
				datasets : [ {
					data : [ data.COMPLETE_CREDIT, beforeCompleteCrefit],
					backgroundColor : [ window.chartColors.red, "#D3D3D3" ],
					label : 'Dataset 1'
				} ],
				labels : [ '취득학점' ]
			},
			options : {
				responsive : true,
				legend : {
					position : 'top',
				},
				title : {
					display : true,
					text : '취득학점'
				},
				animation : {
					animateScale : true,
					animateRotate : true
				},
				cutoutPercentage : 80
			}
		};

		var ctx2 = document.getElementById('radialBar2').getContext('2d');
		window.myDoughnut = new Chart(ctx2, config2);
	}

	function fnChart3(data) {
		console.log(data);
		console.log(data[0].GRADE_CODE);
		console.log(data[0].GRADE_DATA);
		
		var array_grade_data = [];
		var array_grade_label = [];
		
		for(var i= 0; i < data.length; i++){
			array_grade_data.push(data[i].GRADE_DATA);
		}
		
		for(var i= 0; i < data.length; i++){
			array_grade_label.push(data[i].GRADE_CODE);
		}
		
		var config3 = {
			type : 'pie',
			data : {
				datasets : [ {
					data : array_grade_data,
					backgroundColor : [ "#ff9999", "#ffff99", "#99ffbb",
							"#ffccdd", "#9999ff", "#9999ff" ],
					label : 'Dataset 1'
				} ],
				labels : array_grade_label
			},
			options : {
				responsive : true,
				title : {
					display : true,
					text : '학점 분포'
				}
			}
		};
		var ctx3 = document.getElementById('pieChart').getContext('2d');
		window.myPie = new Chart(ctx3, config3);
	}

	function fnChart4(data) {
		
		console.log(data);
		console.log(data[0].YEAR_NO);
		console.log(data[0].SEMESTER_NO);
		console.log(data[0].WHOLE_AVERAGE_CREDIT);
		console.log(data[0].MY_AVERAGE_CREDIT);
		
		var array_whole_average = [];
		var array_my_average = [];
		
		for(var i in data){
			console.log(i);
			array_whole_average[i] = data[i].WHOLE_AVERAGE_CREDIT;
			array_my_average[i] = data[i].MY_AVERAGE_CREDIT;
		}
		console.log(array_whole_average);
		console.log(array_my_average);
		
		var config4 = {
			type : 'line',
			data : {
				labels : [ '1학년 1학기', '2학기', '2학년 1학기', '2학기', '3학년 1학기',
						'2학기', '4학년 1학기', '2학기' ],
				datasets : [
						{
							label : '학기별 내 학점',
							backgroundColor : window.chartColors.red,
							borderColor : window.chartColors.red,
							data : array_my_average,
							fill : false,
						},
						{
							label : '학기별 평균 학점',
							fill : false,
							backgroundColor : window.chartColors.blue,
							borderColor : window.chartColors.blue,
							data : array_whole_average,
						} ]
			},
			options : {
				responsive : true,
				title : {
					display : true,
					text : '학기별 학점 비교'
				},
				tooltips : {
					mode : 'index',
					intersect : false,
				},
				hover : {
					mode : 'nearest',
					intersect : true
				},
				scales : {
					xAxes : [ {
						display : true,
						scaleLabel : {
							display : true,
							labelString : '학기'
						}
					} ],
					yAxes : [ {
						display : true,
						scaleLabel : {
							display : true,
							labelString : '학점'
						}
					} ]
				}
			}
		};
		var ctx4 = document.getElementById('lineChart').getContext('2d');
		window.myLine = new Chart(ctx4, config4);
	}

	window.onload = function() {
		
		//각자 ajax 통신 시작
		$.ajax({
			url : "/board/do.averageCredit",
			type : "get",
			dataType : "json",
			data : {
				"userNo" : $('#sessionUserNo').val()
			},
			success : function(responseData) {
				fnChart1(responseData);
			}
		});
		
		$.ajax({
			url : "/board/do.completeCredit",
			type : "get",
			dataType : "json",
			data : {
				"userNo" : $('#sessionUserNo').val()
			},
			success : function(responseData) {
				fnChart2(responseData);
			}
		});
		
		$.ajax({
			url : "/board/do.gradePercent",
			type : "get",
			dataType : "json",
			data : {
				"userNo" : $('#sessionUserNo').val()
			},
			success : function(responseData) {
				fnChart3(responseData);
			}
		});
		
		$.ajax({
			url : "/board/do.gradeLineCredit",
			type : "get",
			dataType : "json",
			data : {
				"userNo" : $('#sessionUserNo').val()
			},
			success : function(responseData) {
				fnChart4(responseData);
			}
		});
		
	};
</script>

<%@ include file="/WEB-INF/views/footer.jsp"%>