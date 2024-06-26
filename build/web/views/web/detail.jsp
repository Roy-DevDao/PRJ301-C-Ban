<%@page import="model.Fooditem"%>
<%@page import="model.User"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String imagepath = null;

    List<User> ul = (List<User>) session.getAttribute("listuserlogin");

    if (ul != null) {
        imagepath = ul.get(0).getAvatar_path();

    }

    List<Fooditem> listf = (List<Fooditem>) session.getAttribute("listf");

    List<Fooditem> listfdetail = (List<Fooditem>) session.getAttribute("listdetailf");

%>
<!DOCTYPE html>
<html>

    <head>
        <!-- Basic -->
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <!-- Mobile Metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <!-- Site Metas -->
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/favicon.png" >

        <title> Chi tiết - TDAT </title>

        <!-- bootstrap core css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.css" />

        <!--owl slider stylesheet -->
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
        <!-- nice select  -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css" integrity="sha512-CruCP+TD3yXzlvvijET8wV5WxxEh5H8P4cmz0RFbKK6FlZ2sYl3AEsKlLPHbniXKSrDdFewhbmBK5skbdsASbQ==" crossorigin="anonymous" />
        <!-- font awesome style -->
        <link href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style_2.css" type="text/css">
        <!-- Custom styles for this template -->
        <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/styles.css">
        <!-- responsive style -->
        <link href="${pageContext.request.contextPath}/assets/css/responsive.css" rel="stylesheet" />

        <link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css"/>


    </head>

    <body class="sub_page">
        <div class="hero_area">
            <%@include file="../layout/header.jsp"%>
        </div>

        <!-- Product Details Section Begin -->
        <section class="food_section layout_padding">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 col-lg-4 all pizza">
                        <div class="product__details__pic">
                            <div class="img-box">
                                <img src="<%=listfdetail.get(0).getImage()%>" alt="">
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="product__details__text">
                            <h3><%=listfdetail.get(0).getName()%></h3>

                            <div class="product__details__price">
                                <%=listfdetail.get(0).getPrice()%>₫
                            </div>

                            <form name="f" action="buycontroller" method="post">
                                <div class="product__details__quantity">
                                    <input id="quantityInput" class="pagination-link active" type="number" name="num" value="1" min="1" max="100"/>
                                </div>

                                <script>
                                    // JavaScript code
                                    document.addEventListener('DOMContentLoaded', function () {
                                        // Get the input element
                                        const quantityInput = document.getElementById('quantityInput');

                                        // Add event listener for input change
                                        quantityInput.addEventListener('change', function () {
                                            // Get the value entered by the user
                                            let enteredValue = parseInt(this.value);

                                            // Check if the entered value is less than 1 or greater than 100
                                            if (enteredValue < 1 || isNaN(enteredValue)) {
                                                // If the value is less than 1 or not a number, set it to 1
                                                this.value = 1;
                                            } else if (enteredValue > 100) {
                                                // If the value is greater than 100, set it to 100
                                                this.value = 100;
                                            }
                                        });
                                    });
                                </script>



                                <% if (ul == null) { %>
                                <a href="./logincontroller" class="btn btn-dark">Thêm vào giỏ hàng</a>
                                <% } else {%>
                                <input type="submit" class="btn btn-dark" onclick="buy(<%=listfdetail.get(0).getId()%>)" value="Thêm vào giỏ hàng"/>
                                <% } %>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Product Details Section End -->

        <!-- offer section -->
        <section class="offer_section layout_padding-bottom">
            <div class="heading_container heading_center">
                <h2>
                    Các món mới của chúng tôi!
                </h2>
            </div>
            <div class="offer_container">
                <div class="container ">
                    <div class="row">

                        <%for (Fooditem f : listf) {%>
                        <div class="col-md-6  ">
                            <div class="box ">
                                <div class="img-box">
                                    <img src="<%=f.getImage()%>" alt="">
                                </div>
                                <div class="detail-box">
                                    <h5>
                                        <%=f.getName()%>
                                    </h5>
                                    <h6>
                                        <span><%=f.getPrice()%></span>₫
                                    </h6>
                                    <a href="./detailcontroller?id=<%=f.getId()%>">
                                        Chi tiết <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 456.029 456.029" style="enable-background:new 0 0 456.029 456.029;" xml:space="preserve">
                                        <g>
                                        <g>
                                        <path d="M345.6,338.862c-29.184,0-53.248,23.552-53.248,53.248c0,29.184,23.552,53.248,53.248,53.248
                                              c29.184,0,53.248-23.552,53.248-53.248C398.336,362.926,374.784,338.862,345.6,338.862z" />
                                        </g>
                                        </g>
                                        <g>
                                        <g>
                                        <path d="M439.296,84.91c-1.024,0-2.56-0.512-4.096-0.512H112.64l-5.12-34.304C104.448,27.566,84.992,10.67,61.952,10.67H20.48
                                              C9.216,10.67,0,19.886,0,31.15c0,11.264,9.216,20.48,20.48,20.48h41.472c2.56,0,4.608,2.048,5.12,4.608l31.744,216.064
                                              c4.096,27.136,27.648,47.616,55.296,47.616h212.992c26.624,0,49.664-18.944,55.296-45.056l33.28-166.4
                                              C457.728,97.71,450.56,86.958,439.296,84.91z" />
                                        </g>
                                        </g>
                                        <g>
                                        <g>
                                        <path d="M215.04,389.55c-1.024-28.16-24.576-50.688-52.736-50.688c-29.696,1.536-52.224,26.112-51.2,55.296
                                              c1.024,28.16,24.064,50.688,52.224,50.688h1.024C193.536,443.31,216.576,418.734,215.04,389.55z" />
                                        </g>
                                        </g>                                                                           
                                        </svg>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <%}%>
                    </div>
                </div>
            </div>                   
        </section>
        <!-- end offer section -->

        <%@include file="/views/layout/footer.jsp" %>

        <!-- jQery -->
        <script src="${pageContext.request.contextPath}/assets/js/jquery-3.4.1.min.js"></script>
        <!-- popper js -->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous">
        </script>
        <!-- bootstrap js -->
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap.js"></script>
        <!-- owl slider -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js">
        </script>
        <!-- isotope js -->
        <script src="https://unpkg.com/isotope-layout@3.0.4/dist/isotope.pkgd.min.js"></script>
        <!-- nice select -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
        <!-- custom js -->
        <script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>

        <script type="text/javascript">
                                    function buy(id) {
                                        document.f.action = "buycontroller?id=" + id;
                                        document.f.submit()();
                                    }
        </script>
    </body>

</html>


