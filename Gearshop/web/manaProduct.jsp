<%--
    Document   : productList
    Created on : Feb 26, 2024, 4:02:14 PM
    Author     : thinh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet"/>
        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet"/>
        <!-- MDB -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.1.0/mdb.min.css" rel="stylesheet"/>
        <style>


            .sidenav {
                color: wheat;
                height: 100%; /* 100% Full-height */
                width: 0; /* 0 width - change this with JavaScript */
                position: fixed; /* Stay in place */
                z-index: 1; /* Stay on top */
                top: 66; /* Stay at the top */
                left: 0;
                background:#062c33; /* Black*/
                overflow-x: hidden; /* Disable horizontal scroll */
                padding-top: 60px; /* Place content 60px from the top */
                transition: 0.5s; /* 0.5 second transition effect to slide in the sidenav */
            }

            /* The navigation menu links */
            .sidenav a {
                padding: 8px 8px -9px 32px;
                text-decoration: none;
                font-size: 18px;
                color: #818181;
                display: block;
                transition: 0.3s;
            }

            /* When you mouse over the navigation links, change their color */
            .sidenav a:hover {
                color: #f1f1f1;
            }

            /* Position and style the close button (top right corner) */
            .sidenav .closebtn {
                position: absolute;
                top: 0;
                right: 25px;
                font-size: 36px;
                margin-left: 50px;
            }

            /* Style page content - use this if you want to push the page content to the right when you open the side navigation */
            #main {
                transition: margin-left .5s;
                padding: 0;

            }

            /* On smaller screens, where height is less than 450px, change the style of the sidenav (less padding and a smaller font size) */
            @media screen and (max-height: 450px) {
                .sidenav {
                    padding-top: 15px;
                }
                .sidenav {
                    font-size: 10px;
                }
            }

            .p {
                font-size: 5px;
            }
            .search{
                position: fixed;
                width: 100%;
                z-index: 2;
            }

            .sidenav {
                /* your existing styles */
                position: fixed;
                z-index: 1;
                transition: 0.5s;
            }

            .pagination {
                display: inline-block;
            }

            .pagination a {
                color: black;
                float: left;
                padding: 8px 16px;
                text-decoration: none;
            }

            .pagination a.active {
                background-color: #4CAF50;
                color: white  !important; 
            }

            .pagination a:hover:not(.active) {
                background-color: #ddd;
            }


        </style>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    </head>
    <body class='body'>
        <c:set var="cid" value="${requestScope.id}"/>
        <c:set var="name" value="${requestScope.name}"/>
        <c:set var="price_from" value="${requestScope.priceFrom}"/>
        <c:set var="price_to" value="${requestScope.priceTo}"/>
        <c:set var="type_raw" value="${requestScope.Type}"/>
        <c:set var="type_raw_id" value="${requestScope.type_id_raw}"/>
        <form id="myForm" action="managerProduct" onsubmit="submitForm(event)">
            <div id="mySidenav" class="sidenav" style="padding-right: 10px; padding-left: 10px" >    
                <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                <h3 class="a">Tìm kiếm</h3>
                <div class="input-group mb-3">
                    <input name="name" type="text" placeholder="Name product" class="form-control" aria-label="Dollar amount (with dot and two decimal places)">
                </div>
                <p class="a">Mức giá trên</p>
                <div class="input-group mb-3">
                    <input name="price_from" type="text"  placeholder="VNĐ" class="form-control" aria-label="Dollar amount (with dot and two decimal places)">
                </div>
                <p class="a">Mức giá dưới</p>
                <div class="input-group mb-3">
                    <input name="price_To" type="text"  placeholder="VNĐ" class="form-control" aria-label="Dollar amount (with dot and two decimal places)">
                </div>
                <p class="a">Thương hiệu sản phẩm</p>
                <select name="cid"  class="form-select a" aria-label="Default select example">
                    <option value="0">All</option>
                    <c:forEach items="${requestScope.categories}" var="c">                       
                        <option value="${c.id}">${c.productType.name} ${c.name}</option>
                    </c:forEach>                
                </select>

                <br/><br/>
                <!-- Default checkbox -->
                <div class="form-check">
                    <input class="form-check-input " name="type_raw" type="checkbox" value ="1" id="option1"  onclick="handleCheckboxClick('option1')">
                    <label class="form-check-label " for="option1">Sắp xếp tăng dần theo giá</label>
                </div>
                <!-- Checked checkbox -->
                <div class="form-check">
                    <input class="form-check-input " name="type_raw" type="checkbox"  value ="2" id="option2" onclick="handleCheckboxClick('option2')">
                    <label class="form-check-label " for="option2">sắp xếp giảm dần theo giá</label>
                </div>
                <button type="submit" class="btn btn-primary btn-sm btn-block mt-4" style="font-size: 25px">Tìm</button>
                <button type="submit" class="btn btn-success btn-sm btn-block"> <a href="addProduct" target="target" style="color: white">Add product</a> </button>
            </div> 

        </form>

        <!-- sidenav -->


        <div id="main" style="">
            <form id="myForm" action="managerProduct">
                <div class="row flex-fill search align-items-center" style="background: #062c33;height: 60px;margin-left: 1px">
                    <div class="open col-sm-1 d-flex align-items-center justify-content-cente" onclick="option()" style="background: white"><img src="https://static.vecteezy.com/system/resources/previews/000/572/119/non_2x/menu-icon-vector.jpg" style="width:35%;"/></div>
                    <div class="col-md-1">
                        <button  class="btn btn-secondary " type="submit" style="width: 150px">
                            Reset 
                        </button>
                    </div>
                    <div class="col-md-1">
                        <a  class="btn btn-secondary" href="addProduct" style="width: 150px">
                             Add procduct
                        </a>
                    </div>
                    <c:forEach items="${requestScope.type}" var="t">   
                        <div class="col-md-1">
                            <div class="dropdown">
                                <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false" style="width: 150px">
                                    ${t.name}
                                </button>
                                <ul class="dropdown-menu">
                                    <c:forEach items="${requestScope.categories}" var="c">
                                        <c:if test="${c.productType.id == t.id}">
                                            <li><a class="dropdown-item"  href="managerProduct?cid=${c.id}&type_id=${t.id}">${c.name}</a></li>
                                            </c:if>
                                        </c:forEach>
                                </ul>
                            </div> 
                        </div>
                    </c:forEach>
                    <div class="col-md-1">

                        <div class="dropdown">
                            <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false" style="width: 150px">
                                type
                            </button>
                            <ul class="dropdown-menu">
                                <c:forEach items="${requestScope.type}" var="t">

                                    <li><a class="dropdown-item"  href="managerProduct?cid=0&type_id=${t.id}">${t.name}</a></li>

                                </c:forEach>
                            </ul>
                        </div> 
                    </div>
                </div>   
            </form>



            <!-- Use any element to open the side nav -->
            <section>
                <div class="text-center container py-5">                    
                    <div class="mt-4 mb-5"><strong style="color: white;">có ${requestScope.count} sản phẩm</strong></div> 
                    <c:if test="${requestScope.product == null}">
                        <img src="https://www.kalpamritmarketing.com/design_img/no-product-found.jpg" alt="No Product Found"/>
                    </c:if>


                    <!--Phần phân trang-->

                    <c:if test="${requestScope.product != null}">
                        <div class="pagination">
                            <c:set var="page" value="${requestScope.page}"/>
                            <a style="color: black;" href="managerProduct?page=${1}&cid=${id}&name=${name}&price_from=${priceFrom}&price_To=${priceTo}&type_raw=${Type}&type_id=${type_id_raw}">&laquo;</a>
                            <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                                <a style="color: black;" class="${i==page?"active":""}" href="managerProduct?page=${i}&cid=${id}&name=${name}&price_from=${priceFrom}&price_To=${priceTo}&type_raw=${Type}&type_id=${type_id_raw}">${i}</a>
                            </c:forEach> 
                            <a style="color: black;" href="managerProduct?page=${num}&cid=${id}&name=${name}&price_from=${priceFrom}&price_To=${priceTo}&type_raw=${Type}&type_id=${type_id_raw}">&raquo;</a>
                        </div>
                    </c:if>

                    <!-- kết thức phần phân trang -->  
                    <!--page khac-->
                    <section style="background-color: #eee;">
                        <div class="container py-5">
                            <div class="row justify-content-center mb-3">
                                <c:forEach items="${requestScope.product}" var="pd">
                                    <div class="col-md-12 col-xl-6">
                                        <div class="card shadow-0 border rounded-3">
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col-md-12 col-lg-3 col-xl-3 mb-4 mb-lg-0">
                                                        <div class="bg-image hover-zoom ripple rounded ripple-surface">
                                                            <img src="img_product/${pd.image}"   
                                                                 class="w-100" />
                                                            <a href="#!">
                                                                <div class="hover-overlay">
                                                                    <div class="mask" style="background-color: rgba(253, 253, 253, 0.15);"></div>
                                                                </div>
                                                            </a>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6 col-lg-6 col-xl-6">
                                                        <h5>${pd.name}</h5>
                                                        <div class="mb-1 text-muted">
                                                            <span>Số lượng sản phẩm ${pd.quantity}</span>
                                                        </div> 
                                                        <div class="mb-2 text-muted">
                                                            <span>id ${pd.id}|</span>
                                                            <span>${pd.productType.name}</span>
                                                        </div>                                                      
                                                        <p class="text-truncate mb-4 mb-md-0">
                                                        </p>
                                                    </div>
                                                    <div class="col-md-6 col-lg-3 col-xl-3 border-sm-start-none border-start">
                                                        <div class="d-flex flex-row align-items-center mb-1">
                                                            <h4 class="mb-1 me-1"><fmt:formatNumber value="${pd.price}" pattern="#,###"/>&nbsp; VNĐ</h4>
                                                        </div>
                                                        <div class="d-flex flex-column mt-4">
                                                            <a id="delete" href="#" onclick="doDelete('${pd.id}')" class="btn btn-outline-primary btn-sm mt-2">                           
                                                                Delete
                                                            </a>
                                                            <a class="btn btn-outline-primary btn-sm mt-2" href="update?id=${pd.id}&page=${requestScope.page}">
                                                                Update
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </section>

                    <!--Phần phân trang-->

                    <c:if test="${requestScope.product != null}">
                        <div class="pagination">
                            <c:set var="page" value="${requestScope.page}"/>
                            <a style="color: black;" href="managerProduct?page=${1}&cid=${id}&name=${name}&price_from=${priceFrom}&price_To=${priceTo}&type_raw=${Type}&type_id=${type_id_raw}">&laquo;</a>
                            <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                                <a style="color: black;"  class="${i==page?"active":""}" href="managerProduct?page=${i}&cid=${id}&name=${name}&price_from=${priceFrom}&price_To=${priceTo}&type_raw=${Type}&type_id=${type_id_raw}">${i}</a>
                            </c:forEach> 
                            <a style="color: black;"  href="managerProduct?page=${num}&cid=${id}&name=${name}&price_from=${priceFrom}&price_To=${priceTo}&type_raw=${Type}&type_id=${type_id_raw}">&raquo;</a>
                        </div>
                    </c:if>

                    <!-- kết thức phần phân trang -->  
                </div>
            </section>
        </div>
        <!-- sidenav end -->
        <script>
            let isOpen = false;

            function option() {
                if (isOpen) {
                    closeNav();
                } else {
                    openNav();
                }
            }

            function handleCheckboxClick(clickedCheckboxId) {
                const checkboxes = document.querySelectorAll('input[type="checkbox"]');
                checkboxes.forEach(checkbox => {
                    if (checkbox.id !== clickedCheckboxId) {
                        checkbox.checked = false;
                    }
                });
            }

            function openNav() {
                document.getElementById("mySidenav").style.width = "300px";
                document.getElementById("main").style.marginLeft = "300px";

                isOpen = true;
            }

            function closeNav() {
                document.getElementById("mySidenav").style.width = "0";
                document.getElementById("main").style.marginLeft = "0";

                isOpen = false;
            }

            function submitForm(event) {
                event.preventDefault(); // Prevent the default form submission behavior
                document.getElementById("myForm").submit();
                // Remove the closeNav() call from here so that the sidebar stays open after form submission
            }



        </script>
        <script type="text/javascript">
            function doDelete(id, ) {
                if (confirm('Bạn có muốn xóa sản phẩm có mã là ' + id + ' không ?')) {
                    window.location = 'deleteProduct?product_id=' + id + '&page=${requestScope.page}&cid=${id}&name=${name}&price_from=${priceFrom}&price_To=${priceTo}&type_raw=${Type}&type_id=${type_id_raw}';
                }
            }
        </script>

    </body>
</html>



