<%--
  Created by IntelliJ IDEA.
  User: yuanwei
  Date: 2018/1/29
  Time: 下午2:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>echarts的图标效果</title>
    <script type="text/javascript" src="../js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="../js/echarts.js"></script>
    <script type="text/javascript" src="../js/dark.js"></script>
</head>
<body>
    <!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
    <div id="main" style="width: 600px;height:400px;"></div>
    <div id="main2" style="width: 600px;height:400px;"></div>
    <div id="main3" style="width: 600px;height:400px;"></div>
    <div id="main4" style="width: 600px;height:400px;"></div>
    <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'),'dark');

        // 指定图表的配置项和数据
        var option = {
            title: {
                text: 'ECharts 入门示例'
            },
            tooltip: {},
            legend: {
                data:['销量']
            },
//            xAxis: {
//                data: ["衬衫","羊毛衫","雪纺衫","裤子","高跟鞋","袜子"]
//            },
//            yAxis: {},
            series: [{
                name: '销量',
                type: 'pie',
                data: [
                    {name: 'a',value: 22},
                    {name: 'b',value: 33},
                    {name: 'c',value: 44}
                ]
            }]
        };

        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    </script>
    <script>
        echarts.init(document.getElementById('main2')).setOption({
            title: {text: 'Line Chart'},
            tooltip: {},
            toolbox: {
                feature: {
                    dataView: {},
                    saveAsImage: {
                        pixelRatio: 2
                    },
                    restore: {}
                }
            },
            xAxis: {},
            yAxis: {},
            series: [{
                type: 'line',
                smooth: true,
                data: [[12, 5], [24, 20], [36, 36], [48, 10], [60, 10], [72, 20]]
            }]
        });
    </script>
    <script>
        option = {
            backgroundColor: '#2c343c',
            visualMap: {
                show: false,
                min: 80,
                max: 600,
                inRange: {
                    colorLightness: [0, 1]
                }
            },
            series : [
                {
                    name: '访问来源',
                    type: 'pie',
                    radius: '55%',
                    data:[
                        {value:235, name:'视频广告'},
                        {value:274, name:'联盟广告'},
                        {value:310, name:'邮件营销'},
                        {value:335, name:'直接访问'},
                        {value:400, name:'搜索引擎'}
                    ],
                    roseType: 'angle',
                    label: {
                        normal: {
                            textStyle: {
                                color: 'rgba(255, 255, 255, 0.3)'
                            }
                        }
                    },
                    labelLine: {
                        normal: {
                            lineStyle: {
                                color: 'rgba(255, 255, 255, 0.3)'
                            }
                        }
                    },
                    itemStyle: {
                        normal: {
                            color: '#c23531',
                            shadowBlur: 200,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }
            ]
        };
        echarts.init(document.getElementById('main3')).setOption(option)
    </script>
    <script>
        myChart = echarts.init(document.getElementById("main4"),"dark");
        myChart.showLoading();
        myChart.hideLoading();
        function fetchData(cb) {
            // 通过 setTimeout 模拟异步加载
            setTimeout(function () {
                cb({
                    categories: ["衬衫","羊毛衫","雪纺衫","裤子","高跟鞋","袜子"],
                    data: [5, 20, 36, 10, 10, 20]
                });
            }, 5000);
        }

        // 初始 option
        option = {
            title: {
                text: '异步数据加载示例'
            },
            tooltip: {},
            legend: {
                data:['销量']
            },
            xAxis: {
                data: []
            },
            yAxis: {},
            series: [{
                name: '销量',
                type: 'bar',
                data: []
            }]
        };
        myChart.setOption(option)
        fetchData(function (data) {
            myChart.setOption({
                xAxis: {
                    data: data.categories
                },
                series: [{
                    // 根据名字对应到相应的系列
                    name: '销量',
                    data: data.data
                }]
            });
        });
    </script>
</body>
</html>
