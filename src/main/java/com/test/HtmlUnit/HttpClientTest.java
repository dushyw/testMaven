package com.test.HtmlUnit;

import java.io.IOException;

import com.gargoylesoftware.htmlunit.BrowserVersion;
import com.gargoylesoftware.htmlunit.Page;
import com.gargoylesoftware.htmlunit.WebClient;
import com.gargoylesoftware.htmlunit.WebResponse;
import com.gargoylesoftware.htmlunit.html.HtmlPage;
import org.apache.http.HttpEntity;
import org.apache.http.HttpHost;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.junit.Test;

public class HttpClientTest {

	public static void main(String[] args) throws ClientProtocolException, IOException {
		CloseableHttpClient httpclient = HttpClients.createDefault(); // 创建httpclient实例
		HttpGet httpget = new HttpGet("https://pan.baidu.com/share/home?uk=305605848#category/type=0"); // 创建httpget实例
		httpget.setHeader("User-Agent", "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:50.0) Gecko/20100101 Firefox/50.0"); // 设置请求头消息User-Agent
		CloseableHttpResponse response = httpclient.execute(httpget); // 执行get请求
		HttpEntity entity=response.getEntity(); // 获取返回实体
		System.out.println("网页内容："+EntityUtils.toString(entity, "utf-8")); // 指定编码打印网页内容
		response.close(); // 关闭流和释放系统资源
	}

	@Test
	public  void test() throws IOException {
		CloseableHttpClient httpClient = HttpClients.createDefault();
		HttpGet httpGet = new HttpGet("http://www.baidu.com");
		HttpHost proxy = new HttpHost("59.110.52.236",80);
		RequestConfig config = RequestConfig.custom().setConnectTimeout(10000).setSocketTimeout(10000).setProxy(proxy).build();
		httpGet.setHeader("User-Agent","Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36");
		httpGet.setConfig(config);
		CloseableHttpResponse response = httpClient.execute(httpGet);
		HttpEntity entity = response.getEntity();
		System.out.println(EntityUtils.toString(entity,"utf-8"));
	}

	@Test
	public  void testClient() throws IOException {
		WebClient webClient = new WebClient(BrowserVersion.FIREFOX_52,"59.110.52.236",80);
		HtmlPage page = webClient.getPage("http://www.baidu.com");
//		WebResponse webResponse = page.getWebResponse();
		System.out.println(page.asXml());
		System.out.println(page.asText());
	}
}
