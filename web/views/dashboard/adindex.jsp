<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.User"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<User> listU = (List<User>) session.getAttribute("listU");
%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Quản lý - BẢO DEPZAI</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/fontawesome.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/templatemo-style.css">

        <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/favicon.png" >
    </head>

    <body id="reportsPage">

        <%@include file="../layout/headerad.jsp" %>

        <div class="container">
            <div class="row">
                <div class="col">
                    <p class="text-white mt-5 mb-5">Xin chào, ${sessionScope.username} (Admin) <b></b></p>
                </div>
            </div>


            <!--Order part-->
            <div class="col-12 tm-block-col">
                <div class="tm-bg-primary-dark tm-block tm-block-taller tm-block-scroll">
                    <h2 class="tm-block-title">Danh sách mua hàng</h2>
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Stt</th>
                                <th scope="col">Người mua hàng</th>
                                <th scope="col">Tổng thanh toán</th>
                                <th scope="col">Phương thức</th>
                                <th scope="col">Ngày mua hàng</th>
                                <th scope="col">Trạng thái</th>

                            </tr>

                        </thead>
                        <tbody>
                            <c:set var="n" value="0"/>
                            <c:forEach items="${sessionScope.listO}" var="i">

                                <tr>                                                                     
                                    <th scope="row"><b>${n = n +1}</b></th>
                                    <td><b>${i.username}</b></td>
                                    <td><b>${i.total_price}₫</b></td>
                                    <td><b>${i.payment}</b></td>
                                    <td><b>${i.start_date}</b></td>

                                    <c:choose>
                                        <c:when test="${i.status == 'Đang xử lý'}">
                                            <td><span class="badge badge-info">${i.status}</span></td>
                                        </c:when>

                                        <c:when test="${i.status == 'Đã hủy'}">
                                            <td><span class="badge badge-danger">${i.status}</span></td>

                                        </c:when>

                                        <c:otherwise>
                                            <td><span class="badge badge-success">${i.status}</span></td>
                                        </c:otherwise>
                                    </c:choose> 

                                </tr>

                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <!--End Order part-->

        </div>
    </div>

    <br><br/>
    <br><br/>
    <%@include file="../layout/footerad.jsp" %>

</div>

<script src="${pageContext.request.contextPath}/assets/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/Chart.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/tooplate-scripts.js"></script>

</body>

</html>