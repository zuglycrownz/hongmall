<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
   
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
  <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="https://jqueryui.com/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
  <script id="reviewTemplate" type="text/x-handlebars-template">
<table class="table table-sm">
  <thead>
    <tr>
      <th scope="col">번호</th>
      <th scope="col">내용</th>
      <th scope="col">별점</th>
      <th scope="col">날짜</th>
      <th scope="col">비고</th>
    </tr>
  </thead>
  <tbody>
{{#each .}}
    <tr>
      <th scope="row">{{rew_num}}</th>
      <td>{{rew_content}}</td>
      <td>{{Starrating rew_score}}</td>
      <td>{{convertDate rew_regdate}}</td>
      <td>{{authControlYiew mbsp_id rew_num}}</td>
    </tr>
    {{/each}}
  </tbody>
</table>
  </script>
  <script>
    $( function() {
      $( "#tabs_pro_detail" ).tabs();
    });
    </script>

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

      p#star_rv_score a.rv_score {
        font-size: 22px;
        text-decoration: none;
        color: lightgoldenrodyellow;
      }
      /* 별펑점에 마우스 오버했을 경우 사용되는 CSS선택자 */
      p#star_rv_score a.rv_score.on {
        color : yellow;
      }
    </style>

    <script>
      let msg = '${msg}';
      if(msg == 'success') {
        alert("회원정보가 수정됨");
      }
    </script>

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
      <img class="btn_pro_img" width="75%" height="300" data-pro_num = "${productVO.pro_num}" src="/user/product/imageDisplay?dateFolderName=${productVO.pro_up_folder }&fileName=${productVO.pro_img }">
    </div>
    <div class="col-md-6">
      <div class="row text-left">
        <div class="col">
          ${productVO.pro_name }
        </div>
      </div>
      <div class="row text-left">
        <div class="col">
          <span id="unit_price">${productVO.pro_price }</span>
        </div>
    </div>
      <div class="row text-left">
        <div class="col">
          수량 <input type="number" id="btn_quantity" value="1" style="width: 80px;">
        </div>
    </div>
      <div class="row text-left">
        <div class="col">
          총상품금액 : <span id="tot_price">${productVO.pro_price }</span>
        </div>
      </div>
      <div class="row">
        <div class="col-md-6">
          <button type="button" class="btn btn-link" name="btn_order" data-pro_num="${productVO.pro_num}">구매하기</button>
        </div>
        <div class="col-md-6">
          <button type="button" class="btn btn-link" name="btn_cart_add" data-pro_num="${productVO.pro_num}">장바구니</button>
        </div>
      </div>
    </div>
    </div>
    </div>
    <div class="row">
      <div class="col-md-12">
        <div id="tabs_pro_detail">
          <ul>
            <li><a href="#tabs-prodetail">상품설명</a></li>
            <li><a href="#tabs-proreview">상품후기</a></li>
          </ul>
          <div id="tabs-prodetail">
            <p>${productVO.pro_content}</p>
          </div>
          <div id="tabs-proreview">
            <p>상품후기 목록</p>
            <div class="row text-center">
              <div class="col-md-12">
              <!--1)페이지번호 클릭할 때 사용  [이전]  1   2   3   4   5 [다음]  -->
              <!--2)목록에서 상품이미지 또는 상품명 클릭할 때 사용   -->
                <form id="actionForm" action="/user/review/list/{pro_num}/{page}" method="get">
                 <input type="hidden" name="pageNum" id="pageNum" value="${pageMaker.cri.pageNum}" />
                 <input type="hidden" name="amount"  id="amount" value="${pageMaker.cri.amount}" />
                 <input type="hidden" name="type" id="type" value="${pageMaker.cri.type}" />
                 <input type="hidden" name="keyword" id="keyword" value="${pageMaker.cri.keyword}" />
                 
                 <input type="hidden" name="pro_num" id="pro_num" value="${pro_num}" />
                 <input type="hidden" name="cg_name" id="cg_name" value="${cg_name}" />
                 
                </form>
                 <nav aria-label="...">
                 <ul class="pagination">
                    <!-- 이전 표시여부 -->
                    <c:if test="${pageMaker.prev }">
                       <li class="page-item">
                          <a href="${pageMaker.startPage - 1 }" class="page-link movepage">Previous</a>
                       </li>
                    </c:if>

                    
                    <!--  다음 표시여부 -->
                    <c:if test="${pageMaker.next }">
                       <li class="page-item">
                       <a href="${pageMaker.endPage + 1 }" class="page-link movepage" href="${pageMaker.endPage + 1 }">Next</a>
                       </li>
                    </c:if>
                    
                 </ul>
                 </nav>
              </div>
           </div>
            <div class="row">
              <div class="col-md-12" id="review_list">


              </div>
              </div>
              <div class="col-md-8 text-center" id="review_paging">


              </div>
              </div>
              </div>

                
              
              <div class="col-md-12 text-right">
              <button type="button" id="btn_review_write" class="btn btn-info">상품후기작성</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

   

  <%@include file="/WEB-INF/views/comm/footer.jsp" %>
</div>

<%-- <%@include file="/WEB-INF/views/comm/plugIn.jsp" %> --%>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
<!-- 카테고리 메뉴 자바스크립트 작업소스 -->
<script src="/js/category_menu.js"></script>
    
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

        // 장바구니 추가
        $("button[name='btn_cart_add']").on("click", function() {
          // console.log("장바구니 추가");

          $.ajax({
            url: '/user/cart/cart_add',
            type: 'post',
            data: {pro_num : $(this).data("pro_num"), cart_amount : $("#btn_quantity").val()},
            dataType: 'text',
            success: function(result) {
              if(result == "success") {
                alert("장바구니에 추가됨");
                if(confirm("장바구니로 이동하겠습니까?")) {
                  location.href = "/user/cart/cart_list";
                }
              }
            }

          });
        });

        // 구매하기(주문)
        $("button[name='btn_order']").on("click", function() {

          let url = "/user/order/order_ready?pro_num=" + $(this).data("pro_num") + "&cart_amount=" + $("#btn_quantity").val();
          
          location.href = url;
        });
        
        // 상품 이미지, 상품명 클릭했을때 상품코드를 불러와서 상품상세로 보내는 작업.
        $(".btn_pro_img").on("click", function() {
            console.log("상품상세설명");

            actionForm.attr("action", "/user/product/pro_detail");

            let pro_num = $(this).data("pro_num");

            actionForm.find("input[name='pro_num']").remove();
            // <input type='hidden' name='pro_num' value='상품코드' >
            actionForm.append("<input type='hidden' name='pro_num' value='" + pro_num + "'>");
            actionForm.submit();
            })

            // 수량변경시
            $("#btn_quantity").on("change", function() {
                let tot_price = parseInt($("#unit_price").text()) * parseInt($("#btn_quantity").val());

                //  총상품금액 표시.
                $("#tot_price").text(tot_price);
                });
                

        // 상품후기 작성
            $("#btn_review_write").on("click", function() {
              $('#review_modal').modal('show');

            });

            // 별평점 클릭시. 별평점 태그 5개
            $("p#star_rv_score a.rv_score").on("click", function(e) {
              e.preventDefault();
              // $(this) : 클릭한 a태그
              $(this).parent().children().removeClass("on");
              $(this).addClass("on").prevAll("a").addClass("on");
            });

            // 상품평 목록 불러오는 작업. (이벤트 사용 안하고, 직접 호출)
            let reviewPage = 1; // 목록에서 첫번째 페이지.
            let url = "/user/review/list/" + ${productVO.pro_num} + "/" + reviewPage;

            getReviewInfo(url);

            function getReviewInfo(url) {
             $.getJSON(url, function(data) {

                // console.log("상품후기", data.list[0].rew_content);
                // console.log("페이징정보", data.pageMaker.total);
                // review_list
                                //스프링정보,보여줄위치,보여줄거틀
                printReviewList(data.list, $("#review_list"), $("#reviewTemplate"));
                printpage(data.pageMaker, $("#review_paging"));
                
      });
    }

    // 상품후기작업함수
    let printReviewList = function(reviewData, target, template) {
      let templateObj = Handlebars.compile(template.html());
      let reviewHtml = templateObj(reviewData);
      
      // 상품후기목록 위치를 참조하여, 추가


      $("#review_list").children().remove();
      target.append(reviewHtml);
    }
    //페이징기능작업
    let printpage = function(pageMaker,target) {
      let pagingStr = '<nav aria-label ="Page navigation example">';
        pagingStr += ' <ul class="pagination">'
      if(pageMaker.prev) {

        pagingStr += '<li class="page-item"><a class="page-link" href="#">' + ${pageMaker.startPage - 1} +'">Previon</a>';
        pagingStr += '</ul>';
        pagingStr += '</nav>';
      }
      if(pageMaker.next) {

    pagingStr += '<li class="page-item"><a class="page-link" href="#">' + ${pageMaker.startPage + 1} +'">next</a>';
    pagingStr += '</ul>';
    pagingStr += '</nav>';
    }
      for(let i=pageMaker.startPage; i<=pageMaker.endPage; i++) {
        let className = pageMaker.cri.pageNum == i ? "active" : "";
        pagingStr += '<li class="page-item">' + className + '<a class="page-link" href="' + i + '">' + i + '</a>'


      target.children().remove();
      target.append(pagingStr);
      }
    }

    Handlebars.registerHelper("convertDate",function(reviewtime) {

      const dateObj = new Date(reviewtime);
      let year = dateObj.getFullYear();
      let month = dateObj.getMonth();
      let date = dateObj.getDate();
      let hour = dateObj.getHours();
      let minute = dateObj.getMinutes();

      return year + "/" + month + "/" + date + " " + hour + ":" + minute
    })
      //숫자로된거 별로 치환하기
      Handlebars.registerHelper("Starrating",function(rating) {

        let star = "";
        switch (rating) {
          case 1: star = "★☆☆☆☆"
            break;
            case 2: star = "★★☆☆☆"
            break;
            case 3: star = "★★★☆☆"
            break;
            case 4: star = "★★★★☆"
            break;
            case 5: star = "★★★★★"
            break;
        
          default:
            break;
        }

    return  star;
    })
    Handlebars.registerHelper("authControlYiew",function(mbsp_id,rew_num) {
      let str ="";
      let login_id ='${sessionScope.loginStatus.mbsp_id}';

      //로그인한 사용자와 상품후기 등록 사용자가 동일한가
      if(login_id == mbsp_id) {
        str+= `<button type ="button" class="btn btn-info" data-rew_num="${rew_num}">[edit]</button>`
        str+= `<button type ="button" name="btn_review_del" class="btn btn-danger" data-rew_num="${rew_num}">[delete]</button>`
        console.log("에스티알"+str)
        return new Handlebars.SafeString(str)
      }

      
      $("#review_paging").on("click","nav ul a",function(e) {
      e.preventDefault();

      reviewPage = $(this).attr("href"); //상품후기 페이지번호 선택값

       url = "/user/review/list/" + ${productVO.pro_num} + "/" + reviewPage;

       getReviewInfo(url); //스프링에서 상품후기,페이지번호 데이타 가져오기

        console.log("페이징번호");
        reviewPage.remove();
      })


    })
    $("#review_list").on("click","button[name='btn_review_del']",function() {
      let rew_num = $(this).data("rew_num");
      console.log(rew_num);
      if(!confirm("상품후기를 삭제하겠습니까?")) return;
      
      $.ajax({
                url: '/user/review/delete/' + rew_num,
                headers: {
                  "Content-Type" : "application/json", "X-HTTP-Method-Override" : "DELETE"
                },
                type: 'Delete',
                dataType: 'text',
                success : function(result) {
                  if(result == 'success') {
                    alert("상품평이 삭제됨");
                    url = "/user/review/list/" + ${productVO.pro_num} + "/" + reviewPage;
                  }
                }
              });

    })

            // 상품후기저장
            $("#btn_review_save").on("click", function() {
              // 별평점 값
              let rew_score = 0;
              let rew_content = $("#rew_content").val();

              $("p#star_rv_score a.rv_score").each(function(index, item) {
                if($(this).attr("class") == "rv_score on") {
                  rew_score += 1;

                  
                }

              });

              // 별 선택 안했을 경우 체크
              if(rew_score == 0) {
                alert("별 평점을 선택하세요.");
                return;
              }

              // 후기 체크
              if(rew_content == "") {
                alert("상품평을 작성해주세요.");
              }

              // ajax를 사용하여 스프링으로 리뷰데이터 전송작업
              let review_data = {pro_num : $(this).data("pro_num"), rew_content : rew_content, rew_score : rew_score}

              $.ajax({
                url: '/user/review/new',
                headers: {
                  "Content-Type" : "application/json", "X-HTTP-Method-Override" : "POST"
                },
                type: 'post',
                data : JSON.stringify(review_data), // 데이터 포맷 자바스크립트 Object -> json으로 변환
                dataType: 'text',
                success : function(result) {
                  if(result == 'success') {
                    alert("상품평이 등록됨");
                    $('#review_modal').modal('hide');
                    // 상품평 목록 불러오는 작업.
                    getReviewInfo(url);
                  }
                }
              });
            });
    }); // ready event end
    </script>

    // 상품후기모달
    <!-- Modal -->
    <div class="modal fade" id="review_modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">상품후기</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <form>
              <div class="form-group">
                <label for="recipient-name" class="col-form-label">별평점</label>
                <p id="star_rv_score">
                  <a class="rv_score" href="#">★</a>
                  <a class="rv_score" href="#">★</a>
                  <a class="rv_score" href="#">★</a>
                  <a class="rv_score" href="#">★</a>
                  <a class="rv_score" href="#">★</a>
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
            <button type="button" id="btn_review_save" class="btn btn-primary" data-pro_num="${productVO.pro_num}">상품후기저장</button>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
    