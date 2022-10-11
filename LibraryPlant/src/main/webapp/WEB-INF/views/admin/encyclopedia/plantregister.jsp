<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<form action="/encyclopedia/plant/register" method="post">
	<div class="form-row">
		<div class="form-group col-12">
			<h2>요약정보</h2>
		</div>
		<!--식물 정보-->
		<input type="hidden" name="ec_id" value="10">
		<div class="form-group col-md-6">
			<label for="koreanName">한글명</label> <input type="text"
				class="form-control" id="koreanName" placeholder="한글명"
				name="pl_koreanName">
		</div>
		<div class="form-group col-md-6">
			<label for="englishName">영문명</label> <input type="text"
				class="form-control" id="englishName" placeholder="영문명"
				name="pl_englishName">
		</div>
		<div class="form-group col-md-6">
			<label for="scientificName">학명</label> <input type="text"
				class="form-control" id="scientificName" placeholder="학명"
				name="pl_scientificName">
		</div>
		<div class="form-group col-md-6">
			<label for="familyName">과명</label> <input type="text"
				class="form-control" id="familyName" placeholder="과명"
				name="pl_familyName">
		</div>
		<div class="form-group col-md-6">
			<label for="classification">식물구분</label> <input type="text"
				class="form-control" id="classification" placeholder="식물구분"
				name="pl_classification">
		</div>
		<div class="form-group col-md-6">
			<label for="nativeHome">원산지</label> <input type="text"
				class="form-control" id="nativeHome" placeholder="원산지"
				name="pl_nativeHome">
		</div>
		<div class="form-group col-md-12">
			<label for="feature">특징 및 효능</label> <input type="text"
				class="form-control" id="feature" placeholder=""
				name="pl_feature">
		</div>
		<!--식물 정보 end-->

		<!--기르기 정보-->
		<div class="form-group col-md-6">
			<label for="level">난이도</label> <select id="level"
				class="form-control" name="pl_level">
				<option selected value="최하">최하</option>
				<option value="하">하</option>
				<option value="중">중</option>
				<option value="상">상</option>
				<option value="최상">최상</option>
			</select>
		</div>
		<div class="form-group col-md-6">
			<label for="reproduction">번식</label> <input type="text"
				class="form-control" id="reproduction" placeholder=""
				name="pl_reproduction">
		</div>
		<div class="form-group col-md-6">
			<label for="water">물주기</label> <input type="text"
				class="form-control" id="water" placeholder="" name="pl_water">
		</div>
		<div class="form-group col-md-6">
			<label for="growthTemperature">생육 적온</label> <input type="text"
				class="form-control" id="growthTemperature" placeholder=""
				name="pl_growthTemperature">
		</div>
		<div class="form-group col-md-6">
			<label for="light">햇볕 양</label> <input type="text"
				class="form-control" id="light" placeholder="" name="pl_light">
		</div>
		<div class="form-group col-md-6">
			<label for="placement">추천 공간</label> <input type="text"
				class="form-control" id="placement" placeholder=""
				name="pl_placement">
		</div>
		<div class="form-group">
			<label for="summary">요약 정보</label>
			<textarea class="form-control" id="summary" rows="5" cols="150"
				name="pl_summary"></textarea>
		</div>
		<div class="form-group">
			<label for="tip">Tip</label>
			<textarea class="form-control" id="tip" rows="5" cols="150"
				name="pl_tip"></textarea>
		</div>
	</div>
	<!--기르기 정보 end-->

	<div class="form-group">
		<h2>상세정보</h2>
	</div>
	<div class="form-group">
		<label for="pl_detailLight">빛</label>
		<textarea class="form-control" id="pl_detailLight rows="
			5" cols="150" name="pl_detailLight"></textarea>
	</div>
	<div class="form-group">
		<label for="pl_detailTemperature">온도</label>
		<textarea class="form-control" id="pl_detailTemperature" rows="5"
			cols="150" name="pl_detailTemperature"></textarea>
	</div>
	<div class="form-group">
		<label for="pl_detailWater">물</label>
		<textarea class="form-control" id="pl_detailWater" rows="5"
			cols="150" name="pl_detailWater"></textarea>
	</div>
	<div class="form-group">
		<label for="pl_detailReproduction">번식</label>
		<textarea class="form-control" id="pl_detailReproduction" rows="5"
			cols="150" name="pl_detailReproduction"></textarea>
	</div>
	<div class="form-group">
		<label for="pl_detailSupport">지지대</label>
		<textarea class="form-control" id="pl_detailSupport" rows="5"
			cols="150" name="pl_detailSupport"></textarea>
	</div>
	<div class="form-group">
		<label for="pl_detailSoil">흙</label>
		<textarea class="form-control" id="pl_detailSoil" rows="5"
			cols="150" name="pl_detailSoil"></textarea>
	</div>
	<div class="form-group">
		<label for="pl_detailPottingAndRoot">분갈이,뿌리</label>
		<textarea class="form-control" id="pl_detailPottingAndRoot"
			rows="5" cols="150" name="pl_detailPottingAndRoot"></textarea>
	</div>
	<div class="form-group">
		<label for="pl_detailFertilizer">비료</label>
		<textarea class="form-control" id="pl_detailFertilizer" rows="5"
			cols="150" name="pl_detailFertilizer"></textarea>
	</div>
	<div class="form-group">
		<label for="pl_detailCaution">주의</label>
		<textarea class="form-control" id="pl_detailCaution" rows="5"
			cols="150" name="pl_detailCaution"></textarea>
	</div>
	<div class="form-group">
		<label for="pl_imageSource">이미지 출처</label> <input type="text"
			class="form-control" id="pl_imageSource" name="pl_imageSource"
			placeholder="https://pixabay.com/ko/photos/%eb%8f%88-%ea%b3%b5%ec%9e%a5-%ed%99%a9%ea%b8%88-pothos-2749714/">
	</div>
	<div class="form-group">
		<label for="pl_contentSource">내용 출처</label> <input type="text"
			class="form-control" id="pl_contentSource" name="pl_contentSource"
			placeholder="한평 공간에 만드는 나만의 실내정원">
	</div>
	<div class="form-group">
		<label for="pl_image">이미지</label> <input type="file"
			class="form-control-file" id="pl_image" name="pl_image">
	</div>
	<button type="submit" class="btn btn-primary">백과 등록하기</button>
	<button type="reset" class="btn btn-primary" onclick="imgreset();">백과 재작성</button>
</form>

<script>

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