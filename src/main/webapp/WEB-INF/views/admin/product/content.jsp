<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <style>
    .quick {
    padding:20px;
	    }
	    .form-group{
	    padding:5px;
	    }
    </style>
<div class="content-wrapper" style="min-height: 862px;">
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

<section class="quick" >
	<div class="row">

				<div class="box box-primary">
		<div class="box-header with-border">
		<h3 class="box-title">Product</h3>
		</div>
		
		<form role="form" method="post" action="">
		<div class="box-body">
		<div class="form-group">
		<label for="title" class="col-sm-1">카테고리</label>
		<div class="col-sm-3" >
<select class="form-control" id="exampleFormControlInput1" aria-label="Large select example" name="cg_code">
  <option selected>1차카테고리선택/option>
  <option value="1">One</option>
  <option value="2">Two</option>
  <option value="3">Three</option>
</select>
			</div>
	<div class="col-sm-3" >
<select class="form-control" id="exampleFormControlInput1" aria-label="Large select example" name="cg_code">
  <option selected>2차카테고리선택/option>
  <option value="1">One</option>
  <option value="2">Two</option>
  <option value="3">Three</option>
</select>
			</div>
</div>
<div class="form-group">
		<div class="col-sm-6" >
<label for="title" class="col-sm-2">상품명</label>
<input type="text"class="col-sm-4" name="pro_name" id="pro_name">
			</div>
	<div class="col-sm-6" >
	<label for="title" class="col-sm-2">상품가격</label>
	<input type="text" class="col-sm-4" name="pro_price" id="pro_price">

			</div>
</div>


<div class="form-group">
		<div class="col-sm-6" >
<label for="title" class="col-sm-2">할인율</label>
<input type="text"class="col-sm-4" name="pro_discount" id="pro_discount">
			</div>
	<div class="col-sm-6" >
	<label for="title" class="col-sm-2">제조사</label>
	<input type="text" class="col-sm-4" name="pro_publisher" id="pro_publisher">

			</div>
</div>


<div class="form-group">
		<div class="col-sm-12" >
			<div class="col-sm-6" >
	<label for="title" class="col-sm-2">상품이미지</label>
	<input type="file" class="col-sm-4" >
	</div>
			<div class="col-sm-6" >
	<label for="title" class="col-sm-4">미리보기이미지</label>
	<input type="image" class="col-sm-2" >
	</div>
		</div>
		</div>

		
		<div class="form-group">
		<label>상품설명</label>
			<textarea class="form-control" id="pro_content" rows="3" placeholder="작성내용 ..." name="pro_content"></textarea>
		</div>
		
		<div class="form-group">
		<div class="col-sm-12" >
			<div class="col-sm-6" >
	<label for="title" class="col-sm-2">수량</label>
	<input type="file" class="col-sm-4" name="pro_amount" id="pro_amount">
	</div>
			<div class="col-sm-6" >
	<label for="title" class="col-sm-2">판매여부</label>
	<select  name="pro_buy" id="pro_buy">
  <option >판매가능</option>
  <option >판매불가능</option>
  </select>
	</div>
		</div>
		</div>
</div>
		<div class="box-footer">
		<div>
		<button type="submit" class="btn btn-primary">확인</button>
		<button type="submit" class="btn btn-primary">취소</button>
		</div>
		</div>
				</form>
				</div>
				</div>
			
				
		</section>
		  </section>
		  </div>
		  
		





      <!--------------------------
        | Your Page Content Here |
        -------------------------->

