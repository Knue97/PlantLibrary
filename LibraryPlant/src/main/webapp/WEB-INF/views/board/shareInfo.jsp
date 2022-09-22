<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<div class="row px-xl-5">
	<div class="col">
		<div class="nav nav-tabs justify-content-center border-secondary mb-4">
			<a class="nav-item nav-link active" data-toggle="tab"
				href="#tab-pane-1">Description</a> <a class="nav-item nav-link"
				data-toggle="tab" href="#tab-pane-2">Information</a> <a
				class="nav-item nav-link" data-toggle="tab" href="#tab-pane-3">Reviews
				(0)</a>
		</div>
		<div class="tab-content">
			<div class="tab-pane fade show active" id="tab-pane-1">
				<h4 class="mb-3">나눔 설명</h4>
				<p>뭔가 들어감</p>
			</div>
			<div class="tab-pane fade" id="tab-pane-2">
				<h4 class="mb-3">나누는 자 정보</h4>
				<p>어쩌구</p>
				<div class="row">
					<div class="col-md-6">
						<ul class="list-group list-group-flush">
							<li class="list-group-item px-0">Sit erat duo lorem duo ea
								consetetur, et eirmod takimata.</li>
							<li class="list-group-item px-0">Amet kasd gubergren sit
								sanctus et lorem eos sadipscing at.</li>
							<li class="list-group-item px-0">Duo amet accusam eirmod
								nonumy stet et et stet eirmod.</li>
							<li class="list-group-item px-0">Takimata ea clita labore
								amet ipsum erat justo voluptua. Nonumy.</li>
						</ul>
					</div>
					<div class="col-md-6">
						<ul class="list-group list-group-flush">
							<li class="list-group-item px-0">Sit erat duo lorem duo ea
								consetetur, et eirmod takimata.</li>
							<li class="list-group-item px-0">Amet kasd gubergren sit
								sanctus et lorem eos sadipscing at.</li>
							<li class="list-group-item px-0">Duo amet accusam eirmod
								nonumy stet et et stet eirmod.</li>
							<li class="list-group-item px-0">Takimata ea clita labore
								amet ipsum erat justo voluptua. Nonumy.</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="tab-pane fade" id="tab-pane-3">
				<div class="row">
					<div class="col-md-6">
						<h4 class="mb-4">1 review for "Colorful Stylish Shirt"</h4>
						<div class="media mb-4">
							<!-- <img src="img/user.jpg" alt="Image" class="img-fluid mr-3 mt-1"
								style="width: 45px;">-->
								유저 이미지를 넣는다면...
							<div class="media-body">
								<h6>
									John Doe<small> - <i>01 Jan 2045</i></small>
								</h6>
								<div class="text-primary mb-2">
									<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
										class="fas fa-star"></i> <i class="fas fa-star-half-alt"></i>
									<i class="far fa-star"></i>
								</div>
								<p>후기후기</p>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<h4 class="mb-4">Leave a review</h4>
						<small>Your email address will not be published. Required
							fields are marked *</small>
						<div class="d-flex my-3">
							<p class="mb-0 mr-2">Your Rating * :</p>
							<div class="text-primary">
								<i class="far fa-star"></i> <i class="far fa-star"></i> <i
									class="far fa-star"></i> <i class="far fa-star"></i> <i
									class="far fa-star"></i>
							</div>
						</div>
						<form>
							<div class="form-group">
								<label for="message">나눔 후기</label>
								<textarea id="message" cols="30" rows="5" class="form-control"></textarea>
							</div>
							<div class="form-group">
								<label for="u_id">아이디</label> ${user.u_nickname}
							</div>

							<div class="form-group mb-0">
								<input type="submit" value="작성완료" class="btn btn-primary px-3">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>