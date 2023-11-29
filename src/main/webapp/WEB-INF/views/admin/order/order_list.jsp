<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>AdminLTE 2 | Starter</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  
  <%@include file="/WEB-INF/views/admin/include/plugin1.jsp" %>
  
  <%@include file="/WEB-INF/views/comm/plugIn2.jsp" %>
  <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="https://jqueryui.com/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

  <!--핸들러를 활용한 주문상세-->
  <script id="orderDetailTemplate" type="text/x-handlebars-template">
  <tr class="tr_detail_info">
    <td colspan="9"> <!--th가 9개-->
        <table class="table table-sm" id="order_info_tbl">
          <thead>
            <tr>
              <th scope="col">번호</th>
              <th scope="col">상품코드</th>
              <th scope="col">상품이미지</th>
              <th scope="col">상품명</th>
              <th scope="col">주문수량</th>
              <th scope="col">주문금액</th>
              <th scope="col">비고</th>
            </tr>
          </thead>
          <tbody>
        {{#each .}}
            <tr>
              <th scope="row" >{{ord_code}}</th>
              <td >{{pro_num}}</td>
              <td ><img class="btn_pro_img" width="75%" height="300"  src="/admin/order/imageDisplay?dateFolderName={{pro_up_folder}}&fileName={{pro_img}}"></td>
              <td >{{pro_name}}</td>
              <td >{{dt_amount}}</td>
              <td >{{ord_price}}</td>
              <td><button type="button" name="btn_review_del" class="btn btn-danger" data-ord_code="{{ord_code}}" data-pro_num="{{pro_num}}">delete</button></td>
            </tr>
            {{/each}}
          </tbody>
        </table>
      </td>
    </tr>
          </script>


</head>
<!--
BODY TAG OPTIONS:
=================
Apply one or more of the following classes to get the
desired effect
|---------------------------------------------------------|
| SKINS         | skin-blue                               |
|               | skin-black                              |
|               | skin-purple                             |
|               | skin-yellow                             |
|               | skin-red                                |
|               | skin-green                              |
|---------------------------------------------------------|
|LAYOUT OPTIONS | fixed                                   |
|               | layout-boxed                            |
|               | layout-top-nav                          |
|               | sidebar-collapse                        |
|               | sidebar-mini                            |
|---------------------------------------------------------|
-->
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <!-- Main Header -->
  <%@ include file="/WEB-INF/views/admin/include/header.jsp" %>
  <!-- Left side column. contains the logo and sidebar -->
  <%@ include file="/WEB-INF/views/admin/include/mainside.jsp" %>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Page Header
        <small>Optional description</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
        <li class="active">Here</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content container-fluid">

      <div class="row">
    		<div class="col-md-12">
    			<div class="box">
					<div class="box-header with-border">
					<h3 class="box-title">Order List</h3>
					</div>

					<div class="box-body">
						<div>
							<form action="/admin/order/order_list" method="get" >
									<select name="type">
										<option selected>검색종류선택</option>
										<option value="N" ${pageMaker.cri.type == 'N'? 'selected': ''}>주문자</option>
										<option value="C" ${pageMaker.cri.type == 'C'? 'selected': ''}>주문코드</option>
									</select>
									<input type="text" name="keyword" value="${pageMaker.cri.keyword}" />
									<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}" />
									<input type="hidden" name="amount" value="${pageMaker.cri.amount}" />
									<button type="submit" class="btn btn-primary">검색</button>
							</form>
						</div>
						<table class="table table-bordered" id="order_info">
							<tbody><tr>
								<th style="width: 8%">번호</th>
								<th style="width: 15%">주문일시</th>
								<th style="width: 10%">주문번호</th>
								<th style="width: 20%">주문금액</th>
								<th style="width: 15%">배송비</th>
								<th style="width: 5%">주문상태</th>
								<th style="width: 5%">주문자</th>
                <th style="width: 5%">총주문액</th>
                <th style="width: 5%">결제방법</th>
                <th style="width: 5%">비고</th>
                <th style="width: 5%">비고</th>
                
							</tr>
							<c:forEach items="${order_list}" var="orderVO">
							<tr>
								<td>번호</td>
								<td><fmt:formatDate value="${orderVO.ord_regdate }" pattern="yyyy-MM-dd" /></td>
								<td><span class="btn_order_detail1">${orderVO.ord_code}</span></td>
								<td>0</td>
                <td>0</td>
								<td>
                  주문상태
								</td>
								<td>${orderVO.ord_name}</td>
								<td>${orderVO.ord_price}</td>
                <td>${orderVO.payment_status}</td>
                <td><button type="button" class="btn btn-primary btn_order_detail1" data-ord_code="${orderVO.ord_code}">주문상세1</button></td>
                <td><button type="button" class="btn btn-primary btn_order_detail2" data-ord_code="${orderVO.ord_code}">주문상세2</button></td>

                <!-- <td><button type="button" class="btn btn-danger btn_pro_del">삭제</button></td> -->
							</tr>
							</c:forEach>
							</tbody></table>
					</div>
					<div class="box-footer clearfix">
						<div class="row">
							<div class="col-md-4">
							<!--1)페이지번호 클릭할 때 사용  [이전]  1	2	3	4	5 [다음]  -->
							<!--2)목록에서 상품이미지 또는 상품명 클릭할 때 사용   -->
							  <form id="actionForm" action="" method="get">
								<input type="hidden" name="pageNum" id="pageNum" value="${pageMaker.cri.pageNum}" />
								<input type="hidden" name="amount"  id="amount" value="${pageMaker.cri.amount}" />
								<input type="hidden" name="type" id="type" value="${pageMaker.cri.type}" />
								<input type="hidden" name="keyword" id="keyword" value="${pageMaker.cri.keyword}" />
								
							  </form>
							</div>
							<div class="col-md-6 text-center">
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
										<li class='page-item ${pageMaker.cri.pageNum ==  num ? "active":"" }'aria-current="page">
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
						
					</div>
			   </div>
    		</div>
    	</div>

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- Main Footer -->
  <%@include file="/WEB-INF/views/admin/include/footer.jsp" %>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Create the tabs -->
    <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
      <li class="active"><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
      <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
    </ul>
    <!-- Tab panes -->
    <div class="tab-content">
      <!-- Home tab content -->
      <div class="tab-pane active" id="control-sidebar-home-tab">
        <h3 class="control-sidebar-heading">Recent Activity</h3>
        <ul class="control-sidebar-menu">
          <li>
            <a href="javascript:;">
              <i class="menu-icon fa fa-birthday-cake bg-red"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

                <p>Will be 23 on April 24th</p>
              </div>
            </a>
          </li>
        </ul>
        <!-- /.control-sidebar-menu -->

        <h3 class="control-sidebar-heading">Tasks Progress</h3>
        <ul class="control-sidebar-menu">
          <li>
            <a href="javascript:;">
              <h4 class="control-sidebar-subheading">
                Custom Template Design
                <span class="pull-right-container">
                    <span class="label label-danger pull-right">70%</span>
                  </span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-danger" style="width: 70%"></div>
              </div>
            </a>
          </li>
        </ul>
        <!-- /.control-sidebar-menu -->

      </div>
      <!-- /.tab-pane -->
      <!-- Stats tab content -->
      <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
      <!-- /.tab-pane -->
      <!-- Settings tab content -->
      <div class="tab-pane" id="control-sidebar-settings-tab">
        <form method="post">
          <h3 class="control-sidebar-heading">General Settings</h3>

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Report panel usage
              <input type="checkbox" class="pull-right" checked>
            </label>

            <p>
              Some information about this general settings option
            </p>
          </div>
          <!-- /.form-group -->
        </form>
      </div>
      <!-- /.tab-pane -->
    </div>
  </aside>
  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
  immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<!-- REQUIRED JS SCRIPTS -->
<%@include file="/WEB-INF/views/admin/include/plugin2.jsp" %>

<script>
  $(document).ready(function() {

    let actionForm = $("#actionForm");

    // [이전] 1 2 3 4 5 [다음] 클릭 이벤트 설정. <a>태그
    $(".movepage").on("click", function(e) {
      e.preventDefault(); // a태그의 href 링크기능을 제거. href속성에 페이지번호를 숨겨둠.

      actionForm.attr("action", "/admin/order/order_list");
      actionForm.find("input[name='pageNum']").val($(this).attr("href"));

       actionForm.submit();
    });
    


  //주문상세 이벤트
  $(".btn_order_detail1").on("click",function() {

    let cur_tr = $(this).parent().parent();
    console.log("cur_tr",cur_tr) // tr
    let ord_code = $(this).data("ord_code");

    console.log("주문번호",ord_code);

    let url = "/admin/order/order_detail_info1/" + ord_code;
    getorderdetailinfo(url,cur_tr);

  });
  function getorderdetailinfo(url,cur_tr) {
 $.getJSON(url, function(data) {


  printOrderDetailList(data,cur_tr,$("#orderDetailTemplate"));

    
});
}


//첫번쨰작업 orderDetailTemplate = 핸들러틀 주소 //url로 getjson정보를받음 data = orderdetailinfo

//두번째 작업
let printOrderDetailList = function(orderDetailData, target, template) {
      let templateObj = Handlebars.compile(template.html());
      let orderDetailHtml = templateObj(orderDetailData);
      
      // 상품후기목록 위치를 참조하여, 추가
      target.parent().find(".tr_detail_info").remove();
      target.after(orderDetailHtml);
    }
$("table#order_info").on("click","button[name='btn_review_del']",function() {
  console.log("개별삭제");

  let ord_code = $(this).data("ord_code");
  let pro_num = $(this).data("pro_num");
console.log("ord_code",ord_code)
console.log("pro_num",pro_num)
  actionForm.append('<input type="hidden" name="ord_code" value="' + ord_code + '">');
  actionForm.append('<input type="hidden" name="ord_code" value="' + pro_num + '">');
  actionForm.attr("")
})
$(".btn_order_detail2").on("click",function() {


let ord_code = $(this).data("ord_code");
let url = "/admin/order/order_detail_info2/" + ord_code;
console.log("주소 :" + url)
$("#order_detail_content").load(url)

$("#order_detail_modal").modal('show');

});

}); // ready 이벤트
</script>

<div class="modal fade" id="order_detail_modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"></div>
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id="order_detail_content">
        <div>hihi</div>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Understood</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>