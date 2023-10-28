<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!-- 제이쿼리 CDN-->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

<!-- css -->
<link rel="stylesheet" href="/resources/css/board/main.css">
<title>게시판</title>
</head>
<body>
	<div class="header-wrapper">
		<div class="header pagewidth">
			<h1>게 시 판</h1>
			<h2>여기는 소연이 공간</h2>
		</div>
	</div>
	<div class="nav-wrapper">
		<div class="nav pagewidth">
			<ul>	
				<li class="selected"><a href="#">Board</a></li>
			</ul>
		</div>
	</div>
	<div class="pagewidth">
		<div class="page-wrap">
			<div id="boardArea" class="content">
				<!-- CONTENT -->
				<h3>TOP 5</h3>
				
				<br>
				
				<a href="list.bo" style="float : right;">더보기&raquo;</a>
				<table class="table table-hover">
					<thead class="table-light tHead">
						<tr class="theadTr">
							<th scope="col">글번호</th>
							<th scope="col">글제목</th>
							<th scope="col">작성자</th>
							<th scope="col">날짜</th>
						</tr>
					</thead>
					<tbody>
						<!-- 조회수 가장 높은 상위 5개 게시글 조회 (ajax) -->
					</tbody>
				</table>
			</div>
			
			<div class="sidebar" style="display: none;">	
				<div class="openSideWrap">
					<div class="sideOpen">
						상세 정보 노출 영역입니다.
					</div>
				</div>	
			</div>
		
			<div class="clear"></div>		
		</div>
		<div class="footer">
			<p><a href="http://validator.w3.org/check/referer" title="valid XHTML">XHTML</a> | <a href="http://jigsaw.w3.org/css-validator/check/referer" title="valid CSS">CSS</a> &nbsp;&nbsp; &copy; YourWebsiteName. Design: <a href="http://www.spyka.net">spyka webmaster</a> | <a href="http://www.justfreetemplates.com">Free Web Templates</a></p> 
		</div>
	</div>
	
<!-- 부트스트랩 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script>

$(document).ready(function() {
	
	$('#boardArea').on('click', '.table>tbody>tr', function() {
		
		$('.sidebar').show();
		
	});
});

$(document).on("click", "#boardList>tbody>tr", function() {
	location.href = "detail.bo.?bno=" + $(this).children().eq(0).text();	
});


</script>

</body>
</html>