<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


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
            <c:forEach items="${orderProductlist}" var="OrderDetailProductVO">
            <tr>
              <th scope="row">${OrderDetailProductVO.orderDetailVO.ord_code}</th>
              <td>${OrderDetailProductVO.productVO.pro_num}</td>
              <td><img class="btn_pro_img" width="75%" height="300" src="/admin/order/imageDisplay?dateFolderName=${OrderDetailProductVO.productVO.pro_up_folder}&fileName=${OrderDetailProductVO.productVO.pro_img}"></td>
              <td>${OrderDetailProductVO.productVO.pro_name}</td>
              <td>${OrderDetailProductVO.orderDetailVO.dt_amount}</td>
              <td>${OrderDetailProductVO.orderDetailVO.ord_price}</td>
              <td><button type="button" name="btn_review_del" class="btn btn-danger" data-ord_code="${OrderDetailProductVO.orderDetailVO.ord_code}" data-pro_num="${OrderDetailProductVO.productVO.pro_num}">delete</button></td>
            </tr>
            </c:forEach>
          </tbody>
        </table>


