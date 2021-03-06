<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import = "vo.NewsVO,java.util.List,java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<!-- Basic -->

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Site Metas -->
    <title>Freshshop - Ecommerce Bootstrap 4 HTML Template</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">

	<!-- Site Icons -->
    <link rel="icon" href="/pmkim/resources/images/pmkim.png"  type="image/png" sizes="16X16">
	
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="/pmkim/resources/css/bootstrap.min.css">
	<!-- Site CSS -->
	<link rel="stylesheet" href="/pmkim/resources/css/style.css">
	<link rel="stylesheet" href="/pmkim/resources/css/style_nav.css">
	<link rel="stylesheet" href="/pmkim/resources/css/style_news.css">
	<!-- Responsive CSS -->
	<link rel="stylesheet" href="/pmkim/resources/css/responsive.css">
	<!-- Custom CSS -->
	<link rel="stylesheet" href="/pmkim/resources/css/custom.css">
	<link rel="stylesheet" href="/pmkim/resources/css/footerus.css">

    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
<c:set var="sessionMemberId" value="${ sessionScope.id }"/>
    <!-- Start Main Top -->
    <header class="main-header">
        <!-- Start Navigation -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light navbar-default bootsnav">
            <div class="container">
                <!-- Start Header Navigation -->
                <div class="navbar-header">
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-menu" aria-controls="navbars-rs-food" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fa fa-bars"></i>
                </button>
                    <a class="navbar-brand" href="/pmkim/home"><img src="/pmkim/resources/images/pmkim_Logo_1.jpg" class="logo" alt=""></a>
                </div>
                <!-- End Header Navigation -->

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="navbar-menu">
                    <ul class="nav navbar-nav ml-auto" data-in="fadeInDown" data-out="fadeOutUp">
                        <li class="nav-item active"><a class="nav-link" href="/pmkim/home">Home</a></li> <!-- href는 jsp/html 형식이 아닌, {/매핑명}으로  해주시면돼용! 나중에 고쳐주세요~ -->
                        <li class="nav-item active"><a class="nav-link" href="/pmkim/map">지도</a></li> <!--성진오빠파트-->
                        <li class="nav-item active"><a class="nav-link" href="/pmkim/analysis">SNS 분석</a></li> <!-- 세호-->
                        <li class="nav-item active"><a class="nav-link" href="/pmkim/event">행사</a></li> <!-- 지혜파트-->
                        <li class="nav-item active"><a class="nav-link" href="/pmkim/cart">만원의 행복</a></li> <!-- 규영언니파트♡ -->
                        <li class="nav-item active"><a class="nav-link" href="/pmkim/news">편의점 뉴스</a></li> <!-- 규영언니파트♡ -->
                        <!-- <li class="nav-item active"><a class="nav-link" data-toggle="modal" data-target="#loginModal" href="/pmkim/#">로그인</a></li>	                        
						<li class="nav-item active"><a class="nav-link" href="/pmkim/signup">회원가입</a></li> -->
						<!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
						<c:choose>
							<c:when test="${msg eq 'success' || !empty sessionMemberId}">
								<li class="nav-item active"><a class="nav-link" id="userView" href="/pmkim/ownerpage"><img src="/pmkim/resources/images/star.png" style="width:13px;">${sessionMemberId}님</a></li>
								<li class="nav-item active"><a class="nav-link" id="logout" href="/pmkim/logout"><b>Logout</b></a></li>
								
							</c:when>
							<c:when test="${msg eq 'fail' || msg eq 'logout' || msg eq '' || msg eq null}">
								<li class="nav-item active"><a class="nav-link" id="login" data-toggle="modal" data-target="#loginModal" href="/pmkim/#">로그인</a></li>
								<li class="nav-item active"><a class="nav-link" id="signup" href="/pmkim/signup">회원가입</a></li>	
						    </c:when>
						</c:choose>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->

            </div>
        </nav>
        <!-- End Navigation -->
    </header>
    <!-- End Main Top -->
<!-- Start login popup -->
    <div class="container">
		<!-- <button type="button" class="btn btn-info btn-round" data-toggle="modal" data-target="#loginModal">
		    Login
		</button>   -->
		<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			
		  <div class="modal-dialog modal-dialog-centered" role="document" >
		    <div class="modal-content" >
		      <div class="modal-header border-bottom-0">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body border-bottom-0">
		      	<div class="form-title text-center"><!--  style="margin-left:auto; margin-right:auto;" -->
					<img src="/pmkim/resources/images/pmkim_Logo_1.jpg" /> 	
				</div>
				<br>
				
		        <div class="form-title text-center">
		          <h4><b>Login</b></h4>
		        </div>
		        <div class="d-flex flex-column text-center">
		        
		          <form method="post" action="/pmkim/login" id="frmSignin">
		            <div class="form-group">
		              <input type="text" class="form-control" name="id" placeholder="Your id...">
		            </div>
		            <div class="form-group">
		              <input type="password" class="form-control" name="pw" placeholder="Your password...">
		            </div>
		            <button type="submit" class="btn btn-info btn-block btn-round" id="btnLogin" style="background-color:#0F694D">Login</button> <!-- '/weet/signinCheck.do' -->
		          </form>
		          
		          <!-- <div class="text-center text-muted delimiter">or use a social network</div> -->
		          <div class="d-flex justify-content-center social-buttons">
		            <!-- <button type="button" id="btnGoogleSignin" class="btn btn-secondary btn-round" data-toggle="tooltip" data-placement="top" title="Google"
		           		onclick="
		           			gauth.signIn().then(function(){
								console.log('gauth.signIn()');
								checkLoginStatus();
								location.reload(true);
							});
						" data-dismiss="modal">
		          		<img src="/pmkim/resources/images/btn_google_light_normal_ios.svg">
		          	</button> -->
		          </div>
		        </div>
		      </div>
		      <div class="modal-footer d-flex justify-content-center ">
			        <div class="signup-section text-center">Not a member yet? 
			        	<a href="/pmkim/signup">Sign Up</a>.
			        </div>
			        <button type="button" class="btn btn-default text-center" data-dismiss="modal">Close</button>
			        <!-- <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#signupModal">Open Modal</button> -->
		      </div>
		    </div>
		      
		  </div>
		</div>
		
	</div>
		<!-- End login popup -->
    

    <!-- Start Gallery  -->
    <div class="products-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="title-all text-center">
                        <h1>편의점 소식</h1>
                        <p>원하는 편의점의 소식을 확인해보세요!</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="special-menu text-center">
                        <div class="button-group filter-button-group">
                            <button onclick = "/pmkim/news">All</button>
                            <button onclick = "location.href='/pmkim/news?shop_name_kor=cu';">CU</button>
                            <button onclick = "location.href='/pmkim/news?shop_name_kor=GS25';">GS25</button>
							<button onclick = "location.href='/pmkim/news?shop_name_kor=미니스톱';">MiniStop</button>
							<button onclick = "location.href='/pmkim/news?shop_name_kor=세븐일레븐';">7Eleven</button>
							<button onclick = "location.href='/pmkim/news?shop_name_kor=이마트24';">Emart24</button>
                        </div>
                    </div>
                </div>
            </div>

		    <!-- Start Wishlist  -->
		    <div class="wishlist-box-main">
		        <div class="container">
		            <div class="row">
		                <div class="col-lg-12">
		                    <div class="table-main table-responsive">
		                        <table class="table">
		                            <thead>
		                                <tr>
		                                    <th>Shop Name</th>
		                                    <th>Title</th>
		                                    <th>Post Date </th>
		                                </tr>
		                            </thead>
		                            <tbody>
			                            <c:forEach var="vo" items="${ newsList }" varStatus="status">
			                                <tr class = "${ vo.shop_name }">
			                                    <td class="shop_name">
			                                        ${ vo.shop_name }
			                                    </td>
			                                    <td class="title">
			                                        <a href="${ vo.content }" class = "newslink">
														${ vo.title }
													</a>
			                                    </td>
			                                    <td class="pubDate">
			                                        <p>${ vo.write_date }</p>
			                                    </td>
			                                </tr>
		                                </c:forEach>
		                            </tbody>
		                        </table>
		                    </div>
		                </div>
		            </div>
		        </div>
		        <!-- start paging -->
					<div id="paging" style="text-align : center; font-size : 16pt;">
						<c:if test="${ preData }">
							<a href ="/pmkim/news?pgNum=1${ oldQ }"> &laquo; </a>
							<a href = "/pmkim/news?pgNum=${ pgNum - 1 }${ oldQ }"> &nbsp; &lt; &nbsp;</a>
						</c:if>
						
						<c:forEach var="num" begin="${ pageStart }" end="${ pageEnd }">
							<a href = "/pmkim/news?pgNum=${ num }${ oldQ }">${ num } &nbsp;</a>
						</c:forEach>
						
						<c:if test="${ nextData }">
							<a href = "/pmkim/news?pgNum=${ pgNum + 1 }${ oldQ }"> &gt; &nbsp;</a>
						</c:if>
						
						<c:if test = "${ pgNum != end }">
						<a href ="/pmkim/news?pgNum=${ end }${ oldQ }"> &raquo; </a>
						</c:if>
					</div>
				<!-- end paging -->
		    </div>
		    <!-- End Wishlist -->
        </div>
    </div>
    <!-- End Gallery  -->

   <!-- Start Footer  -->
	<footer>
		<div class="footer-main">
			<div class="container3">
				<div class="row">
					<div class="col-lg-4 col-md-12 col-sm-12">
						<div class="footer-top-box">
							<h3>챗봇(Coming Soon)</h3>
						</div>
					</div>
				</div>
				<br><br>
				<div class="row">
					<div class="col-lg-4 col-md-12 col-sm-12">
						<div class="footer-top-box">
							<h3>We are One ; 곰돌이 감자 </h3>
						</div>
					</div>
				</div>

				<div class="container text-centers">
					<div class="row">
						<!-- Footer 1-->
						<div class="col-lg-422 mb-5 mb-lg-0">
							<a><img src="/pmkim/resources/images/haley.png" class="profile"  alt="" /></a><br><br>
							<a href="https://github.com/JihyeHaley" class="result-text">Haley Oh</a><br><br>
							<a class="result-text">You know? I'm 팀장4;)</a><br><br>
						<a class= "profile-text">has kinda professional language skills English, Chinese, Japanese. Currently working and studying for full-stack developing skills</a>
						
						</div>

						<!-- Footer 2-->
						<div class="col-lg-422 mb-5 mb-lg-0">
							<a><img src="/pmkim/resources/images/seho.png" class="profile"   alt="" /></a><br><br>
							<a href="https://github.com/sehooh5" class="result-text">Seho Oh </a><br><br>
							<a class="result-text">You know? I'm 팀장1;)</a><br><br>
							<a class= "profile-text">is one of the treasurous in gomgam since he has professional analysis skills based on R selenium. His main major was Design. Amazing!</a>
						
						</div>

						<!-- Footer 3-->
						<div class="col-lg-422 mb-5 mb-lg-0">
							<a><img src="/pmkim/resources/images/linda.png" class="profile" alt="" /></a><br><br>
							<a href="https://github.com/GyuyoungEom" class="result-text">Linda Eom </a><br><br>
							<a  class="result-text">You know? I'm 팀장3;)</a><br><br>
							<a class= "profile-text">without her, this work could not be achieved... haha He is superwomen among us. Her diction is based on Austrailia, and she is familiar at super power on everything..!!!! </a>
						</div>

						<!-- Footer 4-->
						<div class="col-lg-422 mb-5 mb-lg-0">
							<a><img src="/pmkim/resources/images/oliver.png" class="profile"  /></a><br><br>
							<a href="https://github.com/SeongjinOliver" class="result-text">Oliver Yoo </a><br><br>
							<a class="result-text">You know? I'm 팀장1;)</a><br><br>
							<a class= "profile-text">is amazing man because he is familiar with back-frond end, DB, Spring, and Java, C... Cannot count all LOL. Surprise thing is he is even studying himself at every night despite project season :)</a>
							
							
						</div>
					</div>
				</div>


				<div class="row">
					<div class="col-lg-4 col-md-12 col-sm-12">
						<div class="footer-widget" ">
							<h4>About 편마 김편복</h4>
							<p class="result-text">편의점 마스터! 김편복
								데이터, 위치기반을 활용한 편의점 상품 추천 서비스</p>
							<p class="result-text">편의점에서 점심을 간단히 먹고 싶은 김편복씨는 자신의 위치에서 먹고자하는
								상품 어느 편의점에서 행사를 하는지 알고 싶은데 알 수 있는 방법이 없다!!
								이럴때 필요한 서비스는 "<b>편마 김편복</b>"</p>
						</div>
					</div>
					<div class="col-lg-4 col-md-12 col-sm-12">
						<div class="footer-link result-text">
							<h4>Information</h4>
								<a href="#/pmkim/home" >  HOME</a><br>
								<a href="#/pmkim/map">  지도</a><br>
								<a href="#/pmkim/analysis">  SNS 분석</a><br>
								<a href="#/pmkim/event">  행사</a><br>
								<a href="#/pmkim/cart">  만원의 행복</a><br>
								<a href="#/pmkim/cart">  편의점 뉴스</a>
						</div>
					</div>
					<div class="col-lg-4 col-md-12 col-sm-12">
						<div class="footer-link-contact result-text">
							<h4>Contact Us</h4>
							<ul>
								<li>
									<p>
										<i class="fas fa-map-marker-alt"></i>주소: 서울특별시 강남구 
										테헤란로 212 <br>(역삼동 718-5번지)<br> (우) 06220
									</p>
								</li>
								<li>
									<p>
										<i class="fas fa-phone-square"></i>Phone: <a
											href="tel:+81-1029852154">+82-10 2985 2154</a>
									</p>
								</li>
								<li>
									<p>
										<i class="fas fa-envelope"></i>Email: <a
											href="mailto:ohhojh@gmail.com">ohhojh@gmail.com</a>
									</p>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- End Footer  -->
	<!-- Start copyright  -->
	<div class="footer-copyright">
		<p class="footer-company">
			All Rights Jihye Oh. &copy; 2020 <a href="#">PM, KIM</a> Design By GomGam
		</p>
	</div>
	<!-- End copyright  -->


    <a href="#" id="back-to-top" title="Back to top" style="display: none;">&uarr;</a>

    <!-- ALL JS FILES -->
    <script src="/pmkim/resources/js/jquery-3.2.1.min.js"></script>
    <script src="/pmkim/resources/js/popper.min.js"></script>
    <script src="/pmkim/resources/js/bootstrap.min.js"></script>
    <!-- ALL PLUGINS -->
    <script src="/pmkim/resources/js/jquery.superslides.min.js"></script>
    <script src="/pmkim/resources/js/bootstrap-select.js"></script>
    <script src="/pmkim/resources/js/inewsticker.js"></script>
    <script src="/pmkim/resources/js/bootsnav.js."></script>
    <script src="/pmkim/resources/js/images-loded.min.js"></script>
    <script src="/pmkim/resources/js/isotope.min.js"></script>
    <script src="/pmkim/resources/js/owl.carousel.min.js"></script>
    <script src="/pmkim/resources/js/baguetteBox.min.js"></script>
    <script src="/pmkim/resources/js/form-validator.min.js"></script>
    <script src="/pmkim/resources/js/contact-form-script.js"></script>
    <script src="/pmkim/resources/js/custom.js"></script>
</body>

</html>