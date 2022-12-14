<%--@elvariable id="plant" type="java.lang.String" --%> <!-- scope"REQUEEST_SCOPE" -->
<%--@elvariable id="addToCart_Successful" type="java.lang.Boolean" --%> <!-- scope"REQUEEST_SCOPE" -->
<%-- 
    Document   : plant_detail
    Created on : Oct 22, 2022, 3:20:27 PM
    Author     : RaeKyo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Detail</title>
        <style>
            img{
                width: 400px;
                height: 500px;
            }
        </style>
    </head>
    <body>
        <div class="row m-0">
            <div class="col-lg-4 left-side-product-box pb-3">
                <img class="border p-3" src="<c:url value="${requestScope.plant.imgPath}" />" alt="Img for product ${plant.plantName}"/>
            </div>
            <div class="col-lg-8">
                <div class="right-side-pro-detail border p-3 m-0">
                    <div class="row">
                        <div class="col-lg-12">
                            <h2>Product Detail #${requestScope.plant.plantId} - ${requestScope.plant.plantName}</h2>
                            <p><i>Customer name - ${(sessionScope.user == null) ? "guest" : sessionScope.user.fullname}</i></p>

                            <h4>Product: ${plant.plantName}</h4><br/>
                            <p><b>Price:</b> ${requestScope.plant.price}$</p>
                            <p><b>Status:</b> ${requestScope.plant.status == 1 ? "available" : "unavailable"}</p>
                            <p><b>Country:</b> ${initParam.country}</p>
                            <p><b>Description:</b> ${requestScope.plant.description}</p>

                            <c:if test="${addToCart_Successful}">
                                <h4><font color = "red">Your product was added, To ViewCart click on <a href="<c:url value="/guest?action=viewCart"/>">here</a></font></h4>
                            </c:if>

                                <c:choose>
                                    <c:when test="${plant.status != Plant.UNAVAILABLE}">
                                        <form action="<c:url value="/guest"/>" method="GET"> 
                                            <p>Quantity: <input type="number" name="quantity" min="1" max="20" value="1"></p>
                                            <p><input type="hidden" name="action" value="addToCart"></p>
                                            <p><input type="hidden" name="plantId" value="${requestScope.plant.plantId}"></p>
                                            <p><i class="bi bi-cart"></i><input class="btn btn-success" type="submit" value="Add To Cart" /></p>
                                        </form>
                                    </c:when>
                                    <c:otherwise> <!-- User can click on unavailable products -->
                                        <p><input class="btn btn-success" type="submit" disabled value="Add To Cart" /></p>
                                    </c:otherwise>
                                </c:choose>
                         </div>       
                    </div>
                </div>    
            </div>
        </div>
    </body>
    
    
</html>
