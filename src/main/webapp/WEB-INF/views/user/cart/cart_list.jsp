<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.101.0">
    <title>Pricing example · Bootstrap v4.6</title>

    <!-- Bootstrap core CSS -->
<%@include file="/WEB-INF/views/comm/plugIn2.jsp" %>
<%@include file="/WEB-INF/views/comm/plugIn.jsp" %>



    <!-- Favicons -->


    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>

   
  </head>
  <body>
    
<%@include file="/WEB-INF/views/comm/header.jsp" %>


<div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
 <p>장바구니</p>
</div>

<div class="container">
  <div class="bd-example">
    <table class="table table-hover">
        <thead>
      <tr>
        <th scope="col">#</th>
        <th scope="col">번호</th>
        <th scope="col">상품</th>
        <th scope="col">상품명</th>
        <th scope="col">판매가</th>
        <th scope="col">수량</th>
        <th scope="col">할인</th>
        <th scope="col">합계</th>
        <th scope="col">비고</th>
      </tr>
    </thead>
    <c:forEach items="${cart_list}" var="CartDTOList" varStatus="status">
    <tbody>
      <tr>
        <td><input type="checkbox" value="${CartDTOList.cart_code}" name="cart_code"/></td>
        <td>${CartDTOList.cart_code}</td>
        <td> <img width="40%" height="50" src="/user/cart/imageDisplay?dateFolderName=${pro_list[status.index].pro_up_folder }&fileName=${pro_list[status.index].pro_img}"></td>
        <td>${CartDTOList.pro_name}</td>
        <td><span id="unitprice">${CartDTOList.pro_price}</span></td>
        <td><input type="number" min="1"  value="${CartDTOList.cart_amount}" style="width: 35px;" name="cart_amount"/> 
          <button type="button" class="btn btn-danger btn" name="btn_cart_amount_change" style="width: 60px; height:30px;">변경</button></td>
        <td><span id="unitDiscount">${CartDTOList.pro_discount}</span></td>
        <td><span class="unitTotalprice" id="unitTotalprice">${CartDTOList.pro_price * CartDTOList.cart_amount - CartDTOList.pro_price * CartDTOList.cart_amount * (CartDTOList.pro_discount * 1/100)}</span></td>
        <td><button type="button" class="btn btn-danger">삭제하기</button></td>
     
    </tbody>
  </c:forEach>
  
    </table>
  </div>
  <tfoot>
  <tr>
  <button type="button" class="btn btn-danger">선택삭제</button>
  </tr>
  <tr>

    <td colspan="8">

      최종결제금액 : <span id="cart_total_price"></span>

    </td>

  </tr>
  </tfoot>

	</div>
</div>

  <%@include file="/WEB-INF/views/comm/footer.jsp" %>
</div>

  <!-- 카테고리 메뉴 자바스크립트 작업소스 -->
  
  <script>
	$(document).ready(function() {




    $("button[name='btn_cart_amount_change']").on("click",function() {

      let cur_btn_change = $(this);
     let cart_amount = $(this).parent().find("input[name = 'cart_amount']").val();
     
     let cart_code = $(this).parent().parent().find("input[name = 'cart_code']").val();

    //  let unitprice = $(this).parent().parent().find("span[id = 'unitprice']").val();

     $.ajax({
      url:'/user/cart/cart_amount_change',
      type:'post',
      data:{cart_code : cart_code,cart_amount : cart_amount},
      dataType: 'text',
      success : function(result) {
        if(result == "success") {

          let unitprice = cur_btn_change.parent().parent().find("span#unitprice").text();
          let unitDiscount = cur_btn_change.parent().parent().find("span#unitDiscount").text();
          let unitTotalprice = cur_btn_change.parent().parent().find("span#unitTotalprice").text();

          unitTotalprice.text((unitprice - (unitprice * unitDiscount / 100))) * cart_amount;

          let sumPrice = 0;
          $(".unitTotalprice").each(function() {
           sumPrice += Number($(this).text());
         console.log(sumPrice);

          });
          $("#cart_total_price").text(sumPrice);



          // console.log(unitprice)
          // console.log(unitDiscount)
          // console.log(unitTotalprice)
          // console.log(cart_amount)

         
          // location.href='/user/cart/cart_list'
        }

      }
     })
    });
      });



  </script>  
  </body>
</html>
    