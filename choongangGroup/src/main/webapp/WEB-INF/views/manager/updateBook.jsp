<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- bottSTrap CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">		
<!-- bootStrap Icons -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<!-- jQuery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- font awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- CSS -->
<link rel="stylesheet" href="/css/styles2.css">
<link rel="stylesheet" href="/css/stylesLec.css">
<style type="text/css">
	#container_box table td { width:100px; }
	section#container { padding:20px 0; border-top:2px solid #eee; border-bottom:2px solid #eee; }
	section#container::after { content:""; display:block; clear:both; }
	aside { float:left; width:200px; }
	div#container_box { float:right; width:calc(100% - 200px - 20px); }
	aside { float : left; width 200px;}	
	aside ul li { text-align:center; margin-bottom:10px; }
	aside ul li a { display:block; width:100%; padding:10px 0;}
 	aside ul li a:hover { background:#eee; }
	.inputArea { border:1px; margin:10px 0; }
	select { width:100px; }
	label { display:inline-block; width:70px; padding:5px; }
	label[for='bookInfo'] { display:block; }
	input { width:150px; }
	textarea#bookInfo { width:400px; height:180px; }
</style>
<script type="text/javascript">
$(function(){
 	var select_cateCode = '${books.cateCode}';
 	var select_cateParent = '${books.cateParent}';
  	var select_cateName = '${books.cateName}';

  if(select_cateParent != null && select_cateParent != '') {
   $(".category1").val(select_cateParent);
   $(".category2").val(select_cateCode);
   $(".category2").children().remove();
   $(".category2").append("<option value='"
         + select_cateCode + "'>" + select_cateName + "</option>");
  } else {
   $(".category1").val(select_cateCode);
   //$(".category2").val(select_cateCode);
   // select_cateCod가 부여되지 않는 현상이 있어서 아래 코드로 대체
   $(".category2").append("<option value='" + select_cateCode + "' selected='selected'>전체</option>");
  } 
});
  /* var select_cateCode = '${books.cateCode}';
  var select_cateParent = '${books.cateParent}';
  var select_cateName = '${books.cateName}';

  if (select_cateParent != null && select_cateParent != '') {
  $(".category1").val(select_cateParent);
  //$(".category2").val(select_catecode);
  $(".category2").children().remove();
  $(".category2").append("<option value='" + select_cateParent + "'>전체</option>");
  //$(".category2").append("<option value='" + select_catecode + "' selected='selected'>" + select_catename + "</option>");

  var cate2Arr = new Array();
  var cate2Obj = new Object();

  // 2차 분류 셀렉트 박스에 삽입할 데이터 준비
  for (var i = 0; i < jsonData.length; i++) {

  if (jsonData[i].tier == "2") {
  cate2Obj = new Object(); //초기화
  cate2Obj.cateCode = jsonData[i].cateCode;
  cate2Obj.cateName = jsonData[i].cateName;
  cate2Obj.cateParent = jsonData[i].cateParent;

  cate2Arr.push(cate2Obj);
  }
  }

  var cate2Select = $("select.category2");

  for (var i = 0; i < cate2Arr.length; i++) {
  if (select_cateParent == cate2Arr[i].cateParent) {
  if (select_cateCode == cate2Arr[i].cateCode) {
  cate2Select.append("<option value='" + select_cateCode + "' selected='selected'>" + select_cateName + "</option>");
  } else {
  cate2Select.append("<option value='" + cate2Arr[i].cateCode + "'>" + cate2Arr[i].cateName + "</option>");
  }
  }
  }

  } else {
  $(".category1").val(select_cateCode);
  //$(".category2").val(select_cateCode);
  // select_cateCode가 부여되지 않는 현상이 있어서 아래 코드로 대체
  $(".category2")
  .append("<option value='" + select_cateCode + "' selected='selected'>전체</option>");
  }
}); */

/* $("#back_Btn").click(function(){
	  window.history.back();
	  //location.href = "/student/detailBookList?bookId=" + ${books.bookId};
	  
	 }); */

	 function goBack(){
		 window.history.back();
	 }
  </script>
<script type="text/javascript">
/* $("#bookImg").change(function(){
		
		var reader = new FileReader;
		reader.onload=function(data){
			$(".select_img img").attr("src", data.target.result).width(500);
		reader.readAsDataURL(this.files[0]);
	}
}); */
function readURL(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('preview').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('preview').src = "";
	  }
	}

</script>
</head>
<body class="" id="body-pd" onload="printClock()">
    <!-- header -->
    <!-- <nav class="navbar navbar-expand-lg navbar-dark bd-navbar bg-light sticky-top position-fixed fixed-top w-100" style="position : absolute">
        <a class="navbar-brand">
            <button class="btn ms-2" type="button">
                <img class="img-fluid" src="/images/logo2.png" alt="logo2" style="height: 40px;">
            </button>
        </a>
    </nav> -->
    <nav class="navbar navbar-expand-lg navbar-dark bd-navbar bg-light sticky-top position-fixed fixed-top w-100" style="position : absolute">
        <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between">
          <a href="/" class="navbar-brand">
            <img class="img-fluid" src="/images/logo2.png" alt="logo2" style="height: 40px;"><use xlink:href="#bootstrap"></use></svg>
          </a>
    
          <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
  			<jsp:include page="navHeader.jsp"></jsp:include>
          </ul>
        </header>
    </nav>
    <!-- /header -->
    <!-- side nav bar -->
    <div class="l-navbar" id="navbar">
        <nav class="navv">
            <div>
                <div class="nav__brand">
                    <ion-icon name="menu-outline" class="nav__toggle" id="nav-toggle"></ion-icon>
                    <a href="/manager/main" class="nav__logo">교재관리</a>
                </div>
                <div class="nav__list">
                    <div href="${pageContext.request.contextPath}/manager/bookList" class="nav__link collapses">
						<!-- <ion-icon name="folder-outline" class="nav__icon"></ion-icon> -->
						<!-- <i class="bi bi-gear-fill nav__icon" name="folder-outline"></i> -->
						<i class="bi bi-book nav__icon" name="folder-outline"></i>
						<span class="nav_name">교재관리</span>

						<ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>

						<ul class="collapse__menu" style="width: 200px;">
							<a href="/manager/bookList" class="collapse__sublink">교재 목록</i></a></br>
							<a href="/manager/bookInsert" class="collapse__sublink">교재 입력</i></a></br>
                            <a href="/manager/adminOrderList" class="collapse__sublink">주문 관리</i></a></br>
						</ul>
					</div>
                </div>
                <a href="/logout" class="nav__link">
                    <ion-icon name="log-out-outline" class="nav__icon"></ion-icon>
                    <span class="nav_name">Log out</span>
                </a>
            </div>
        </nav>
    </div>
    <!-- /side nav bar -->
    <!-- main content -->
    <div class="container-fluid w-100" style=" background-color: rgb(214, 225, 237)">
        <div class="row">
        
            
         	<jsp:include page="contentHeader.jsp"></jsp:include>
                    <!-- card header -->
                    <div class="col-7 rounded-top text-white overflow-auto pt-2 fw-bold" style="background-color: rgb(39, 40, 70); height: 40px; margin-left:250px;"> 
                        <i class="bi bi-bookmark-fill me-2"></i>교재 관리<i class="bi bi-chevron-right"></i>교재 수정<i class="bi bi-chevron-right"></i>${books.bookName }
                    </div>
                    <!-- card content -->  
                    <div class="col-7 rounded-bottom overflow-auto bg-light p-3" style="min-height: 550px; margin-left: 250px;"> 
						<h1>
								<div class="d-flex justify-content-end">
									<a href="/manager/bookList"><i class="bi bi-book" style="color: black; margin-right: 20px;"></i></a>
									<a href="/manager/bookInsert"><i class="bi bi-pencil" style="color: black; margin-right: 20px;"></i></a>
									<a href="/manager/adminOrderList"><i class="bi bi-receipt" style="color: black; margin-right: 20px;"></i></a>
								</div>
							</h1>
						<h1>${books.bookName }</h1>
                    <section id="container">
							<form role="form" method="post" autocomplete="off" enctype="multipart/form-data">
								<input type="hidden" name="bookId" value="${books.bookId}"/>
								
								 <label>중분류</label>
									<select class="category2" name="cateCode">
									 	<option value="">선택</option>
									</select>
								<div class="inputArea">
								</div>
								
								<div class="inputArea">
								<label for="bookName" style="font-weight: bold; width: auto; font-size: 20px;" >교재명</label>
								 <span style="margin-left: 20px;"><input type="text" id="bookName" name="bookName" value="${books.bookName }" /></span>
								</div>
								<div class="inputArea">
								<label for="publisher" style="font-weight: bold; width: auto; font-size: 20px;">저자</label>
								  <span style="margin-left: 40px;"><input type="text" id="publisher" name="publisher" value="${books.publisher }" /></span>
								</div>
								
								<div class="inputArea">
								 <label for="bookPrice" style="font-weight: bold; width: auto; font-size: 20px;">교재가격</label>
								 <span><input type="number" id="bookPrice" name="bookPrice" value="${books.bookPrice }" /> 원</span>
								</div>
								
								<div class="inputArea">
								 <label for="bookStock" style="font-weight: bold; width: auto; font-size: 20px;">교재수량</label>
								 <span><input type="number" id="bookStock" name="bookStock" value="${books.bookStock }" /> 권 </span>
								</div>
								
								<div class="inputArea">
								 <label for="bookInfo" style="font-weight: bold; width: auto; font-size: 20px;">교재소개</label>
								 <span><textarea rows="5" cols="50" id="bookInfo" name="bookInfo" value="${books.bookInfo }">${books.bookInfo }</textarea></span>
								</div>
								<hr>
								<div class="inputArea">
								 <label for="bookImg" style="width: auto;"></label>
								 <input type="file" id="bookImg" name="file" accept=".png, .jpeg, .gif" onchange="readURL(this)" style="height: 30px;" />
								<div class="select_img">
								<img id="preview" style="width: 500px; height: 300px; text-align: center; object-fit: contain;" src="${books.bookImg }" />
								<input type="hidden" name="bookImg" value="${books.bookImg }"/>
								<input type="hidden" name="bookThumbImg" value="${books.bookThumbImg }"/>
								</div>
								
								<div class="inputArea">
								<div class="d-flex justify-content-center">
									<button type="submit" id="update_Btn" class="btn btn-light" style="margin-right: 10px;">수정</button>
						 			<button type="button" id="back_Btn" class="btn btn-light" value="뒤로가기" onclick="goBack();" >뒤로가기</button>
						 		</div>
								</div>
						</form>
					</section>
                    </div>
                    <!-- footer -->
         
                </div>
        </div>
        <jsp:include page="../footer.jsp"></jsp:include>
    <!-- IONICONS -->
    <script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
    <!-- JS -->
    <script src="/js/main.js"></script>
</body>
</html>
