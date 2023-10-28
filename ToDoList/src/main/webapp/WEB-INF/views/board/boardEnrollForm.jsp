<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
<style>
        #enrollForm>table {width:100%;}
        #enrollForm>table * {margin:5px;}
</style>
<!-- css 부분 -->
<link rel="stylesheet" href="/resources/css/board/boardEnrollForm.css">
<title>글 작성하기</title>
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
	
    <div class="content">
        <br><br>
        <div class="innerOuter">
            <h2>게시글 작성하기</h2>
            <br>

            <form id="enrollForm" method="post" action="insertBoard.bo" enctype="multipart/form-data">
                <table align="center">
                    <tr>
                        <th><label for="title">제목</label></th>
                        <td><input type="text" id="title" class="form-control" name="boardTitle" required></td>
                    </tr>
                    <tr>
                        <th><label for="writer">작성자</label></th>
                        <td><input type="text" id="writer" class="form-control" name="userName" required></td>
                    </tr>
                    <tr>
                        <th><label for="content">내용</label></th>
                        <td><textarea id="content" class="form-control" rows="10" style="resize:none;" name="boardDesc" required></textarea></td>
                    </tr>
                </table>
                <br>

                <div align="center">
                    <button type="submit" class="btn btn-primary">등록하기</button>
                    <button type="reset" class="btn btn-danger">취소하기</button>
                </div>
            </form>
        </div>
        <br><br>

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
    
</body>
</html>