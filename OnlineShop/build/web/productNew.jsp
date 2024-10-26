<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    </head>

    <body>
        <div style="width: max; height: 400px; background-image: url('https://bizweb.dktcdn.net/100/436/596/themes/834446/assets/evo-col-banner.jpg?1709705396374');">

            
        </div>
        <div class="container">

            <!-- Page Features -->
            <c:forEach items="${requestScope.getListOfListProductNewList}" var="pl">  
                <div class="row text-center" style="background:">
                    <div class="col-md-12"><h1>${pl.nameList}</h1></div>
                            <c:forEach items="${pl.listProductNew}" var="p">
                        <a class="col-lg-3 col-md-6 mb-4" href="productDetail?id=${p.id}">
                            <div class="card h-100">
                                <img class="card-img-top" src="img_product/${p.image}" >
                                <div class="card-body">
                                    <h4 class="card-title">${p.name}</h4>
                                    <p class="card-text" style="text-decoration: line-through;color: red;"><fmt:formatNumber value="${p.price+(0.15*p.price)}" pattern="#,###"/> </p>
                                    <p class="card-text"><fmt:formatNumber value="${p.price}" pattern="#,###"/>VNĐ</p>
                                    <h5><span class="badge bg-primary ms-2">New</span></h5>
                                </div>
                            </div>
                        </a>
                    </c:forEach>
                    <c:if test="${pl.nameList == 'keybroad'}">
                        <a href="productList?type_id=1">
                            <img src="https://image.talentnetwork.vn/sacombank///news/2017/08/23/1503484172_giphy.gif" width="130px" height="50px" alt="alt"/></br>
                            <hr>
                        </a>
                    </c:if>
                    <c:if test="${pl.nameList == 'mouse'}">
                        <a href="productList?type_id=2">
                            <img src="https://image.talentnetwork.vn/sacombank///news/2017/08/23/1503484172_giphy.gif" width="130px" height="50px" alt="alt"/>
                            <hr>
                        </a>
                    </c:if>
                    <c:if test="${pl.nameList == 'mouse pad'}">
                        <a href="productList?type_id=3">
                            <img src="https://image.talentnetwork.vn/sacombank///news/2017/08/23/1503484172_giphy.gif" width="130px" height="50px" alt="alt"/>
                            <hr>
                        </a>
                    </c:if>
                    <c:if test="${pl.nameList == 'keycap'}">
                        <a href="productList?type_id=4">
                            <img src="https://image.talentnetwork.vn/sacombank///news/2017/08/23/1503484172_giphy.gif" width="130px" height="50px" alt="alt"/>
                            <hr>
                        </a>
                    </c:if>
                    <c:if test="${pl.nameList == 'other'}">
                        <a href="productList?type_id=5">
                            <img src="https://image.talentnetwork.vn/sacombank///news/2017/08/23/1503484172_giphy.gif" width="130px" height="50px" alt="alt"/>
                            <hr>
                        </a>
                    </c:if>

                </div>
            </c:forEach>

        </div>
        <jsp:include page="footer.jsp"/> 
    </body>
</html>
