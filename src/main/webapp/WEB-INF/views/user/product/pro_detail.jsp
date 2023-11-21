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
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>


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

<%@include file="/WEB-INF/views/comm/category_menu.jsp" %>

<div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
 <p>2차카테고리 : ${cg_name }</p>
</div>

<div class="container">
 <div class="card-deck mb-3 text-center row">
<div class="col-md-6">
상품이미지
<img class="btn_pro_img" data-pro_num="${productVO.pro_num}" width="100%" height="200" src="/user/product/imageDisplay?dateFolderName=${productVO.pro_up_folder }&fileName=${productVO.pro_img}">
</div>
<div class="col-md-6">


<div class="row text-left" >
  <div class="col">

    상품이름 : ${productVO.pro_name}

  </div>
</div>
<div class="row text-left">
  <div class="col">

    가격: <span id="unit_price">${productVO.pro_price}</span>

  </div>
</div>
<div class="row text-left">
  <div class="col">

    수량: <input type="number" id="btn_quantity" value="1" style="width: 50px;"/>

  </div>
</div>
<div class="row text-left">
  <div class="col">

    총상품금액: <span id="tot_price">${productVO.pro_price}</span>

  </div>
</div>

<div class="row">

  <div class="col">
  <button type="button" class="btn btn-primary" name="btn_order" data-pro_num="${productVO.pro_num}">구매하기</button>

  </div>

  <div class="col">
  <button type="button" class="btn btn-primary" data-pro_num="${productVO.pro_num}" name="btn_cart_add">장바구니</button>

    </div>
</div>
</div>
<div class="row">
  <div class="col-md-12">
<div id="tabs">
  <ul>
    <li><a href="#tabs-1">상품설명</a></li>
    <li><a href="#tabs-2">상품후기</a></li>
  </ul>
  <div id="tabs-1">
    <p>Proin elit arcu, rutrum commodo, vehicula tempus, commodo a, risus. Curabitur nec arcu. Donec sollicitudin mi sit amet mauris. Nam elementum quam ullamcorper ante. Etiam aliquet massa et lorem. Mauris dapibus lacus auctor risus. Aenean tempor ullamcorper leo. Vivamus sed magna quis ligula eleifend adipiscing. Duis orci. Aliquam sodales tortor vitae ipsum. Aliquam nulla. Duis aliquam molestie erat. Ut et mauris vel pede varius sollicitudin. Sed ut dolor nec orci tincidunt interdum. Phasellus ipsum. Nunc tristique tempus lectus.</p>
  </div>
  <div id="tabs-2">
    <p>Morbi tincidunt, dui sit amet facilisis feugiat, odio metus gravida ante, ut pharetra massa metus id nunc. Duis scelerisque molestie turpis. Sed fringilla, massa eget luctus malesuada, metus eros molestie lectus, ut tempus eros massa ut dolor. Aenean aliquet fringilla sem. Suspendisse sed ligula in ligula suscipit aliquam. Praesent in eros vestibulum mi adipiscing adipiscing. Morbi facilisis. Curabitur ornare consequat nunc. Aenean vel metus. Ut posuere viverra nulla. Aliquam erat volutpat. Pellentesque convallis. Maecenas feugiat, tellus pellentesque pretium posuere, felis lorem euismod felis, eu ornare leo nisi vel felis. Mauris consectetur tortor et purus.</p>
  </div>
</div>
</div>
</div>
 </div>
<div class="row text-center">
	<div class="col-md-12">
			
	<!--1)페이지번호 클릭할 때 사용  [이전]  1	2	3	4	5 [다음]  -->
	<!--2)목록에서 상품이미지 또는 상품명 클릭할 때 사용   -->
	 <form id="actionForm" action="" method="get">
	<input type="hidden" name="pageNum" id="pageNum" value="${pageMaker.cri.pageNum}" />
	<input type="hidden" name="amount"  id="amount" value="${pageMaker.cri.amount}" />
	<input type="hidden" name="type" id="type" value="${pageMaker.cri.type}" />
	<input type="hidden" name="keyword" id="keyword" value="${pageMaker.cri.keyword}" />
	
	<input type="hidden" name="cg_code" id="cg_code" value="${cg_code}" />
	<input type="hidden" name="cg_name" id="cg_name" value="${cg_name}" />
	
		
	  </form>

	</div>
</div>

  <%@include file="/WEB-INF/views/comm/footer.jsp" %>
</div>

  <!-- 카테고리 메뉴 자바스크립트 작업소스 -->
  
  <script>
	$(document).ready(function() {

		let actionForm = $("#actionForm");

	    // [이전] 1 2 3 4 5 [다음] 클릭 이벤트 설정. <a>태그
	    $(".movepage").on("click", function(e) {
	      e.preventDefault(); // a태그의 href 링크기능을 제거. href속성에 페이지번호를 숨겨둠.

	      actionForm.attr("action", "/user/product/pro_list");
	      actionForm.find("input[name='pageNum']").val($(this).attr("href"));

	       actionForm.submit();
	    });

      //장바구니 추가
      $("button[name='btn_cart_add']").on("click", function() {
        $.ajax({
          url :'/user/cart/cart_add',
          type:'post',
          data:{pro_num : $(this).data("pro_num"),cart_amount :$("#btn_quantity").val()},
          success : function(result) {
          if(result == "success") {
            alert("장바구니에 추가됨");
            if(confirm("장바구니로 이동하시겠습니까?")) {
              location.href ="/user/cart/cart_list"
            }
            }

          }

        })
          
      });
      $("button[name ='btn_order']").on("click",function() {
        console.log("hi");
  let url='/user/order/order_ready?pro_num=' +$(this).data("pro_num") + '&cart_amount=' +$("#btn_quantity").val()+''
  location.href = url

      })

      //상품 이미지 또는 상품명 클릭시 상세로 보내는 작업
      $(".btn_pro_img").on("click",function() {

        console.log("상품상세설명");
        actionForm.attr("action","/user/product/pro_detail")

        let pro_num = $(this).data("pro_num");
        actionForm.append("<input type='hidden' name='pro_num'  value='" + pro_num + "' />")
        actionForm.submit();
      })
      //수량변경 
  $("#btn_quantity").on("click",function() {
  let tot_price = $("#unit_price").text() * $("#btn_quantity").val(); //span = text, input = val 더하기면 paresint해야함
  $("#tot_price").text(tot_price);
})
	});

  </script>  

    <script>
  $( function() {
    $("#tabs-1").tabs();
  });
  </script>
  </body>
</html>
    