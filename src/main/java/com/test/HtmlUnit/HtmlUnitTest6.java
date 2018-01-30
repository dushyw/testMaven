package com.test.HtmlUnit;

import java.io.IOException;
import java.net.MalformedURLException;

import com.gargoylesoftware.htmlunit.BrowserVersion;
import com.gargoylesoftware.htmlunit.FailingHttpStatusCodeException;
import com.gargoylesoftware.htmlunit.WebClient;
import com.gargoylesoftware.htmlunit.html.HtmlForm;
import com.gargoylesoftware.htmlunit.html.HtmlPage;
import com.gargoylesoftware.htmlunit.html.HtmlSubmitInput;
import com.gargoylesoftware.htmlunit.html.HtmlTextInput;

public class HtmlUnitTest6 {

	public static void main(String[] args) {
		WebClient webClient=new WebClient(BrowserVersion.FIREFOX_52); // 实例化Web客户端
		try {
			HtmlPage page=webClient.getPage("http://blog.java1234.com/index.html"); // 解析获取页面
			HtmlForm form=page.getFormByName("myform"); // 获取搜索Form
			HtmlTextInput textField=form.getInputByName("q"); // 获取查询文本框
			HtmlSubmitInput button=form.getInputByName("submitButton"); // 获取提交按钮
			textField.setValueAttribute("java"); // 文本框“填入”数据
			HtmlPage resultPage=button.click(); // 模拟点击 获取查询结果页面
			System.out.println(resultPage.asXml());
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
