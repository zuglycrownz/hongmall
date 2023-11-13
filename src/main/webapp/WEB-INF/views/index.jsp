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

<%@include file="/WEB-INF/views/comm/category_menu.jsp" %>

<div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
 <p>2차카테고리 상품리스트 : ${cg_name}</p>
</div>

<div class="container">
  <div class="card-deck mb-3 text-center row">
    <c:forEach items="${pro_list}" var="productVO">
<div class="col-md-3">
<div class="card mb-4 shadow-sm">
<img src="/user/product/imageDisplay?dateFolderName=${productVO.pro_up_folder}1&fileName=${pro_up_image}">
 <div class="card-body">
<p class="card-text">상품이름</p>
<div class="d-flex justify-content-between align-items-center">
<div class="btn-group">
<button type="button" class="btn btn-sm btn-outline-secondary">View</button>
<button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
 </div>
<small class="text-body-secondary">9 mins</small>
 </div>

            </div>
          </div>
        </div>
</c:forEach>
    </div>
						<div class="row">
							<div class="col-md-12 text-center">

							<!--1)페이지번호 클릭할 때 사용  [이전]  1	2	3	4	5 [다음]  -->
							<!--2)목록에서 상품이미지 또는 상품명 클릭할 때 사용   -->
							  <form id="actionForm" action="" method="get">
								<input type="hidden" name="pageNum" id="pageNum" value="${pageMaker.crl.pageNum}" />
								<input type="hidden" name="amount"  id="amount" value="${pageMaker.crl.amount}" />
								<input type="hidden" name="type" id="type" value="${pageMaker.crl.type}" />
								<input type="hidden" name="keyword" id="keyword" value="${pageMaker.crl.keyword}" />
								
							  </form>
							</div>

								<nav aria-label="...">
								<ul class="pagination">
									<!-- 이전 표시여부 -->
									<c:if test="${pageMaker.prev }">
										<li class="page-item">
											<a href="${pageMaker.startPage - 1 }" class="page-link movepage">Previous</a>
										</li>
									</c:if>
									<!-- 페이지번호 출력 -->
									<!-- 1	2	3	4	5 6	7	8	9	10  [다음] -->
									<!-- [이전] 11	12	13	14	15 16	17	18	19	20   -->
									<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num">
										<li class='page-item ${pageMaker.crl.pageNum ==  num ? "active":"" }'aria-current="page">
											<a class="page-link movepage" href="${num }" data-page="${num }">${num }</a>
										</li>
									</c:forEach>
									
									<!--  다음 표시여부 -->
									<c:if test="${pageMaker.next }">
										<li class="page-item">
										<a href="${pageMaker.endPage + 1 }" class="page-link movepage" href="#">Next</a>
										</li>
									</c:if>
									
								</ul>
								</nav>
							</div>

						</div>

  <%@include file="/WEB-INF/views/comm/footer.jsp" %>
</div>

<!--  
<script src="/js/category_menu.js"></script>
 -->   
  </body>
</html>