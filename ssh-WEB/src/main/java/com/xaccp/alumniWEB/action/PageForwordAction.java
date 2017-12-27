package com.xaccp.alumniWEB.action;

/**
 * 
 * @author yu
 *  控制页面转发
 */
public class PageForwordAction {

	public String insert() {
		System.out.println("进入insert");
		return "ok";
	}
	public String forget() {
		System.out.println("进入forget");
		return "success";
	}
	public String userLogin() {
		System.out.println("进入login");
		return "ojbk";
	}
}
