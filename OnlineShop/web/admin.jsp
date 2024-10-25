<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Font Awesome -->
        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
            rel="stylesheet"
            />
        <!-- Google Fonts -->
        <link
            href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
            rel="stylesheet"
            />
        <!-- MDB -->
        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.1.0/mdb.min.css"
            rel="stylesheet"
            />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            nav {
                width: 100%;
                height: 80px;
                background-color: #000000; /* Change this to the desired black color */
                display: block;
                box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.5);
            }
            body {
                margin: 0;
                padding: 0;
                background-color:  #cccccc;
                background-size: cover; 

            }
        </style>


    </head>
    <body>
        <!-- Navbar --------------------------------------------------------------------------->
        <nav class="navbar navbar-expand-lg navbar-nav bg-body-tertiary sticky-top" >
            <!-- Container wrapper -->
            <div class="container-fluid" style="background-color: #147076">
                <!-- Toggle button -->


                <!-- Collapsible wrapper -->
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <!-- Navbar brand -->
                    <a class="navbar-brand mt-2 mt-lg-0" href="managerProduct">
                        <img
                            src="img_icon/Neon Blue and Black Gamer Badge Logo.png"
                            height="60"
                            alt="MDB Logo"
                            loading="lazy"
                            />
                    </a>
                    <div class="d-flex ">
                                        <a class="dropdown-item"  style="font-size: 16px; font-weight: bold " href="managerProduct">Product manager</a>
                                         <a class="dropdown-item"  style="font-size: 16px; font-weight: bold" href="managerAccount" >User manager</a>
                                        <a class="dropdown-item"  style="font-size: 16px; font-weight: bold " href="manaCategory" >Brand manager</a>
                        </div>
                </div>

                <!-- Right elements -->

                <div class="d-flex align-items-center">               
                    <!-- Avatar -->
                    <div class="dropdown">
                        <a
                            data-mdb-dropdown-init
                            class="dropdown-toggle d-flex align-items-center hidden-arrow"
                            href="#"
                            id="navbarDropdownMenuAvatar"
                            role="button"
                            aria-expanded="false"
                            >
                            <img
                                src="${sessionScope.user.image}"
                                class="rounded-circle"
                                height="30"
                                width="30"
                                alt="Black and White Portrait of a Man"
                                loading="lazy"
                                />
                        </a>
                        <ul
                            class="dropdown-menu dropdown-menu-end"
                            aria-labelledby="navbarDropdownMenuAvatar"
                            >
                            <li>
                                <a class="dropdown-item" href="login">Logout</a>
                            </li>
                        </ul>
                    </div>
                </div>

                <!-- Right elements -->
            </div>
            <!-- Container wrapper -->
        </nav>
        <!-- End Navbar -->    
        <div class="main">
            <c:if test="${not empty requestScope.product}">
                <jsp:include page="manaProduct.jsp"/>
            </c:if>
            <c:if test="${requestScope.accountList!=null}">
                <jsp:include page="manaAccount.jsp"/>
            </c:if>
            <c:if test="${requestScope.categoryList!=null}">
                <jsp:include page="manaProductCategory.jsp"/>
            </c:if>
            <c:if test="${requestScope.typeLists!=null}">
                <jsp:include page="manaType.jsp"/>
            </c:if>    
        </div>


        <script >
            // Initialization for ES Users
            import { Dropdown, Collapse, initMDB } from "mdb-ui-kit";
            initMDB({Dropdown, Collapse});
        </script>

        <!-- MDB -->
        <script
            type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.1.0/mdb.umd.min.js";
            initMDB({ Dropdown, Ripple });
        ></script>
        <!-- product list -->

        <script>
            function showDropdown(index) {
                var dropdownId = "myDropdown" + index;
                var dropdown = document.getElementById(dropdownId);
                dropdown.classList.add("show");
            }

            function hideDropdown(index) {
                var dropdownId = "myDropdown" + index;
                var dropdown = document.getElementById(dropdownId);
                dropdown.classList.remove("show");
            }

            function cancelHideDropdown(index) {
                var dropdownId = "myDropdown" + index;
                var dropdown = document.getElementById(dropdownId);
                dropdown.classList.remove("show");
            }
        </script>

    </body>
</html>
