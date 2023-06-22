<%-- 
    Document   : homepage
    Created on : May 27, 2023, 10:02:54 PM
    Author     : laptop
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>TECHZONE</title>
        <script src="js/jquery-3.3.1.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="fonts/fontawesome/css/all.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Paytone+One&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/home.css">
    </head>
    <body>
        <div class="app">
            <!--<form action="abc?a=b" method="get">-->
            <jsp:include page="header.jsp"></jsp:include>
                <!--</form>-->

                <!--slide - menu list--> 

                <section class="menu-slide">
                    <div class="container">
                        <div class="row">
                            <nav class="menu__nav col-lg-3 col-md-12 col-sm-0">
                                <ul class="menu__list">
                                    <li class="menu__item ">
                                        <!--menu__item--active-->
                                        <a href="ProductListController?tab=headphone" class="menu__link">
                                            <img src="images1/item/headphone.jpg" alt=""  class="menu__item-icon" id="Capa_1" enable-background="new 0 0 512 512" height="512" viewBox="0 0 512 512" width="512">
                                            Tai nghe</a>
                                    </li>
                                    <li class="menu__item">
                                        <a href="ProductListController?tab=mouse" class="menu__link">
                                            <img src="images1/item/mouse.jpg" alt="" class="menu__item-icon" id="Capa_1" enable-background="new 0 0 512 512" height="512" viewBox="0 0 512 512" width="512">
                                            Chuột</a>
                                    </li>

                                    <li class="menu__item">
                                        <a href="ProductListController?tab=keyboard" class="menu__link">
                                            <img src="images1/item/keyboard.jpg" alt="" class="menu__item-icon"  viewBox="0 0 512 512" width="1012" height="512">
                                            Bàn phím</a>
                                    </li>
                                </ul>
                            </nav>

                            <div class="slider col-lg-9 col-md-12 col-sm-0">
                                <div class="row">
                                    <div class="slide__left col-lg-8 col-md-0 col-sm-0">
                                        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" data-interval="3000">
                                            <!-- <ol class="carousel-indicators">
                                                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                                                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                                                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                                            </ol> -->
                                            <div class="carousel-inner">
                                                <div class="carousel-item active">
                                                    <img src="images1/banner/banner1.jpg" class="d-block w-100" alt="...">
                                                </div>
                                                <div class="carousel-item">
                                                    <img src="images1/banner/banner2.jpg" class="d-block w-100" alt="...">
                                                </div>
                                                <div class="carousel-item">
                                                    <img src="images1/banner/banner4.jpg" class="d-block w-100" alt="...">
                                                </div>           
                                            </div>
                                            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                                <span class="sr-only">Previous</span>
                                            </a>
                                            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                                <span class="sr-only">Next</span>
                                            </a>
                                        </div>
                                        <div class="slide__left-bottom">
                                            <div class="slide__left-botom-one">
                                                <img src="images1/banner/banner3.jpg" class="slide__left-bottom-one-img">
                                            </div>
                                            <div class="slide__left-bottom-two">
                                                <img src="images1/banner/banner4.jpg" class="slide__left-bottom-tow-img">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="slide__right col-lg-4 col-md-0 col-sm-0">
                                        <img src="images1/banner/banner5.jpg" class="slide__right-img">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <!-- end slide menu list -->
                <!-- score-top-->

                <button onclick="topFunction()" id="myBtn-scroll" title="Go to top"><i class="fas fa-chevron-up"></i></i></button>
                <!-- bestselling product -->
                <form action="HomePageController">
                    <section class="bestselling">
                        <div class="container">
                            <div class="row">
                                <div class="bestselling__heading-wrap">
                                    <img src="images/bestselling.png" alt="Sản phẩm bán chạy"
                                         class="bestselling__heading-img">
                                    <div class="bestselling__heading">TOP SẢN PHẨM HOT TRONG TUẦN</div>
                                </div>
                            </div>

                            <section class="row">
                            <c:forEach items="${bestProductList}" var="item">
                                <div class="bestselling__product col-lg-4 col-md-6 col-sm-12">
                                    <div class="bestselling__product-img-box">
                                        <img src="${item.getPicture2()}" alt="Tai nghe gaming PLYR Wireless" class="bestselling__product-img">
                                    </div>
                                    <div class="bestselling__product-text">
                                        <h3 class="bestselling__product-title">
                                            <a href="#" class="bestselling__product-link">${item.getName()}</a>
                                        </h3>

                                        <div class="bestselling__product-rate-wrap">
                                            <i class="product__panel-rate" style="text-decoration: underline;font-size: 20px; margin-right: 5px">${item.getRateStar()}</i>
                                            <i class="fas fa-star bestselling__product-rate"></i>
                                            <i class="fas fa-star bestselling__product-rate"></i>
                                            <i class="fas fa-star bestselling__product-rate"></i>
                                            <i class="fas fa-star bestselling__product-rate"></i>
                                            <i class="fas fa-star bestselling__product-rate"></i>
                                        </div>

                                        <span class="bestselling__product-price">
                                            ${item.getSalePrice()}đ
                                        </span>

                                        <div class="bestselling__product-btn-wrap">
                                            <a href="abc" class="bestselling__product-btn">Xem hàng</a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </section>

                        <div class="row bestselling__banner">

                            <div class="bestselling__banner-left col-lg-6">
                                <img src="images1/banner/banner2.jpg" alt="Banner quảng cáo"
                                     class="bestselling__banner-left-img">
                            </div>
                            <div class="bestselling__banner-right col-lg-6">
                                <img src="images1/banner/banner3.jpg" alt="Banner quảng cáo"
                                     class="bestselling__banner-right-img">
                            </div>
                        </div>
                    </div>
                </section>
            </form>
            <!-- end bestselling product -->

            <!-- product -->
            <section class="product">
                <div class="container">
                    <div class="row">
                        <aside class="product__sidebar col-lg-3 col-md-0 col-sm-12">
                            <div class="product__sidebar-heading">
                                <div class=""></div>
                                <h2 class="product__sidebar-title">
                                    <img src="images1/item/brand.png" alt="" class="menu__item-icon" id="Capa_1" enable-background="new 0 0 512 512" height="512" viewBox="0 0 512 512" width="512">
                                    Thương Hiệu</h2>
                            </div>

                            <nav class="product__sidebar-list">

                                <div class="row">
                                    <div class="product__sidebar-item col-lg-6">
                                        <img src="images1/product/better3.jpg" alt="" class="product__sidebar-item-img">
                                        <a href="" class="product__sidebar-item-name">Sony</a>
                                    </div>
                                    <div class="product__sidebar-item col-lg-6">
                                        <img src="images1/product/better8.jpg" class="product__sidebar-item-img">
                                        <a href="" class="product__sidebar-item-name">Samsung</a>
                                    </div>
                                    <div class="product__sidebar-item col-lg-6">
                                        <img src="images1/product/oppo.jpg" alt="" class="product__sidebar-item-img">
                                        <a href="" class="product__sidebar-item-name">Oppo</a>
                                    </div>
                                    <div class="product__sidebar-item col-lg-6">
                                        <img src="images1/product/apple1.jpg" alt="" class="product__sidebar-item-img">
                                        <a href="" class="product__sidebar-item-name">Apple</a>
                                    </div>
                                </div>
                            </nav>

                            <!--                            <div class="product__sidebar-img-wrap">
                                                             <img src="images1/product/Demon Slayer_ Kimetsu no Yaiba - Assista na Crunchyroll.png" width="255" height="350" alt=""> 
                                                            <video width="255" height="300" controls>
                                                                <source src="https://www.youtube.com/embed/9xpCv_7Bfr4" type="video/mp4">
                                                            </video>
                                                             <img src="images/banner_7.jpg" alt="" class="product__sidebar-img"> 
                                                        </div>-->
                        </aside>

                        <article class="product__content col-lg-9 col-md-12 col-sm-12">
                            <nav class="row">
                                <ul class="product__list hide-on-mobile">
                                    <c:if test="${type=='Wired'}">
                                        <li class="product__item product__item--active">
                                            <a href="HomePageController?type=Wired" class="product__link">Sản Phẩm Kết Nối Dây</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${type!='Wired'}">
                                        <li class="product__item">
                                            <a href="HomePageController?type=Wired" class="product__link">Sản Phẩm Kết Nối Dây</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${type=='Wireless'}">
                                        <li class="product__item product__item--active">
                                            <a href="HomePageController?type=Wireless" class="product__link">Sản Phẩm Kết Nối Bluetooth</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${type!='Wireless'}">
                                        <li class="product__item">
                                            <a href="HomePageController?type=Wireless" class="product__link">Sản Phẩm Kết Nối Bluetooth</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${type=='Console'}">
                                        <li class="product__item product__item--active">
                                            <a href="HomePageController?type=Console" class="product__link">Sản Phẩm Mới Nhất </a>
                                        </li>
                                    </c:if>
                                    <c:if test="${type!='Console'}">
                                        <li class="product__item">
                                            <a href="HomePageController?type=Console" class="product__link">Sản Phẩm Mới Nhất </a>
                                        </li>
                                    </c:if>
                                    <c:if test="${type=='HighPrice'}">
                                        <li class="product__item product__item--active">
                                            <a href="HomePageController?type=HighPrice" class="product__link">Sản Phẩm Cao Cấp</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${type!='HighPrice'}">
                                        <li class="product__item ">
                                            <a href="HomePageController?type=HighPrice" class="product__link">Sản Phẩm Cao Cấp</a>
                                        </li>
                                    </c:if>
                                </ul>                              
                            </nav>

                            <div class="row product__panel">
                                <c:forEach items="${typeProductList}" var="item">
                                    <div class="product__panel-item col-lg-3 col-md-4 col-sm-6">
                                        <div class="product__panel-item-wrap">
                                            <div class="product__panel-img-wrap">
                                                <img src="${item.getPicture()}" alt="" class="product__panel-img">
                                            </div>
                                            <h3 class="product__panel-heading">
                                                <a href="product.html" class="product__panel-link">${item.getName()}</a>
                                            </h3>
                                            <div class="product__panel-rate-wrap">
                                                <i class="product__panel-rate" style="text-decoration: underline;font-size: 20px; margin-right: 5px">${item.getRateStar()}</i>
                                                <i class="fas fa-star product__panel-rate"></i>
                                                <i class="fas fa-star product__panel-rate"></i>
                                                <i class="fas fa-star product__panel-rate"></i>
                                                <i class="fas fa-star product__panel-rate"></i>
                                                <i class="fas fa-star product__panel-rate"></i>
                                            </div>

                                            <div class="product__panel-price">
                                                <c:if test="${item.getSale() !='0'}">
                                                    <span class="product__panel-price-old">
                                                        ${item.getPrice()}đ
                                                    </span>
                                                </c:if>
                                                <span class="product__panel-price-current">
                                                    ${item.getSalePrice()}đ
                                                </span>
                                            </div>
                                            <c:if test="${item.getSale() !='0'}">
                                                <div class="product__panel-price-sale-off">
                                                    -${item.getSale()}%
                                                </div>
                                            </c:if>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </article>
                    </div>
                </div>
            </section>
            <!--end product -->

            <!-- product love -->
            <section class="product__love">
                <div class="container">
                    <div class="row bg-white">
                        <div class="col-lg-12 col-md-12 col-sm-12 product__love-title">
                            <h2 class="product__love-heading">
                                Có thể bạn thích
                            </h2>
                        </div>
                    </div>
                    <div class="row bg-white">
                        <div class="product__panel-item col-lg-2 col-md-3 col-sm-6">
                            <div class="product__panel-img-wrap">
                                <img src="images1/product/1.jpg" alt="" class="product__panel-img">
                            </div>
                            <h3 class="product__panel-heading">
                                <a href="#" class="product__panel-link">Tai Nghe Gaming PRESONUS</a>
                            </h3>
                            <div class="product__panel-rate-wrap">
                                <i class="fas fa-star product__panel-rate"></i>
                                <i class="fas fa-star product__panel-rate"></i>
                                <i class="fas fa-star product__panel-rate"></i>
                                <i class="fas fa-star product__panel-rate"></i>
                                <i class="fas fa-star product__panel-rate"></i>
                            </div>

                            <div class="product__panel-price">
                                <span class="product__panel-price-old product__panel-price-old-hide">
                                    2.800.000đ
                                </span>
                                <span class="product__panel-price-current">
                                    2.709.580đ
                                </span>
                            </div>  
                        </div>

                        <div class="product__panel-item col-lg-2 col-md-3 col-sm-6">
                            <div class="product__panel-img-wrap">
                                <img src="images1/product/7.jpg" alt="" class="product__panel-img">
                            </div>
                            <h3 class="product__panel-heading">
                                <a href="#" class="product__panel-link">Chuột Dare-U EM908 RGB</a>
                            </h3>
                            <div class="product__panel-rate-wrap">
                                <i class="fas fa-star product__panel-rate"></i>
                                <i class="fas fa-star product__panel-rate"></i>
                                <i class="fas fa-star product__panel-rate"></i>
                                <i class="fas fa-star product__panel-rate"></i>
                                <i class="fas fa-star product__panel-rate"></i>
                            </div>

                            <div class="product__panel-price">
                                <span class="product__panel-price-old product__panel-price-old-hide">
                                    1.020.000đ
                                </span>
                                <span class="product__panel-price-current">
                                    1.020.000đ
                                </span>
                            </div> 
                        </div>

                        <div class="product__panel-item col-lg-2 col-md-3 col-sm-6">
                            <div class="product__panel-img-wrap">
                                <img src="images1/product/6.jpg" alt="" class="product__panel-img">
                            </div>
                            <h3 class="product__panel-heading">
                                <a href="#" class="product__panel-link">Bàn phím cơ E-DRA EK387L RGB Brown Switch</a>
                            </h3>
                            <div class="product__panel-rate-wrap">
                                <i class="fas fa-star product__panel-rate"></i>
                                <i class="fas fa-star product__panel-rate"></i>
                                <i class="fas fa-star product__panel-rate"></i>
                                <i class="fas fa-star product__panel-rate"></i>
                                <i class="fas fa-star product__panel-rate"></i>
                            </div>

                            <div class="product__panel-price">
                                <span class="product__panel-price-old product__panel-price-old-hide
                                      ">
                                    2.900.000đ
                                </span>
                                <span class="product__panel-price-current">
                                    2.900.000đ
                                </span>
                            </div>
                        </div>
                        <div class="product__panel-item col-lg-2 col-md-3 col-sm-6">
                            <div class="product__panel-img-wrap">
                                <img src="images1/product/4.jpg" alt="" class="product__panel-img">
                            </div>
                            <h3 class="product__panel-heading">
                                <a href="#" class="product__panel-link">Bàn Phím Cơ Dell Alienware RGB AW410K</a>
                            </h3>
                            <div class="product__panel-rate-wrap">
                                <i class="fas fa-star product__panel-rate"></i>
                                <i class="fas fa-star product__panel-rate"></i>
                                <i class="fas fa-star product__panel-rate"></i>
                                <i class="fas fa-star product__panel-rate"></i>
                                <i class="fas fa-star product__panel-rate"></i>
                            </div>

                            <div class="product__panel-price">
                                <span class="product__panel-price-old product__panel-price-old-hide">
                                    2.700.000đ
                                </span>
                                <span class="product__panel-price-current">
                                    2.700.000đ
                                </span>
                            </div> 
                        </div>

                        <div class="product__panel-item col-lg-2 col-md-3 col-sm-6">
                            <div class="product__panel-img-wrap">
                                <img src="images1/product/7.jpg" alt="" class="product__panel-img" >
                            </div>
                            <h3 class="product__panel-heading">
                                <a href="#" class="product__panel-link">Chuột Razer Basilisk V3 (RZ01-04000100-R3M1)</a>
                            </h3>
                            <div class="product__panel-rate-wrap">
                                <i class="fas fa-star product__panel-rate"></i>
                                <i class="fas fa-star product__panel-rate"></i>
                                <i class="fas fa-star product__panel-rate"></i>
                                <i class="fas fa-star product__panel-rate"></i>
                                <i class="fas fa-star product__panel-rate"></i>
                            </div>

                            <div class="product__panel-price">
                                <span class="product__panel-price-old product__panel-price-old-hide">
                                    1.020.000đ
                                </span>
                                <span class="product__panel-price-current">
                                    1.020.000đ
                                </span>
                            </div> 
                        </div>

                        <div class="product__panel-item col-lg-2 col-md-3 col-sm-6">
                            <div class="product__panel-img-wrap">
                                <img src="images1/product/9.jpg" alt="" class="product__panel-img" >
                            </div>
                            <h3 class="product__panel-heading">
                                <a href="#" class="product__panel-link">Chuột Gaming Có Dây iCore GM03</a>
                            </h3>
                            <div class="product__panel-rate-wrap">
                                <i class="fas fa-star product__panel-rate"></i>
                                <i class="fas fa-star product__panel-rate"></i>
                                <i class="fas fa-star product__panel-rate"></i>
                                <i class="fas fa-star product__panel-rate"></i>
                                <i class="fas fa-star product__panel-rate"></i>
                            </div>

                            <div class="product__panel-price">
                                <span class="product__panel-price-old product__panel-price-old-hide">
                                    821.000đ
                                </span>
                                <span class="product__panel-price-current">
                                    821.000đ
                                </span>
                            </div> 
                        </div>
                    </div>
                </div>
            </section>
            <!--end product love -->

            <!-- footer -->
            <jsp:include page="footer.jsp"></jsp:include>
            <!-- end footer -->
        </div>
        <script src="js/jq.js"></script>
        <script src="js/index.js"></script>
    </body>
</html>