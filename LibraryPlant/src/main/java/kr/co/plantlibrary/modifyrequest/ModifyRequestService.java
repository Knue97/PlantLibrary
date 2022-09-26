package kr.co.plantlibrary.modifyrequest;

public interface ModifyRequestService {
	
	// 수정요청 등록하기
		public int register(ModifyRequestEntity modifyRequestEntity) throws Exception;
}
