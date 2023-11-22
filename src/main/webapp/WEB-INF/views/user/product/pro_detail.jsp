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
    
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>

<style>  
  body {
	font-family: Arial, Helvetica, sans-serif;
}

table {
	font-size: 1em;
}

.ui-draggable, .ui-droppable {
	background-position: top;
}
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
      .ui-draggable, .ui-droppable{
        background-position: top;
      }
      p#star_rv_score a.rv_score {
        font-size: 22px;
        text-decoration: none;
        color: lightgray;
      }
      p#star_rv_score a.rv_score.on {
        color: yellow;
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
    <p>.</p>
    <div class="row">
<div class="col-md-12 text-right"></div>
      <button type="button" id="btn_review_write" class="btn btn-info" data-bs-toggle="modal" data-bs-target="#review_model" data-bs-whatever="@mdo" >상품후기</button>
    </div>
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


  $("#btn_review_write").on("click",function() {
    $("#review_model").model('show');

  })

  $("p#star_rv_score a.rv_score").on("click",function(e) {
  e.preventDefault();

  $(this).parent().children().removeClass("on");
  $(this).addClass("on").prevAll("a").addClass("on");

  });
let reviewPage = 1;
let url ="/user/review/list" + pro_num + "/" + reviewPage;

  $("#btn_review_save").on("click",function() {
    let rew_score = 0;
    let rew_content = $("#rew_content").val();

    $("p#star_rv_score a.rv_score").each(function(index,item) {
      if($(this).attr("class") == "rv_score on"){
        rew_score += 1;
      }
      
    })
    if(rew_score == 0) {
      alert("별 평점을 선택하세요");
      return;
    }
    //후기 체크
    if(rew_content == "") {
      alert("상품명을 작성하세요");
      return
    }

    let review_data = {pro_num : $(this).data("pro_num"), rew_content : rew_content, rew_score : rew_score} 
    // JSON.stringify(review_data)
    $.ajax({

      url:'/user/review/new',
      headers: {
        "Content-Type" : "application/json", "X-HTTP-Method-Overrid" : "POST"
      },
      type : 'post',
      data: JSON.stringify(review_data), //자바 오브젝트 -> JSON으로 변환
      dataType:'text',
      success : function(result) {
      if(result == 'success') {
        alert("상품명이 등록됨");

        $('#review_model').model('hide');
      }

      }


    })

    
  })
	}); //end



  </script>  

    <script>
 $( document ).ready(function() {
        $("#tabs").tabs();
        if ($("#tabs-1").val() == null) {
            $("#tabs").css("display", "none");
        }
        $("#tabs-2").change(function () {
            $("#tabs").css("display", "block");
        });
});
  </script>
  </body>
 
<!--상품후기-->
<div class="modal fade" id="review_model" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">New message</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">별평점</label>
            <p id="star_rv_score">
              <a class="rv_score" href="#">☆</a>
              <a class="rv_score" href="#">☆</a>
              <a class="rv_score" href="#">☆</a>
              <a class="rv_score" href="#">☆</a>
              <a class="rv_score" href="#">☆</a>
            </p>          
          </div>
          <div class="form-group">
            <label for="message-text" class="col-form-label">내용</label>
            <textarea class="form-control" id="rew_content"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" id="btn_review_save" class="btn btn-primary" data-pro_num="${productVO.pro_num}" >상품후기저장</button>
      </div>
    </div>
  </div>
</div>
</html>
    