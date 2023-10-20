<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="today" value="<%= new java.util.Date() %>" />
<c:set var="nowDate">
	<fmt:formatDate value="${today}" pattern="yyyy-MM-dd" />
</c:set>
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
				<div class="titleContainer">
					<h3>게시 목록</h3>
					<div class="btnWrap">
						<button type="button" class="btn btn-outline-success" onclick="newBoardWrite();">새 글 작성</button>
					</div>
				</div>
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
				<div class="closeBtn">✖️</div>
				<form class="sidebarForm">
					<div class="openSideWrap">
					
						<div class="sidebarTitle">
							<input class="boardTitleArea" type="text" name="titleInput" placeholder="제목을 입력해주세요.">
							<input class="hiddenBoardNo" type="text" style="display: none;" value="">
						</div>
						
						<div class="sidebarDesc">
							<div class="sidebarSubTitle">
								<input class="dateInput" type="text" value="${ nowDate }" name="dateInput" readonly>
								<input class="nameInput" type="text" value="" name="nameInput" placeholder="이름을 입력해주세요">
							</div>
						</div>
						
						<div class="sidebarContent">
							<textarea class="boardTextArea" rows="1" name="descTextArea"></textarea>
						</div>
						
						<div class="boardSubmitBtn">
							<button type="button" class="btn btn-outline-success insertPost" onclick="insertPost()">작성완료</button>
							<button type="button" class="btn btn-outline-info changeForm" style="display: none;" onclick="changeForm()">수정</button>
							<button type="button" class="btn btn-outline-danger deletePost" style="display: none;" onclick="deletePost()">삭제</button>
							<button type="button" class="btn btn-outline-primary confirmUpdate" style="display: none;" onclick="confirmUpdate()">수정완료</button>
							<button type="button" class="btn btn-outline-secondary goBack" style="display: none;" onclick="goBack()">뒤로가기</button>
						</div>
					</div>	
				</form>
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

let page = 1;

// 다른 페이지 눌렀을 때 새로운 리스트 조회
function changePage(newPage) {
	page = newPage;
	pagination();
};

// 전체 리스트 조회 및 페이지네이션 처리
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
					
					let originalDate = new Date(res.list[i].createDate);
					
					let options = {
							year: 'numeric',
							month: '2-digit',
							day: '2-digit',
							hour: '2-digit',
							minute: '2-digit',
							hour12: true
					};
					
					let formmattedDate = originalDate.toLocaleString('ko-KR', options);					
					
					contents += "<tr>";
					contents += 	"<th scope='row'>" + res.list[i].rownum + "</th>";
					contents += 	"<td>" + res.list[i].boardTitle + "</td>";
					contents += 	"<td>" + res.list[i].userName + "</td>";
					contents += 	"<td>" + formmattedDate + "</td>";
					contents += 	"<td class='hiddenNo' style='display: none;'>" + res.list[i].boardNo + "</td>";
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

// 작성버튼 클릭 시 사이드바 활성화
function newBoardWrite() {

	if($('.sidebar').css('display') == 'block') {
		location.reload();
		$('.sidebar').toggle();
	} else {
		$('.nameInput').css("border-bottom", "1px solid black");
		$('.sidebar').toggle();
	}
	
};

// 새 글 작성
function insertPost() {
	
	let formData = $('.sidebarForm').serialize();
	
	$.ajax({
		url: "insertPost",
		method: "post",
		data: formData,
		success: function(res) {
			if(res > 0) {
				location.reload();
			}
		},
		error: function(e) {
			console.log("error", e);
		}
	})
};

// 선택한 게시글 상세조회
function sendSelectAction(hiddenNo) {
    $.ajax({
        url: "selectBoardOne",
        type: "get",
        dataType: "json",
        data: { hiddenNo: hiddenNo },
        success: function (res) {
            $('.boardTitleArea').val(res.boardTitle);
            $('.nameInput').val(res.userName);
            $('.boardTextArea').val(res.boardDesc);
            $('.hiddenBoardNo').val(res.boardNo);
            $('.boardTitleArea').attr('readonly', 'readonly');
            $('.nameInput').attr('readonly', 'readonly');
            $('.boardTextArea').attr('readonly', 'readonly');
            $('.insertPost').hide();
            $('.confirmUpdate').hide();
            $('.goBack').hide();
            $('.changeForm').show();
            $('.deletePost').show();
            $('.sidebar').show();
            $('.nameInput').css("border-bottom", "unset");
        },
        error: function (e) {
            console.log("err", e);
        }
    });
};

// 클릭한 게시글 고유 번호 추출
$('#boardArea').on('click', '.table>tbody>tr', function () {
    let hiddenNo = $(this).find('.hiddenNo').text();

    if ($('.sidebar').css('display') == 'none') {
    	sendSelectAction(hiddenNo);
    } else {
    	sendSelectAction(hiddenNo);
    }
});


// 뒤로가기 이벤트
function goBack() {
	
	let hiddenBoardNo = $('.hiddenBoardNo').val();
	
	sendSelectAction(hiddenBoardNo);
};


// 수정버튼 클릭 시 폼 양식 변경
function changeForm() {
	
	$('.boardTitleArea').removeAttr('readonly');
	$('.boardTextArea').removeAttr('readonly');
	$('.boardTitleArea').focus();
	
	$('.confirmUpdate').show();
	$('.goBack').show();
	$('.changeForm').hide();
	$('.deletePost').hide();
};

// 게시글 수정
function confirmUpdate() {
	
	let boardTitle = $('.boardTitleArea').val();
	let boardDescription = $('.boardTextArea').val();
	let boardHiddenNo = $('.hiddenBoardNo').val();

	$.ajax({
		url: "confirmUpdate",
		type: "post",
		data: {
			boardTitle: boardTitle,
			boardDesc: boardDescription,
			boardNo: boardHiddenNo
		},
		success: function(res) {
			if(res > 0) {
				location.reload();
			};
		},
		error: function(e) {
			console.log(e);
		}
	});
};


// 게시글 삭제
function deletePost() {
	
	let boardHiddenNo = $('.hiddenBoardNo').val();
	
	$.ajax({
		url: "deletePost",
		method: "get",
		data: {boardNo: boardHiddenNo},
		success: function(res) {
			if(res > 0) {
				location.reload();
				pagination();
			}
		},
		error: function(e) {
			console.log(e);
		}
	});
	
}


// 딛힘 버튼
$('.closeBtn').on('click', function() {
	
	$('.sidebar').hide();
	location.reload();
});

// 초기 화면 렌더링
$(document).ready(function() {
	
	pagination();
	
});

</script>

</body>
</html>