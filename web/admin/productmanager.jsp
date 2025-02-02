<%-- 
    Document   : productmanager
    Created on : 24-05-2023, 01:34:04
    Author     : trand
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<html>

  

    <head>
        <title>Left Box Text</title>
  <style>
    .left-box {
      float: left;
      margin-bottom: 10px
    }
  </style>
        <link rel="icon" href="image/icon.png" type="image/x-icon"/>
        <title>Danh sách nhân viên | Quản trị Admin</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Main CSS-->
        <link rel="stylesheet" type="text/css" href="css/main.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <!-- or -->
        <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">

        <!-- Font-icon css-->
        <link rel="stylesheet" type="text/css"
              href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
           <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>

    <body onload="time()" class="app sidebar-mini rtl">
        <!-- Navbar-->
        <header class="app-header">
            <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar"
                                            aria-label="Hide Sidebar"></a>
            <!-- Navbar Right Menu-->
            <ul class="app-nav">


                <!-- User Menu-->
                <li><a class="app-nav__item" href="/homepage.jsp"><i class='bx bx-log-out bx-rotate-180'></i> </a>

                </li>
            </ul>
        </header>
        <!-- Sidebar menu-->
        <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
        <aside class="app-sidebar">
            <div class="app-sidebar__user">
                <div>
                    <a href="homepage.jsp"><img src="image/logo1.png" alt="Logo" height="45px" width="225px"/></a>
                </div>
            </div>
            <hr>
            <ul class="app-menu">
                <li><a class="app-menu__item" href="homepage.jsp"><i class='app-menu__icon bx bx-tachometer'></i><span
                            class="app-menu__label">Bảng điều khiển</span></a></li>
                <li><a class="app-menu__item " href="usermanager.jsp"><i class='app-menu__icon bx bx-id-card'></i> <span
                            class="app-menu__label">Quản lý người dùng</span></a></li>
                <li><a class="app-menu__item active" href="AdminController"><i
                            class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Quản lý sản phẩm</span></a>
                </li>
                <li><a class="app-menu__item" href="ordermanager.jsp"><i class='app-menu__icon bx bx-task'></i><span
                            class="app-menu__label">Quản lý đơn hàng</span></a></li>
                <li><a class="app-menu__item" href="accountmanager.jsp"><i class='app-menu__icon bx bx-run'></i><span
                            class="app-menu__label">Quản lý tài khoản
                        </span></a></li>
                <li><a class="app-menu__item" href="incomemanager.jsp"><i
                            class='app-menu__icon bx bx-pie-chart-alt-2'></i><span class="app-menu__label">Báo cáo doanh thu</span></a>
                </li>
            </ul>
        </aside>
        
        <main class="app-content">
            <div class="app-title">
                <ul class="app-breadcrumb breadcrumb side">
                    <li class="breadcrumb-item active"><a href="#"><b>Danh sách sản phẩm</b></a></li>
                </ul>
                <div id="clock"></div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <div class="tile-body">
                            <div class="row element-button">
                                <div class="col-sm-2">

                                    <a class="btn btn-add btn-sm" href="editproduct?action=add" title="Thêm"><i class="fas fa-plus"></i>
                                        Tạo mới sản phẩm</a>
                                </div>
 
                                <div class="col-sm-2">
                                    <a class="btn btn-excel btn-sm" href="" title="In"><i class="fas fa-file-excel"></i> Xuất Excel</a>
                                </div>
                                
                                <div class="col-sm-2">
                                    <a class="btn btn-delete btn-sm" type="button" title="Xóa" onclick="myFunction(this)"><i
                                            class="fas fa-trash-alt"></i> Xóa tất cả </a>
                                </div>
                                
                                
                            </div>
                            <label >Tim kiem</label>
                                   <div >
                                       <form action="AdminController" method="get">
                                    <input value="${search}" name="search" type="text" class="left-box"/>
                                     <input type="submit" hidden/>
                                       </form>
                                </div>
                            
                            <table class="table table-hover table-bordered" id="Table">
                                <thead>
                                    <tr>
                                        <th width="10"><input type="checkbox" id="all"></th>
                                        <th>Mã sản phẩm</th>
                                        <th>Danh mục</th>
                                        <th>Tên sản phẩm</th>
                                        <th>Mô tả</th>
                                        <th>Ảnh</th>
                                        <th>Số lượng</th>
                                        
                                        <th>Giá tiền</th>
                                        <th>Tình trạng</th>
                                        <th>Date</th>
                                        <th>Chức năng</th>
                                        
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${product}" var="p">
                                    <tr>
                                        <!--<td width="10"><input type="checkbox" name="check1" value="1"></td>-->
                                        
                                        <td></td>
                                        <td>${p.productID}</td>
                                        <td>${p.categories.name}</td>
                                        <td>${p.name}</td>
                                        <td>${p.desciption}</td>
                                        <td > <img class="col-4" src="${p.picture}"> <img class="col-4" src="${p.picture2}">  <img class="col-4" src="${p.picture3}"></td>
                                        <td>${p.quantity}</td>
                                        <td>${p.price}</td> 
                                        <td>${p.status}</td>  
                                         <td style="width: 100px;">${p.date}</td> 
                                        
                                        <td><a href="editproduct?id=${p.productID}&action=edit"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                        <a href="editproduct" class="delete" data-toggle="modal" ><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                                        </td>
                                    </tr>
                                    </c:forEach>
                                    
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        

        <!-- Essential javascripts for application to work-->
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="src/jquery.table2excel.js"></script>
        <script src="js/main.js"></script>
        <!-- The javascript plugin to display page loading on top-->
        <script src="js/plugins/pace.min.js"></script>
        <!-- Page specific javascripts-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
        <!-- Data table plugin-->
        <script type="text/javascript" src="js/plugins/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="js/plugins/dataTables.bootstrap.min.js"></script>
        <script type="text/javascript">
                                                    
                                                    //Thời Gian
                                                    function time() {
                                                        var today = new Date();
                                                        var weekday = new Array(7);
                                                        weekday[0] = "Chủ Nhật";
                                                        weekday[1] = "Thứ Hai";
                                                        weekday[2] = "Thứ Ba";
                                                        weekday[3] = "Thứ Tư";
                                                        weekday[4] = "Thứ Năm";
                                                        weekday[5] = "Thứ Sáu";
                                                        weekday[6] = "Thứ Bảy";
                                                        var day = weekday[today.getDay()];
                                                        var dd = today.getDate();
                                                        var mm = today.getMonth() + 1;
                                                        var yyyy = today.getFullYear();
                                                        var h = today.getHours();
                                                        var m = today.getMinutes();
                                                        var s = today.getSeconds();
                                                        m = checkTime(m);
                                                        s = checkTime(s);
                                                        nowTime = h + " giờ " + m + " phút " + s + " giây";
                                                        if (dd < 10) {
                                                            dd = '0' + dd
                                                        }
                                                        if (mm < 10) {
                                                            mm = '0' + mm
                                                        }
                                                        today = day + ', ' + dd + '/' + mm + '/' + yyyy;
                                                        tmp = '<span class="date"> ' + today + ' - ' + nowTime +
                                                                '</span>';
                                                        document.getElementById("clock").innerHTML = tmp;
                                                        clocktime = setTimeout("time()", "1000", "Javascript");

                                                        function checkTime(i) {
                                                            if (i < 10) {
                                                                i = "0" + i;
                                                            }
                                                            return i;
                                                        }
                                                    }
        </script>
    </body>

</html>