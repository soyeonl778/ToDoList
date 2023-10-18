<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="/resources/css/board02/board02.css">
<title>게시판</title>
</head>
<body>
	<div class="header-wrapper">
		<div class="header pagewidth">
			<h1>게 시 판</h1>
			<h2>Seungho's Practice MiniProject</h2>
		</div>
	</div>
	<div class="nav-wrapper">
		<div class="nav pagewidth">
			<ul>	
				<li class="selected"><a href="javascript:void(0);">Board</a></li>
			</ul>
		</div>
	</div>
	<div class="pagewidth">
		<div class="page-wrap">
			<div id="boardArea" class="content">
				<!-- CONTENT -->
				<h3>게시 목록</h3>
				<table class="table table-hover">
					<thead class="table-light tHead">
						<tr class="theadTr">
							<th scope="col">글번호</th>
							<th scope="col">글제목</th>
							<th scope="col">작성자</th>
							<th scope="col">날짜</th>
						</tr>
					</thead>
					
					<tbody class="table-group-divider tBody">

					</tbody>
				</table>
				
				<div class="pagination"></div>
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
	<div style="font-size: 0.8em; text-align: center;">
		<br />
		Design downloaded from Zeroweb.org: <a href="http://www.zeroweb.org">Free website templates, layouts, and tools.</a><br />
		<br />
	</div>
<!-- 부트스트랩 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script>

function changePage(newPage) {
	page = newPage;
	pagination();
}

let page = 1;

function pagination() {
	
	$.ajax({
		url: "selectBoardList?page=" + page,
		method: "GET",
		dataType: "json",
		success: function(res) {
			
			let textArea = document.querySelector('.tBody');
			let contents = "";
			let currentPage = res.currentPage;
			let totalpage = res.totalPages;
			let paginationArea = document.querySelector('.pagination');
			let paginationBtn = "";
			
			if(res.list.length > 0) {
				
				for(let i = 0; i < res.list.length; i++) {
					contents += "<tr>";
					contents += 	"<th scope='row'>" + res.list[i].rownum + "</th>";
					contents += 	"<td>" + res.list[i].boardDesc + "</td>";
					contents += 	"<td>" + res.list[i].userName + "</td>";
					contents += 	"<td>" + res.list[i].createDate + "</td>";
					contents += "</tr>";
				}
				
				textArea.innerHTML = contents;
				
				for(let i = 1; i <= totalpage; i++) {
					
					if(i === currentPage) {
						paginationBtn += "<button class='btn btn-dark' disabled>" + i + "</button>";
					} else {
						paginationBtn += "<button class='btn btn-outline-dark' onclick='changePage(" + i + ")'>" + i + "</button>";
					}
				}
				
				paginationArea.innerHTML = paginationBtn;
			}
		},
		error: function(e) {
			console.log(e);
		}
	})
};

$(document).ready(function() {
	

	
	$('#boardArea').on('click', '.table>tbody>tr', function() {
		
		$('.sidebar').show();
		
	});
	
	pagination();
	
});

</script>

</body>
</html>