<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
 <p>상품정보</p>
</div>

<div class="container">

  <table class="table table-striped">
    <thead>
      <tr>

        <th scope="col">상품</th>
        <th scope="col">상품명</th>
        <th scope="col">판매가</th>
        <th scope="col">수량</th>
        <th scope="col">할인</th>
        <th scope="col">합계</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach items="${order_list}" var="cartDTO" varStatus="status">
      <tr>

     <td> <img width="40%" height="50" src="/user/cart/imageDisplay?dateFolderName=${order_info[status.index].pro_up_folder }&fileName=${order_info[status.index].pro_img}"></td>
        <td>${cartDTO.pro_name }</td>
        <td><span id="unitPrice">${cartDTO.pro_price}</span></td>
        <td>${cartDTO.cart_amount}</td>
        <td><span id="unitDiscount">${cartDTO.pro_discount}</span></td>
        <td><span class="unitTotalprice" id="unitTotalprice">${(cartDTO.pro_price - (cartDTO.pro_price * (cartDTO.pro_discount * 1/100))) * cartDTO.cart_amount}</span></td>
      </tr>
      </c:forEach>
    </tbody>
    <tfoot>

 <tr>
        <td colspan="8" style="text-align: right;">상품 총<span id="cart_price_count">${fn:length(order_info)-4}</span>
          주문금액 : <span id="cart_total_price">${order_price}</span>
        </td>
      </tr>
      <tr>
        <td><button type="button" class="btn btn-primary" name="btn_ajax_cart_del">주문하기</button></td>
      </tr>
    </tfoot>
  </table>


  <div class="box box-primary">
    <div>
    <form role="form" id="" method="post" action="">
      <fieldset>
        <legend>주문하시는 분</legend>

    <div class="box-body">
    <div class="form-group row">
      <label for="mbsp_id" class="col-2">주문자</label>
      <div class="col-10">
        <input type="text" class="form-control" id="b_mbsp_id" value="${loginStatus.mbsp_id}" readonly>
      </div>
    </div>

    <div class="form-group row">
      <label for="mbsp_name" class="col-2">이름</label>
      <div class="col-10">
        <input type="text" class="form-control" id="b_mbsp_name" value="${loginStatus.mbsp_name}" readonly>
      </div>
    </div>
    <div class="form-group row">
      <label for="mbsp_email" class="col-2">전자우편</label>
      <div class="col-10">
        <input type="email" class="form-control" id="b_mbsp_email" value="${loginStatus.mbsp_email}" readonly>
      </div>
    </div>
  
    <div class="form-group row">
      <label for="sample2_postcode" class="col-2">우편번호</label>
      <div class="col-10">
        <input type="text" class="form-control" id="b_mbsp_zipcode" value="${loginStatus.mbsp_zipcode}" readonly>
      </div>
    </div>
    <div class="form-group row">
      <label for="sample2_address" class="col-2">기본주소</label>
      <div class="col-10">
        <input type="text" class="form-control" id="b_mbsp_addr" value="${loginStatus.mbsp_addr}" readonly>
      </div>
    </div>
    <div class="form-group row">
      <label for="sample2_detailAddress" class="col-2">상세주소</label>
      <div class="col-10">
        <input type="text" class="form-control" id="b_mbsp_deaddr" value="${loginStatus.mbsp_deaddr}" readonly>
      </div>
    </div>
    <div class="form-group row">
      <label for="mbsp_phone" class="col-2">전화번호</label>
      <div class="col-10">
        <input type="text" class="form-control" id="b_mbsp_phone" value="${loginStatus.mbsp_phone}" readonly>
      </div>
    </div>


  </fieldset>
    <hr>
    <fieldset>
  <legend>받으시는 분</legend>
  <div class="form-group row">
    <label for="mbsp_id" class="col-2">수령인</label>
    <div class="col-8">
      <input type="text" class="form-control" name="mbsp_name" id="mbsp_name" placeholder="아이디 입력...">
    </div>
      <div class="col-2">
      <input type="checkbox" class="form-control" id="same"/>주문자와동일
    </div>
  </div>
  </div>
  <div class="form-group row">
    <label for="mbsp_email" class="col-2">전자우편</label>
    <div class="col-10">
      <input type="email" class="form-control" name="mbsp_email" id="mbsp_email" placeholder="전자우편입력...">
    </div>
  </div>
  <div class="form-group row">
    <label for="sample2_postcode" class="col-2">우편번호</label>
    <div class="col-8">
      <input type="text" class="form-control" name="mbsp_zipcode" id="sample2_postcode" placeholder="우편번호...">
    </div>
    <div class="col-2">
      <button type="button" onclick="sample2_execDaumPostcode()" class="btn btn-outline-info">우편번호 찾기</button>
    </div>
  </div>
  <div class="form-group row">
    <label for="sample2_address" class="col-2">기본주소</label>
    <div class="col-10">
      <input type="text" class="form-control" name="mbsp_addr" id="sample2_address" placeholder="기본주소입력...">
    </div>
  </div>
  <div class="form-group row">
    <label for="sample2_detailAddress" class="col-2">상세주소</label>
    <div class="col-10">
      <input type="text" class="form-control" name="mbsp_deaddr" id="sample2_detailAddress" placeholder="상세주소입력...">
      <input type="hidden" id="sample2_extraAddress" placeholder="참고항목">
    </div>
  </div>
  <div class="form-group row">
    <label for="mbsp_phone" class="col-2">전화번호</label>
    <div class="col-10">
      <input type="text" class="form-control" name="mbsp_phone" id="mbsp_phone" placeholder="전화번호입력...">
    </div>
  </div>
  <fieldset>
    <legend>결제방법선택</legend>
    <div class="form-group row">
      <label for="mbsp_phone" class="col-2">결제방법</label>
      <class="col-10">
        <input type="radio" name="paymethod" id="paymethod1" value="nobank" >무통장입금<br>
        <input type="radio" name="paymethod" id="paymethod2" value="kakaopay" ><img src="/kakaopay/payment_icon_yellow_small.png"><br>

      </div>
      <div class="form-group row" id="nobank_info" style="display: none;">
        <label for="mbsp_phone" class="col-2">무통장입금정보</label>
        <class="col-10">
          은행명
          <select name="pay_nobank" id="pay_nobank">
      <option value="123-123-123">KEB하나은행</option>
      <option value="456-456-456">국민은행</option>
      <option value="789-789-789">신한은행</option>
      <option value="200-200-200">SC제일은행</option>

          </select>
        계좌번호 <input type="text" name="pay_bankaccount" id="pay_bankaccount">
        예금주 <input type="text" name="pay_nobank_user" id="pay_nobank_user">
        메모<textarea cols="50" rows="3" name="pay_memo" id="pay_memo"></textarea>
          
        </div>
    </div>
        </fieldset>

    </fieldset>
  </div>
  <div class="form-group text-center">
    <button type="button" class="btn btn-primary" id="btn_order">주문및결제하기</button>
  </div>
    </form>
    </div>
</div>

  <%@include file="/WEB-INF/views/comm/footer.jsp" %>
</div>
<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
  <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
  </div>
  
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script>
      // 우편번호 찾기 화면을 넣을 element
      var element_layer = document.getElementById('layer');
  
      function closeDaumPostcode() {
          // iframe을 넣은 element를 안보이게 한다.
          element_layer.style.display = 'none';
      }
  
      function sample2_execDaumPostcode() {
          new daum.Postcode({
              oncomplete: function(data) {
                  // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
  
                  // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                  // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                  var addr = ''; // 주소 변수
                  var extraAddr = ''; // 참고항목 변수
  
                  //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                  if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                      addr = data.roadAddress;
                  } else { // 사용자가 지번 주소를 선택했을 경우(J)
                      addr = data.jibunAddress;
                  }
  
                  // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                  if(data.userSelectedType === 'R'){
                      // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                      // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                      if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                          extraAddr += data.bname;
                      }
                      // 건물명이 있고, 공동주택일 경우 추가한다.
                      if(data.buildingName !== '' && data.apartment === 'Y'){
                          extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                      }
                      // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                      if(extraAddr !== ''){
                          extraAddr = ' (' + extraAddr + ')';
                      }
                      // 조합된 참고항목을 해당 필드에 넣는다.
                      document.getElementById("sample2_extraAddress").value = extraAddr;
                  
                  } else {
                      document.getElementById("sample2_extraAddress").value = '';
                  }
  
                  // 우편번호와 주소 정보를 해당 필드에 넣는다.
                  document.getElementById('sample2_postcode').value = data.zonecode;
                  document.getElementById("sample2_address").value = addr;
                  // 커서를 상세주소 필드로 이동한다.
                  document.getElementById("sample2_detailAddress").focus();
  
                  // iframe을 넣은 element를 안보이게 한다.
                  // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                  element_layer.style.display = 'none';
              },
              width : '100%',
              height : '100%',
              maxSuggestItems : 5
          }).embed(element_layer);
  
          // iframe을 넣은 element를 보이게 한다.
          element_layer.style.display = 'block';
  
          // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
          initLayerPosition();
      }
  
      // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
      // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
      // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
      function initLayerPosition(){
          var width = 300; //우편번호서비스가 들어갈 element의 width
          var height = 400; //우편번호서비스가 들어갈 element의 height
          var borderWidth = 5; //샘플에서 사용하는 border의 두께
  
          // 위에서 선언한 값들을 실제 element에 넣는다.
          element_layer.style.width = width + 'px';
          element_layer.style.height = height + 'px';
          element_layer.style.border = borderWidth + 'px solid';
          // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
          element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
          element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
      }
  </script>
  <!-- 카테고리 메뉴 자바스크립트 작업소스 -->
  
  <script>
	$(document).ready(function() {
          function fn_cart_sum_price() {
             let sumPrice = 0;
              $(".unitTotalprice").each(function() {
                sumPrice += Number($(this).text()); 
              });
              $("#cart_total_price").text(sumPrice);
            }

            fn_cart_sum_price()

            $("#same").on("click",function() {

              if($("#same").is(":checked")) {
                $("#mbsp_name").val($("#b_mbsp_name").val());
                $("#mbsp_email").val($("#b_mbsp_email").val());
                $("#sample2_postcode").val($("#b_mbsp_zipcode").val());
                $("#sample2_address").val($("#b_mbsp_addr").val());
                $("#sample2_detailAddress").val($("#b_mbsp_deaddr").val());
                $("#mbsp_phone").val($("#b_mbsp_phone").val());


           
              }
              else {
                console.log("No체크")
                $("#mbsp_name").val("");
                $("#mbsp_email").val("");
                $("#mbsp_zipcode").val("");
                $("#mbsp_addr").val("");
                $("#mbsp_deaddr").val("");
                $("#mbsp_phone").val("");
              }

            });





            $("#btn_order").on("click",function() {
              let paymethod = $("input[name ='paymethod']:checked").val();
                console.log($("input[name ='paymethod']:checked").val());
                if(paymethod === 'kakaopay') {
              $.ajax({
                url:'/user/order/orderPay',
                type :'get',
                data:{
                  paymethod : $("input[name ='paymethod']:checked").val(),
                  ord_name: $("#mbsp_name").val(),
                  ord_addr_zipcode: $("input[name='mbsp_zipcode']").val(),
                  ord_addr_basic: $("input[name='mbsp_addr']").val(),
                  ord_addr_detail:$("input[name='mbsp_deaddr']").val() ,
                  ord_tel:$("#mbsp_phone").val() ,
                  ord_price :1000, //$("#cart_total_price").text(),
                  totalprice :1000, //$("#cart_total_price").text(),
                },
                dataType:'json',
                success : function(response) {
                console.log("응답" +  response);
             

                alert(response.next_redirect_pc_url);
                location.href =response.next_redirect_pc_url;

                }
              })
            }
            else if(paymethod === 'nobank') {
              $.ajax({
                url:'/user/order/nobank',
                type :'get',
                data:{
                  paymethod : $("input[name ='paymethod']:checked").val(),
                  ord_name: $("#mbsp_name").val(),
                  ord_addr_zipcode: $("input[name='mbsp_zipcode']").val(),
                  ord_addr_basic: $("input[name='mbsp_addr']").val(),
                  ord_addr_detail:$("input[name='mbsp_deaddr']").val() ,
                  ord_tel:$("#mbsp_phone").val() ,
                  ord_price :1000, //$("#cart_total_price").text(),
                  totalprice :1000, //$("#cart_total_price").text(),
                  pay_nobank_user :$("#pay_nobank_user").val(),
                  pay_nobank :$("#pay_nobank option:selected").text(),
                  pay_bankaccount :$("#pay_bankaccount").val(),
                  pay_memo :$("#pay_memo").val()
                  
                },
                dataType:'text',
                success : function(result) {
                console.log("응답" +  result);
                  if(result == 'success'){
                    alert("무통장으로 입금 완료")
                  }

                location.href = '/user/order/orderComplete'
             

                }
              });
            }


            })
            $("input[name ='paymethod']").on("click",function() {
              let paymethod = $("input[name ='paymethod']:checked").val();
              console.log(paymethod);

              if(paymethod === 'nobank') {
                $("#nobank_info").show();
              }
              else if(paymethod === 'kakaopay') {
                $("#nobank_info").hide();
              }

            });

            $("pay_nobank").on("change",function() {

              $("#pay_bankaccount").val($(this).val())
            })


            
      }); //end



  </script>  
  </body>
</html>
