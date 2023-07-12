<%-- 
    Document   : productmanager
    Created on : 24-05-2023, 01:34:04
    Author     : trand
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <link rel="icon" href="image/icon.png" type="image/x-icon"/>
        <title>Danh sách sản phẩm</title>
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
        <style>
            .dropbtn {
                background-color: #ef2317;
                color: white;
                padding: 16px;
                font-family: Roboto;
                border: none;
            }

            .dropdown {
                margin-right: 100px;
                margin-top: 2px;
                position: relative;
                display: inline-block;
                font-size: 30px;
                color: white;
            }

            .dropdown-content {
                display: none;
                position: absolute;
                background-color: white;
                min-width: 120px;
                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
                z-index: 1;
            }

            .dropdown-content a {
                color: black;
                padding: 12px 12px;
                text-decoration: none;
                display: block;
                font-size: 15px;
            }

            .dropdown-content a:hover {
                background-color: #ef2317;
                color: white;
            }

            .dropdown:hover .dropdown-content {
                display: block;
            }

            .dropdown:hover .dropbtn {
                background-color: #ef2317;
            }
        </style>
    </head>

    <body onload="time()" class="app sidebar-mini rtl">
        <!-- Navbar-->
        <header class="app-header">
            <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar"
                                            aria-label="Hide Sidebar"></a>
            <!-- Navbar Right Menu-->
            <ul class="app-nav">


                <!-- User Menu-->
                <li>
                    <div class="dropdown fas fa-user header__nav-cart-icon">
                        <div class="dropdown-content">
                            <a href="#">Đổi mật khẩu</a>
                            <a href="#">Đăng xuất</a>
                        </div>
                    </div>

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
                <li><a class="app-menu__item " href="ManagerHompageController"><i class='app-menu__icon bx bx-tachometer'></i><span
                            class="app-menu__label">Bảng điều khiển</span></a></li>

                <li><a class="app-menu__item active" href="ManagerProductController"><i
                            class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Danh sách sản phẩm</span></a>
                </li>
                <li><a class="app-menu__item" href="ManagerOrderController"><i class='app-menu__icon bx bx-task'></i><span
                            class="app-menu__label">Danh sách đơn hàng</span></a></li>
                <li><a class="app-menu__item" href="ManagerFeedbackController"><i class='app-menu__icon bx bx-run'></i><span
                            class="app-menu__label">Đánh giá </span></a></li>
                <li><a class="app-menu__item" href="incomemanager.jsp"><i
                            class='app-menu__icon bx bx-pie-chart-alt-2'></i><span class="app-menu__label">Báo cáo doanh thu</span></a>
                </li>
            </ul>
        </aside>
        <main class="app-content">
            <div class="app-title">
                <ul class="app-breadcrumb breadcrumb side">
                    <li class="breadcrumb-item active"><a href="ManagerProductController"><b>Danh sách sản phẩm</b></a></li>
                </ul>
                <div id="clock"></div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <div class="tile-body">
                            <div class="row element-button">
                                <div class="col-sm-2">

                                    <a class="btn btn-add btn-sm" href="ManagerAddProductController" title="Thêm"><i class="fas fa-plus"></i>
                                        Tạo mới sản phẩm</a>
                                </div>
                                <div class="col-sm-2">
                                    <a class="btn btn-delete btn-sm nhap-tu-file" type="button" title="Nhập" onclick="myFunction(this)"><i
                                            class="fas fa-file-upload"></i> Tải từ file</a>
                                </div>

                                <div class="col-sm-2">
                                    <a class="btn btn-delete btn-sm print-file" type="button" title="In" onclick="myApp.printTable()"><i
                                            class="fas fa-print"></i> In dữ liệu</a>
                                </div>
                                <div class="col-sm-2">
                                    <a class="btn btn-excel btn-sm" href="" title="In"><i class="fas fa-file-excel"></i> Xuất file</a>
                                </div>
                            </div>
                            <table class="table table-hover table-bordered" id="sampleTable">
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
                                        <th>Ngày nhập</th>
                                        <th>Tính năng</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${listP}" var="o">
                                        <tr>
                                            <td width="10"><input type="checkbox" name="check1" value="1"></td>
                                            <td>${o.getProductID()}</td>
                                            <td>${listC.get(o.getProduct_categoryID()-1).getName()}</td>
                                            <td>${o.getName()}</td>
                                            <td>${o.getDesciption()}</td>
                                            <td><img src="${o.getPicture()}" alt="alt" width="100px"/>
                                                <img src="${o.getPicture2()}" alt="alt" width="50px"/>
                                                <img src="${o.getPicture3()}" alt="alt" width="50px"/>
                                            </td>
                                            <td>${o.getQuantity()}</td>
                                            <td>${o.getPrice()}</td>
                                            <td>${o.getStatus()}</td>
                                            <td>${o.getDate()}</td>
                                            <td><a href="ManagerDeleteProduct?id=${o.getProductID()}">
                                                    <button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                                                            onclick="myFunction(this)"><i class="fas fa-trash-alt"></i> 
                                                    </button>
                                                </a>
                                                <a href="ManagerUpdateProductController?id=${o.getProductID()}">
                                                    <button class="btn btn-primary btn-sm edit" type="button" title="Sửa">
                                                        <i class="fas fa-edit"></i>
                                                    </button>
                                                </a>
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
        <!--
                
                  MODAL
                
                <div class="modal fade" id="ModalUP" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static"
                     data-keyboard="false">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
        
                            <div class="modal-body">
                                <div class="row">
                                    <div class="form-group  col-md-12">
                                        <span class="thong-tin-thanh-toan">
                                            <h5>Chỉnh sửa thông tin sản phẩm</h5>
                                        </span>
                                    </div>
                                </div>
                                <form action="ManagerProductController" method="post">
                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <label class="control-label">Mã sản phẩm </label>
                                        <input class="form-control" type="" value="${pid}">
                                        <div name="pid">${pid}</div>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label class="control-label">Danh mục</label>
                                        <input class="form-control" type="text">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label class="control-label">Tên sản phẩm</label>
                                        <input class="form-control" type="text" value="${name}">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label class="control-label">Mô tả</label>
                                        <input class="form-control" type="text" value="${desciption}">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label class="control-label">Ảnh</label>
                                        <input class="form-control" type="file" value="${img}">
                                    </div>
                                    <div class="form-group  col-md-6">
                                        <label class="control-label">Số lượng</label>
                                        <input class="form-control" type="number" ${quantity}>
                                    </div>
                                    <div class="form-group col-md-6 ">
                                        <label for="exampleSelect1" class="control-label">Tình trạng sản phẩm</label>
                                        <select class="form-control" id="exampleSelect1">
                                            <option>Còn hàng</option>
                                            <option>Hết hàng</option>
                                            <option>Đang nhập hàng</option>
                                        </select>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label class="control-label">Giá bán</label>
                                        <input class="form-control" type="text" value="${price}">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="exampleSelect1" class="control-label">Danh mục</label>
                                        <select class="form-control" id="exampleSelect1" name="cid">
                                            <option>Tai nghe</option>
                                            <option>Bàn phím</option>
                                            <option>Chuột</option>
                                        </select>
                                    </div>
                                </div>
                                <BR>
                                <button class="btn btn-save" type="submit">Lưu lại</button>
                                <a class="btn btn-cancel" data-dismiss="modal" href="#">Hủy bỏ</a>
                                <BR>
                                </form>
                            </div>
                            <div class="modal-footer">
                            </div>
                        </div>
                    </div>
                </div>
                
                MODAL
        -->

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
                                                                $('#sampleTable').DataTable();
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
        <script>
            function deleteRow(r) {
                var i = r.parentNode.parentNode.rowIndex;
                document.getElementById("myTable").deleteRow(i);
            }
            jQuery(function () {
                jQuery(".trash").click(function () {
                    swal({
                        title: "Cảnh báo",
                        text: "Bạn có chắc chắn là muốn xóa sản phẩm này?",
                        buttons: ["Hủy bỏ", "Đồng ý"],
                    })
                            .then((willDelete) => {
                                if (willDelete) {
                                    swal("Đã xóa thành công.!", {

                                    });
                                }
                            });
                });
            });
            oTable = $('#sampleTable').dataTable();
            $('#all').click(function (e) {
                $('#sampleTable tbody :checkbox').prop('checked', $(this).is(':checked'));
                e.stopImmediatePropagation();
            });
        </script>
    </body>

</html>