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

public class Demo02 {

    public static void main(String[] args) throws Exception{
        CloseableHttpClient httpclient = HttpClients.createDefault(); // 创建httpclient实例
        HttpGet httpget = new HttpGet("http://www.cnblogs.com/"); // 创建httpget实例

        CloseableHttpResponse response = httpclient.execute(httpget); // 执行get请求
        HttpEntity entity=response.getEntity(); // 获取返回实体
        String content=EntityUtils.toString(entity, "utf-8");
        response.close(); // 关闭流和释放系统资源

        Document doc=Jsoup.parse(content); // 解析网页 得到文档对象
        Elements elements=doc.getElementsByTag("title"); // 获取tag是title的所有DOM元素
        Element element=elements.get(0); // 获取第1个元素
        String title=element.text(); // 返回元素的文本
        System.out.println("网页标题是："+title);

        Element element2=doc.getElementById("site_nav_top"); // 获取id=site_nav_top的DOM元素
        String navTop=element2.text(); // 返回元素的文本
        System.out.println("口号："+navTop);

        Elements itemElements=doc.getElementsByClass("post_item"); // 根据样式名称来查询DOM
        System.out.println("=======输出post_item==============");
        for(Element e:itemElements){
            System.out.println(e.html());
            System.out.println("-------------");
        }

        Elements widthElements=doc.getElementsByAttribute("width"); // 根据属性名称来查询DOM
        System.out.println("=======输出with的DOM==============");
        for(Element e:widthElements){
            System.out.println(e.toString());
            System.out.println("-------------");
        }

        Elements targetElements=doc.getElementsByAttributeValue("target", "_blank");
        System.out.println("=======输出target-_blank的DOM==============");
        for(Element e:targetElements){
            System.out.println(e.toString());
            System.out.println("-------------");
        }

    }
}