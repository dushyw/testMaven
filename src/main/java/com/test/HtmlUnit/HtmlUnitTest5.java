package com.test.HtmlUnit;

import java.io.IOException;
import java.net.MalformedURLException;

import com.gargoylesoftware.htmlunit.FailingHttpStatusCodeException;
import com.gargoylesoftware.htmlunit.WebClient;
import com.gargoylesoftware.htmlunit.html.HtmlPage;

public class HtmlUnitTest5 {

	public static void main(String[] args) {
		WebClient webClient=new WebClient(); // 实例化Web客户端
		webClient.getOptions().setCssEnabled(false); // 取消css支持
		webClient.getOptions().setJavaScriptEnabled(false); // 取消javascript支持
		try {
			HtmlPage page=webClient.getPage("http://www.java1234.com"); // 解析获取页面
			System.out.println("网页html:"+page.asXml());
			System.out.println("==================================");
			System.out.println("网页文本："+page.asText());
		} catch (FailingHttpStatusCodeException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			webClient.close(); // 关闭客户端，释放内存
		}
	}
}
