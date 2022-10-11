<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<form id="form" action="${pageContext.request.contextPath}/admin/encyclopedia/pest/register" method="post" enctype="multipart/form-data">
	<div class="form-row">
		<div class="form-group col-12">
			<h2>해충등록</h2>
		</div>

		<input type="hidden" name="ec_id" value="20">
		<div class="form-group col-md-6">
			<label for="name">해충명</label> <input type="text"
				class="form-control" id="pe_name" placeholder="해충명"
				name="pe_name" required>
		</div>
		<div class="form-group">
			<label for="cause">원인</label>
			<textarea class="form-control" id="pe_cause" rows="5" cols="150"
				name="pe_cause"></textarea>
		</div>
		<div class="form-group">
			<label for="method">확인 방법</label>
			<textarea class="form-control" id="pe_method" rows="5" cols="150"
				name="pe_method"></textarea>
		</div>
		<div class="form-group">
			<label for="biologicalControl">방제법</label>
			<textarea class="form-control" id="pe_biologicalControl" rows="5" cols="150"
				name="pe_biologicalControl"></textarea>
		</div>
		<div class="form-group">
			<label for="naturalEnemy">천적</label>
			<textarea class="form-control" id="pe_naturalEnemy" rows="5" cols="150"
				name="pe_naturalEnemy"></textarea>
		</div>
		
		<div class="form-group col-md-12">
			<label for="carefulPlant">조심해야할 식물</label> <input type="text"
				class="form-control" id="pe_carefulPlant"
				name="pe_carefulPlant">
		</div>
		
		<div class="form-group">
			<label for="description">상세설명</label>
			<textarea class="form-control" id="pe_description" rows="5" cols="150"
				name="pe_description"></textarea>
		</div>
	</div>
	<div class="form-group">
		<label for="image">이미지</label> <input type="file"
			class="form-control-file" name="file" multiple onchange="readURL(this);">
		<div id="preview"></div>
	</div>
	<button class="btn btn-primary" id="submit">백과 등록하기</button>
	<button type="reset" class="btn btn-primary" onclick="imgreset();">백과 재작성</button>

</form>

<script>

$(document).ready(function(){
	

	$("#submit").click(function() {
		
		let pe_name = $('#pe_name').val();
		var cnt = 0;
		
		$.ajax({
			
			url: "${pageContext.request.contextPath}/encyclopedia/checkPest",
			data: { pe_name : pe_name},
			type: 'POST',
			async: false,
			dataType: 'json',
			success: function(result){
				if(result != 0){
					alert('이미 존재하는 해충명입니다.');
					cnt = 1;
				}
			},
			error: function(){
				alert('서버요청실패');
		}
			
		})
			
		if(cnt == 1)
			return false;

	});

	
})


function imgreset(){
	
	$("#preview").replaceWith("<div id='preview'></div>");
	
}

function readURL(input) {
	
	$("#preview").replaceWith("<div id='preview'></div>");
	
	for(var i=0; i<input.files.length; i++){
		
		if(input.files && input.files[i]){
			var reader = new FileReader();
			
			
			reader.onload = function(e) {

				$("#preview").append('<img style="height:75px; margin-right: 5px; margin-top: 5px;"' + 'src="' + e.target.result + '"/>');
				
			}
			reader.readAsDataURL(input.files[i]);
			
		}

	}
	
	
}
</script>