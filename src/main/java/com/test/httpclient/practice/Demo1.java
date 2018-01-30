package com.test.httpclient.practice;


import org.apache.commons.io.FileUtils;
import org.apache.http.HttpEntity;
import org.apache.http.HttpHost;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.junit.Test;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;

/**
 * www.baidu.com的页面内容显示
 */
public class Demo1 {
   @Test
   public  void test1() throws IOException {
      //1.获取httpClient
      CloseableHttpClient httpClient = HttpClients.createDefault();
      //2.获取httpget
      HttpGet httpGet = new HttpGet("http://www.baidu.com");
      //3.执行获取返回值
      CloseableHttpResponse httpResponse = httpClient.execute(httpGet);
      //4.获取返回实体
      HttpEntity entity = httpResponse.getEntity();
      //5.获取网页内容
      System.out.println(EntityUtils.toString(entity,"utf-8"));
   }

   @Test
   public  void test2() throws  IOException{
      System.out.println(EntityUtils.toString(HttpClients.createDefault().execute(new HttpGet("http://www.baidu.com")).getEntity(),"utf-8"));
   }

   @Test
   public  void test3() throws IOException{
      //1.获取HttpClient实例
      CloseableHttpClient httpClient = HttpClients.createDefault();
      //2.获取httpGet实例
      HttpGet httpGet = new HttpGet("http://www.baidu.com");
      //添加消息头
      httpGet.setHeader("User-Agent","Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36");
      //添加消息代理
      HttpHost httpHost = new HttpHost("114.114.114.114",8080);
      //设置代理和连接时长和返回时长
      RequestConfig config = RequestConfig.custom().setProxy(httpHost).setConnectTimeout(10000).setSocketTimeout(10000).build();
      //添加配置
      httpGet.setConfig(config);
      //获取到返回对象
      CloseableHttpResponse httpResponse = httpClient.execute(httpGet);
      //得到返回对象的实体
      HttpEntity entity = httpResponse.getEntity();
      if(entity != null){
         InputStream inputStream = entity.getContent();
         //将实体写入到文件中
         FileUtils.copyToFile(inputStream,new File("/Users/yuanwei/Desktop/test.txt"));
      }
   }
}
