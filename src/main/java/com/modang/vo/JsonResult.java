package com.modang.vo;

public class JsonResult {
	
	//필드
	private String result;
	private Object data;
	private String failMsg;
	public JsonResult() {
		super();
	}
	public JsonResult(String result, Object data, String failMsg) {
		super();
		this.result = result;
		this.data = data;
		this.failMsg = failMsg;
	}
	
	//성공했을 때
		public void success(Object data) {
			this.result="success";
			this.data=data;
		}
		//실패 했을 떄
		public void fail(String msg) {
			this.result="fail";
			this.failMsg=msg;
			
		}

	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}
	public String getFailMsg() {
		return failMsg;
	}
	public void setFailMsg(String failMsg) {
		this.failMsg = failMsg;
	}
	@Override
	public String toString() {
		return "JsonResult [result=" + result + ", data=" + data + ", failMsg=" + failMsg + "]";
	}
	
}
