<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!doctype html>
<div id="category_menu">
<ul class="nav justify-content-center" id="first_category">
<c:forEach items="${firstCategorylist}" var="category">
  <li class="nav-item">
    <a class="nav-link active" aria-current="page" data-cg_code="${category.cg_code}" href="#">${category.cg_name}</a>
  </li>
  </c:forEach>
</ul>
</div>


<script>

$(document).ready(function() {

  $("#category_menu li a").on("mouseover",function(e) {

e.preventDefault();
let sel_first_category = $(this);
let cg_code  = $(this).data("cg_code");
let cg_name  = $(this).data("cg_name");

let url='/category/secondCategory/'+ cg_code;
    $.getJSON(url,function(category) {


      let str = '<ul class="nav justify-content-center" id="second_category">';

        for(let i=0; i<category.length; i++) {
          str +='<li class = "nav-item">';
          str += '<a class="nav-link active" aria-current="page"  href="#" data-cg_code="' + category[i].cg_code + '"data-cg_name="' + category[i].cg_name+ '">' + category[i].cg_name + '</a>';
          str +='</li>'

        }
        str +='</ul>'
      console.log(category)
      sel_first_category.parent().parent().next().remove();
      sel_first_category.parent().parent().after(str);
      console.log("str :"+str);
      


    })

  });
  //동적태그(2차카테고리)
  //$("#정적태그").on("click","동적태그",function()
$("#category_menu").on("click","ul#second_category li a",function(e) {
  // console.log("2차카테고리");
  e.preventDefault();
  let cg_code = $(this).data("cg_code");
  let cg_name = $(this).data("cg_name");

  let url = '/user/product/pro_list?cg_code='+ cg_code + "&" + 'cg_name=' + cg_name;

  // let url = '/user/product/pro_list?cg_code='+ cg_code + "&" + 'cg_name=' + cg_name;
  location.href= url;

})

})

</script>
