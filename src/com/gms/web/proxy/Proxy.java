package com.gms.web.proxy;


import javax.servlet.http.HttpServletRequest;

import lombok.Getter;

public abstract class Proxy {

	HttpServletRequest request;
	public HttpServletRequest getRequest() {
		return request;
	}
	public Proxy(HttpServletRequest request){
		this.request=request;
	}
}
