<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp" %> 
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

	<link rel="stylesheet" href="${path_resources}css/bootstrap.min.css">
    <link rel="stylesheet" href="${path_resources}css/owl.carousel.min.css">
    <link rel="stylesheet" href="${path_resources}css/magnific-popup.css">
    <link rel="stylesheet" href="${path_resources}css/font-awesome.min.css">
    <link rel="stylesheet" href="${path_resources}css/themify-icons.css">
    <link rel="stylesheet" href="${path_resources}css/nice-select.css">
    <link rel="stylesheet" href="${path_resources}css/flaticon.css">
    <link rel="stylesheet" href="${path_resources}css/gijgo.css">
    <link rel="stylesheet" href="${path_resources}css/animate.css">
    <link rel="stylesheet" href="${path_resources}css/slicknav.css">
    <link rel="stylesheet" href="${path_resources}css/style.css">
    <link rel="stylesheet" href="${path_resources_lifecare}css/custom.css">

</head>
<body>
    <!-- header-start -->
    <header>
        <div class="header-area ">
            <div class="header-top_area">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-6 col-md-6 ">
                            <div class="social_media_links">
                                <a href="#">
                                    <i class="fa fa-linkedin"></i>
                                </a>
                                <a href="#">
                                    <i class="fa fa-facebook"></i>
                                </a>
                                <a href="#">
                                    <i class="fa fa-google-plus"></i>
                                </a>
                            </div>
                        </div>
                        <div class="col-xl-6 col-md-6">
                            <div class="short_contact_list">
                                <ul>
                                	<!-- 로그인 안했을경우 -->
                                	<c:if test="${sessionScope.userSession == null}">
	                                    <li><a href="${path}/guest/preJoinIn">회원가입</a></li>
	                                    <li><a href="${path}/login">로그인</a></li>
                                    </c:if>
                                    <!-- 로그인 완료후 -->
                                    <c:if test="${sessionScope.userSession != null}">
	                                    <li><a href="${path}/Mypage">${sessionScope.userSession}의 마이페이지</a></li>
	                                    <li><a href="">고객센터</a></li>
	                                    <li><a href="${path}/logout">로그아웃</a></li>
                                    </c:if>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="sticky-header" class="main-header-area">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-xl-3 col-lg-2">
                            <div class="logo">
                                <a href="${path }/">
                                    <img src="${path_resources}img/logo.png" alt="">
                                </a>
                            </div>
                        </div>
                        <div class="col-xl-6 col-lg-7">
                            <div class="main-menu  d-none d-lg-block">
                                <nav>
                                    <ul id="navigation">
                                        <li><a class="active" href="index.html">HOME</a></li>
                                        <li><a href="Doctors.html">코로나정보</a></li>
                                        <li><a href="Department.html">예약<i class="ti-angle-down"></i></a>
                                        	<ul class="submenu">
                                               <li><a href="blog.html">자가진단</a></li>
                                            </ul>
                                        </li>     
                                        <li><a href="#">이용안내<i class="ti-angle-down"></i></a>
                                            <ul class="submenu">
                                                <li><a href="blog.html">병원 오시는길</a></li>
                                                <li><a href="single-blog.html">주변약국</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="#">의료정보 <i class="ti-angle-down"></i></a>
                                            <ul class="submenu">
                                                <li><a href="elements.html">약정보</a></li>
                                                <li><a href="about.html">응급처치방법</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                        <div class="col-xl-3 col-lg-3 d-none d-lg-block">
                            <div class="Appointment">
                                <div class="book_btn d-none d-lg-block">
                                    <a class="popup-with-form" href="#test-form">예약하기</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="mobile_menu d-block d-lg-none"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <div style="margin-top:165px;"></div>
    <!-- header-end -->
    <script src="${path_resources}js/vendor/modernizr-3.5.0.min.js"></script>
    <script src="${path_resources}js/vendor/jquery-1.12.4.min.js"></script>
    <script src="${path_resources}js/popper.min.js"></script>
    <script src="${path_resources}js/bootstrap.min.js"></script>
    <script src="${path_resources}js/owl.carousel.min.js"></script>
    <script src="${path_resources}js/isotope.pkgd.min.js"></script>
    <script src="${path_resources}js/ajax-form.js"></script>
    <script src="${path_resources}js/waypoints.min.js"></script>
    <script src="${path_resources}js/jquery.counterup.min.js"></script>
    <script src="${path_resources}js/imagesloaded.pkgd.min.js"></script>
    <script src="${path_resources}js/scrollIt.js"></script>
    <script src="${path_resources}js/jquery.scrollUp.min.js"></script>
    <script src="${path_resources}js/wow.min.js"></script>
    <script src="${path_resources}js/nice-select.min.js"></script>
    <script src="${path_resources}js/jquery.slicknav.min.js"></script>
    <script src="${path_resources}js/jquery.magnific-popup.min.js"></script>
    <script src="${path_resources}js/plugins.js"></script>
    <script src="${path_resources}js/gijgo.min.js"></script>
    <!--contact js-->
    <script src="${path_resources}js/contact.js"></script>
    <script src="${path_resources}js/jquery.ajaxchimp.min.js"></script>
    <script src="${path_resources}js/jquery.form.js"></script>
    <script src="${path_resources}js/jquery.validate.min.js"></script>
    <script src="${path_resources}js/mail-script.js"></script>

    <script src="${path_resources}js/main.js"></script>
    <script>
        $('#datepicker').datepicker({
            iconsLibrary: 'fontawesome',
            icons: {
                rightIcon: '<span class="fa fa-caret-down"></span>'
            }
        });
        $('#datepicker2').datepicker({
            iconsLibrary: 'fontawesome',
            icons: {
                rightIcon: '<span class="fa fa-caret-down"></span>'
            }

        });
    $(document).ready(function() {
    $('.js-example-basic-multiple').select2();
});
    </script>
</body>
</html>