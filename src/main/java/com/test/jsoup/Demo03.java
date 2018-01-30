package com.test.jsoup;

import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Demo03 {

    public static void main(String[] args) throws Exception{
        CloseableHttpClient httpclient = HttpClients.createDefault(); // 创建httpclient实例
        HttpGet httpget = new HttpGet("http://www.cnblogs.com/"); // 创建httpget实例

        CloseableHttpResponse response = httpclient.execute(httpget); // 执行get请求
        HttpEntity entity=response.getEntity(); // 获取返回实体
        String content=EntityUtils.toString(entity, "utf-8");
        response.close(); // 关闭流和释放系统资源

        Document doc=Jsoup.parse(content); // 解析网页 得到文档对象

        Elements linkElements=doc.select("#post_list .post_item .post_item_body h3 a"); //通过选择器查找所有博客链接DOM
        for(Element e:linkElements){
            System.out.println("博客标题："+e.text());
        }

        System.out.println("===============");
        Elements hrefElements=doc.select("a[href]"); // 带有href属性的a元素
        for(Element e:hrefElements){
            System.out.println(e.toString());
        }

        System.out.println("===============");
        Elements imgElements=doc.select("img[src$=.png]"); // 查找扩展名为.png的图片DOM节点
        for(Element e:imgElements){
            System.out.println(e.toString());
        }

        Element element=doc.getElementsByTag("title").first(); // 获取tag是title的所有DOM元素
        String title=element.text(); // 返回元素的文本
        System.out.println("网页标题是："+title);

    }
}
