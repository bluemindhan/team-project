<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<link rel="stylesheet" href="/css/styles.css">

    <title>SideBar sub menus</title>
</head>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	/* 현재 페이지 표시하기 */
	const urlParams = new URL(location.href).searchParams;
	var page = parseInt(urlParams.get('page'));
	var pageResult = page + 1; 
	console.log(pageResult);
	$(document).ready(function(){
		$('#page-item'+pageResult).addClass(' active');		
	})


	/* 즐겨찾기 추가기능 */
	function phoneLikeSave(vIndex){
		var user= $('#user'+vIndex).val();
		console.log(user);
		$.ajax({
			url 	: '/phoneLikeSave',
			data	: {userid : user},
			dataType: 'text',
			success : function(data){
				console.log("성공");
				$('#msg').text(data);
				 
			}
		});
	}
	
	/* 출근버튼 구현 */
	

	
	
</script>



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
            <li><a href="#" class="nav-link px-2 link-secondary">Home</a></li>
            <li><a href="#" class="nav-link px-2 link-dark">Features</a></li>
            <li><a href="#" class="nav-link px-2 link-dark">Pricing</a></li>
            <li><a href="#" class="nav-link px-2 link-dark">FAQs</a></li>
            <li><a href="#" class="nav-link px-2 link-dark">About</a></li>
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
                    <a href="#" class="nav__logo">Bedimcode</a>
                </div>
                <div class="nav__list">
                    <a href="#" class="nav__link active">
                        <ion-icon name="home-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">Dashboard</span>
                    </a>
                    <a href="#" class="nav__link">
                        <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">Messenger</span>
                    </a>

                    <div href="#" class="nav__link collapses">
                        <ion-icon name="folder-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">Projects</span>

                        <ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>

                        <ul class="collapse__menu">
                            <a href="#" class="collapse__sublink">Data</a>
                            <a href="#" class="collapse__sublink">Group</a>
                            <a href="#" class="collapse__sublink">Members</a>
                        </ul>
                    </div>

                    <a href="#" class="nav__link">
                        <ion-icon name="pie-chart-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">Analytics</span>
                    </a>

                    <div href="#" class="nav__link collapses">
                        <ion-icon name="people-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">Team</span>

                        <ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>

                        <ul class="collapse__menu">
                            <a href="#" class="collapse__sublink">Data</a>
                            <a href="#" class="collapse__sublink">Group</a>
                            <a href="#" class="collapse__sublink">Members</a>
                        </ul>
                    </div>

                    <a href="#" class="nav__link">
                        <ion-icon name="settings-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">Settings</span>
                    </a>
                </div>
                <a href="#" class="nav__link">
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
        
            
            
            <!-- content header -->
              <div class="col-12 pt-4" style="height: 150px; background-color: rgb(95, 142, 241)">
                <div class="row">
                	<div class="col-6">
		                <div class="d-flex flex-row mb-3">
		                    <div>
		                        <span class="text-white h4">안녕하세요. <span class="fw-bold">김중앙</span>님!</span>
		                    </div>
		                    <div class="border border-1 border-white border-bottom rounded-pill text-white px-2 pt-1 ms-2 h6">교수</div>
		                    <div>
		                        <i class="text-white bi-gear-fill mx-2"></i>
		                    </div>
		                </div>
		                <div class="row">
		                    <div>
		                        <span class="text-white h6">이공대학 컴퓨터공학과 | 정교수</span>
		                    </div>
		                </div>
		                <div class="d-flex flex-low">
		                    <div>
		                        <i class="bi bi-envelope-fill text-white"></i>
		                    </div>
		                    <div>
		                        <span class="text-white ms-3">test123@naver.com</span>
		                    </div>
		                </div>
		            </div>
		            <div class="col-4">
		            	<div style="width: 535px;line-height: 100px;color: white;font-size: 77px;text-align:center;" id="clock">
						</div>
		            </div>
		            <div class="col-1">
		            	<button type="button" class="btn btn-secondary" style="width: 100px;height: 43px;margin: 5px;" onclick="attInsert()">출근</button>
		            	<button type="button" class="btn btn-secondary" style="width: 100px;height: 43px;margin: 5px;" onclick="attOff()">퇴근</button>
		            </div>
	           </div>
                
            </div>
            <main class="col-9 h-100 w-100">
                <div class="row m-5">
                    <!-- card header -->
                    <div class="col-12 rounded-top text-white overflow-auto pt-2 fw-bold" style="background-color: rgb(39, 40, 70); height: 40px;"> 
                        <i class="bi bi-bookmark-fill me-2"></i>교직원<i class="bi bi-chevron-right"></i>전체 주소록 조회 
                        <button class="btn btn-danger" onclick="location.href='${pageContext.request.contextPath}/myLikeAddress'"
                        	style="margin-left: 64%;line-height: 11px;">내 즐겨찾기</button>
                    </div>
                    <!-- card content -->  
                    <div class="col-12 rounded-bottom overflow-auto bg-light p-3" style="min-height: 550px;"> 
                    
                    <!-- 오류 메세지 출력 -->
                    <span id="msg" style="
										    font-size: medium;
										    font-style: italic;
										    color: red;
										    margin-left: 992px;
										"></span>
					<!-- ============================================== -->
					<!-- <form action="searchAddress" method="post">
					<div class = "row">
						<div class = "col-6"></div>
						<div class = "col-1"></div>		 		
						<div class = "col-4"  style="margin-bottom: 20px">
							<input  type = "text"  name = "search" class="form-control" placeholder="search">
						</div>
					</div> -->
					
                    	<table class="table table-hover">
                    		 <thead>
							    <tr><th>이름</th><th>직위</th><th>부서</th><th>연락처</th><th>즐겨찾기</th></tr>
							  </thead>
							  	<c:forEach var="address" items="${addressList}" varStatus="status">
							  	<tr>
							  		<td><input type="text" name ="userid" id = "user${status.index}" value="${address.userid}" hidden="true">
							  			${address.name }</td>
							  		<c:if test="${address.dept.upDeptno == 100}">
								  		<td>교수</td>							  		
							  		</c:if>
							  		<c:if test="${address.dept.upDeptno == 200}">
								  		<td>교직원</td>
								  	</c:if>
								 	<c:if test="${address.dept.upDeptno == null }">
								  		<td></td>
								  	</c:if>
							  		<td>${address.dept.dname}</td>
							  		<td>${address.phone}</td>
							  		<td>
							  			<button type="button" class="btn btn-outline-danger" onclick="phoneLikeSave(${status.index})">+</button>
							  		</td>
							  	</tr>	
							  	</c:forEach>
							  <tbody>
							  </tbody>
                    	</table>
                    	<nav aria-label="...">
                    	
                    	<!--================================================  -->
                    					<!-- 검색버튼 구현 -->
                    	<!--================================================  -->
	                    <form action="searchAddress">
	                    <div class="input-group mb-3" style="width: 206px;text-align: center;float: left;" >
							<input  type = "text"  name = "search" class="form-control" placeholder="이름을 검색하세요" aria-describedby="button-addon2">
							<button class="btn btn-outline-secondary" type="submit" id="button-addon2"><i class="bi bi-search"></i></button>
						</div>
						</form>
					  <ul class="pagination" style="margin-left: 40%;">
					  
					    <li class="page-item">
					      <c:if test="${page > 0}">
						      <a class="page-link" href="addressForm?page=${page-1}">Previous</a>				      
					      </c:if>
					      <c:if test= "${page == 0 }">
					      	  <a class="page-link">Previous</a>
					      </c:if>
					    </li>					  
					
					  <c:forEach var="i" begin="1" end="${totalPage}">
					    <li id="page-item${i}" class="page-item" onclick="active(${i})">
					    <a class="page-link" href="addressForm?page=${i-1 }" >${i }</a></li>
					  </c:forEach>
					    <li class="page-item">
					    	<c:if test="${page < totalPage-1}">
						      <a class="page-link" href="addressForm?page=${page+1}">Next</a>
					    	</c:if>
					      	<c:if test= "${page > totalPage-2}">
						      <a class="page-link">Next</a>
					      	</c:if>
					    </li>
					  </ul>
					</nav>
                    </div>
                    <!-- footer -->
                    <footer class="col-12" style="height: 60px;">
                        footer
                    </footer>    
                </div>
            </main>
        </div>
    </div>
    <!-- IONICONS -->
    <script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
    <!-- JS -->
    <script src="/js/main.js"></script>
</body>
</html>