package com.test.HtmlUnit;

import java.io.IOException;
import java.net.MalformedURLException;
import java.util.List;

import com.gargoylesoftware.htmlunit.BrowserVersion;
import com.gargoylesoftware.htmlunit.FailingHttpStatusCodeException;
import com.gargoylesoftware.htmlunit.WebClient;
import com.gargoylesoftware.htmlunit.html.DomElement;
import com.gargoylesoftware.htmlunit.html.DomNodeList;
import com.gargoylesoftware.htmlunit.html.HtmlDivision;
import com.gargoylesoftware.htmlunit.html.HtmlListItem;
import com.gargoylesoftware.htmlunit.html.HtmlPage;
import com.gargoylesoftware.htmlunit.html.HtmlSpan;

public class HtmlUnitTest3 {

	public static void main(String[] args) {
		WebClient webClient=new WebClient(BrowserVersion.FIREFOX_52); // 实例化Web客户端
		try {
			HtmlPage page=webClient.getPage("http://www.java1234.com"); // 解析获取页面
			HtmlDivision div=page.getHtmlElementById("navMenu"); // 查找指定id的html dom元素
			System.out.println(div.asXml());
			System.out.println("==============");
			DomNodeList<DomElement>  aList=page.getElementsByTagName("a"); // 根据tag名称查询所有tag
			for(int i=0;i<aList.getLength();i++){
				DomElement a=aList.get(i);
				System.out.println(a.asXml());
			}
			System.out.println("==============");
			List<HtmlSpan> spanList=page.getByXPath("//div[@id='navMenu']/ul/li[2]/a/span");
			System.out.println(spanList.get(0).asText());
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
