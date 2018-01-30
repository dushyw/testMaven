<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>无标题文档</title>
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/css/select.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/css/easydialog.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <!--[if lte IE 9]>
    <script src="${pageContext.request.contextPath}/js/respond.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/html5shiv.js" type="text/javascript"></script>
    <![endif]-->
    <script src="${pageContext.request.contextPath}/js/easydialog.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/easydialog.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.idTabs.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/select-ui.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/editor/kindeditor.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function(e) {
            msgHide();
            $(".select1").uedSelect({
                width : 300
            });
            $('#4gMsg').show();
            showAllMsg();
            $('#showLte,#showLte1').click(function(){
                $('#4gMsg').show();
            });
            $('#hideLte,#hideLte1').click(function(){
                $('#4gMsg').hide();
            });
            $('#showGl').click(function(){
                $('#2gMsg').show();
            })
            $('#hideGl').click(function(){
                $('#2gMsg').hide();
            })
        });

        function showAllMsg(){
            var equipmentStatus;
            equipmentStatus = $('#equipmentStatus').val();
            if ( 'UL' == equipmentStatus){
                $('#3gMsg').show();
            }else if('GL' == equipmentStatus){
                $('#2gMsg').show();
            }else if('NB' == equipmentStatus){
                if($('gsm_stationBusIp').val()){
                    $('#2gMsg').show();
                }
                $('#nbMsg').show();
            }else{
                $('#4gMsg').show();
            }
            $('#equipmentStatus').change(function(){
                equipmentStatus = $('#equipmentStatus').val();
                if ( 'UL' == equipmentStatus){
                    msgHide();
                    $('#3gMsg').show();
                }else if('GL' == equipmentStatus){
                    msgHide();
                    $('#2gMsg').show();
                }else if('NB' == equipmentStatus){
                    msgHide();
                    $('#nbMsg').show();
                }else{
                    msgHide();
                    $('#4gMsg').show();
                }
            })
        }

        function msgHide(){
            $('#2gMsg').hide();
            $('#3gMsg').hide();
            $('#nbMsg').hide();
            $('#4gMsg').hide();
        }

        function fun(){
            return true;
        }
        /* function show(){
           var equip=$("#equip").val();
           if(equip){
               easyDialog.open({
                      container : {
                        header : '提示',
                        content : '已选择一个端口!',
                        yesFn : fun
                      }
                });
           }else{
               var formNo=$("#formNo").val();
               var equipcode=$("#equipcode").val();
               var stationName=$("#stationName").val();
               var clockExtraction=$("#clockExtraction").val();
               var stationBusIp=$("#stationBusIp").val();
               var gatewayBusIp=$("#gatewayBusIp").val();
               var stationManIp=$("#stationManIp").val();
               var gatewayManIp=$("#gatewayManIp").val();
               var state=$("#state").val();
               $.ajax({
                    url:"${pageContext.request.contextPath}/tj/lssued/saveBus",
		        data:{'formNo':formNo,'stationName':stationName,'clockExtraction':clockExtraction,
		        	'stationBusIp':stationBusIp,'gatewayBusIp':gatewayBusIp,'stationManIp':stationManIp,'gatewayManIp':gatewayManIp,'state':state},
		        dataType:'text',
		        type:'post',
		        success:function(data){
		        }
	    	})
	    	if(equipcode==''){
	    		window.open("/utn/tj/lssued/"+formNo+"/room","_self");
	    	}else{
	    		window.open("/utn/tj/lssued/0/"+equipcode+"/"+formNo+"/port","_self");
	    	}
	   }
	} */


        function checkIP(ip)
        {
            obj=ip;
            var exp=/^(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])$/;
            var reg = obj.match(exp);
            if(reg==null)
            {
                return false;//不合法
            }
            else
            {
                return true; //合法
            }
        }


        function checkMask(mask)
        {
            obj=mask;
            var exp=/^(254|252|248|240|224|192|128|0)\.0\.0\.0|255\.(254|252|248|240|224|192|128|0)\.0\.0|255\.255\.(254|252|248|240|224|192|128|0)\.0|255\.255\.255\.(254|252|248|240|224|192|128|0)$/;
            var reg = obj.match(exp);
            if(reg==null)
            {
                return false; //"非法"
            }
            else
            {
                return true; //"合法"
            }
        }

        function sumbitFrom(){
            //校验数据和ip的格式
            var  emonsNo=$('#emonsNo').val();
            var  stationBusIp=$('#stationBusIp').val();
            var  gatewayBusIp=$('#gatewayBusIp').val();
            var  stationManIp=$('#stationManIp').val();
            var  gatewayManIp=$('#gatewayManIp').val();
            var  stationName=$('#stationName').val();
            var  equipmentStatus=$('#equipmentStatus').val();
            //是否有电子运维工单号和基站名称
            if(emonsNo && stationName ){
                //UL业务下发
                if(equipmentStatus == 'UL'){
                    if($('#scdma_stationBusIp').val() && $('#scdma_gatewayBusIp').val()){
                        //华为UL的基站
                        if($('#dhcpRelay').val() == '10.100.64.65'){
                            //是否有中继ip
                            if($('#scdma_zjIp').val()){
                                submit();
                            }else{
                                showMsg();
                            }
                        }else{
                            submit();
                        }
                    }else{
                        showMsg();
                    }
                    //GL业务下发
                }else if(equipmentStatus == 'GL'){
                    if($('#gsm_stationBusIp').val() && $('#gsm_gatewayBusIp').val()){
                        //华为GL的基站
                        if($('#dhcpRelay').val() == '10.100.64.65'){
                            //是否有中继ip
                            if($('#gsm_zjIp').val()){
                                submit();
                            }else{
                                showMsg();
                            }
                        }else{
                            submit();
                        }
                    }else{
                        showMsg();
                    }
                    //NB业务下发
                }else if(equipmentStatus == 'NB'){
                    if($('#nb_stationBusIp').val() && $('#nb_gatewayBusIp').val()){
                        submit();
                    }else{
                        showMsg();
                    }
                    //普通4G业务下发
                }else if(equipmentStatus == 'FDD' || equipmentStatus == 'TDD'){
                    //四段ip地址是否存在
                    if(stationBusIp && gatewayBusIp && stationManIp && gatewayManIp){
                        submit();
                    }else{
                        showMsg();
                    }
                }
            }else{
                showMsg();
            }
        }

        function submit(){
            $("#generateForm").submit();
            $("#generateForm").attr('disabled','true');
        }

        function showMsg(){
            easyDialog.open({
                container : {
                    header : '提示',
                    content : '请将信息填写完整!',
                    yesFn : fun
                }
            });
        }

        function checkAll(e){
            var  value=$(e).val();
            if(value){
                var arr1=value.split('/');
                //如果输入的符合要求，则ip地址的格式没有问题
                if(arr1.length>1){
                    if(arr1[1] < 33){
                        $.ajax({
                            url:"${pageContext.request.contextPath}/tj/lssued/numToIp",
                            data:{'bitMask':arr1[1]},
                            dataType:'text',
                            type:'post',
                            success:function(data){
                                if(checkIP(arr1[0]) && checkMask(data)){
                                    if(checkName(e)){
                                        checkAdress(e);
                                        if(checkName(e)){
                                            $(e).next().html('输入格式如:10.3.64.128/30');
                                        };
                                    }
                                }else{
                                    $(e).next().html('<b>输入格式有误,请重新输入</b>');
                                    $(e).focus();
                                }
                            }
                        });
                    }else{
                        if(checkIP(arr1[0]) && checkMask(arr1[1])){
                            if(checkName(e)){
                                //核查ip地址是否已经被使用
                                checkAdress(e);
                                // $(e).val(arr1[0]+"/"+mask);
                                if(checkName(e)){
                                    $(e).next().html('输入格式如:10.3.64.128/30')
                                };
                            }
                        }else{
                            $(e).next().html('<b>输入格式有误,请重新输入</b>')
                            $(e).focus();
                        }
                    }
                }else{
                    $(e).next().html('<b>输入格式有误,请重新输入</b>')
                    $(e).focus();
                }
            }
        }

        function checkAdress(e){
            var ip=$(e).val();
            var busStatus="4g";
            $.ajax({
                url:"${pageContext.request.contextPath}/tj/lssued/check",
                data:{'busStatus':busStatus,'ip':ip},
                dataType:'text',
                type:'post',
                success:function(data){
                    if(data){
                        var json=eval("("+data+")");
                        $(e).next().html('<b>当前ip已被设备名称为:'+json.equipmentlabel+'端口名称为:'+json.logicportlabel+'使用</b>')
                        $(e).focus();
                    }else{
                        $.ajax({
                            url:"${pageContext.request.contextPath}/tj/lssued/checkIp",
                            data:{'ip':ip},
                            dataType:'text',
                            type:'post',
                            success:function(data){
                                if(data){
                                    var json=eval("("+data+")");
                                    $(e).next().html('<b>当前ip已被设备名称为:'+json.equipLabel+'端口名称为:'+json.portLabel+'使用</b>')
                                    $(e).focus();
                                }else{
                                    $.ajax({
                                        url:"${pageContext.request.contextPath}/tj/lssued/checkyz",
                                        data:{'busStatus':busStatus,'ip':ip},
                                        dataType:'text',
                                        type:'post',
                                        success:function(data){
                                            if(data){
                                                $(e).next().html('<b>当前ip已被预占用</b>')
                                                $(e).focus();
                                            }
                                        }
                                    });
                                }
                            }
                        });
                    }
                }
            });
        }
        function checkName(e){
            var values="";
            var  stationBusIp=$('#stationBusIp').val();
            var  gatewayBusIp=$('#gatewayBusIp').val();
            var  stationManIp=$('#stationManIp').val();
            var  gatewayManIp=$('#gatewayManIp').val();
            var  scdma_stationBusIp=$('#scdma_stationBusIp').val();
            var  scdma_gatewayBusIp=$('#scdma_gatewayBusIp').val();
            var  gsm_stationBusIp=$('#gsm_stationBusIp').val();
            var  gsm_gatewayBusIp=$('#gsm_gatewayBusIp').val();
            var  nb_stationBusIp=$('#nb_stationBusIp').val();
            var  nb_gatewayBusIp=$('#nb_gatewayBusIp').val();
            var  scdma_zjIp=$('#scdma_zjIp').val();
            var  gsm=$('#gsm_zjIp').val();
            values=stationBusIp+gatewayBusIp+stationManIp+gatewayManIp+scdma_stationBusIp+scdma_gatewayBusIp+gsm_stationBusIp+gsm_gatewayBusIp+nb_stationBusIp+nb_gatewayBusIp+scdma_zjIp+gsm_zjIp;
            var val=$(e).val();
            var newValue=values.replace(val,"");
            if(newValue==""){
                return true;
            }else{
                if(newValue.indexOf(val)>-1){
                    $(e).next().html('<b>该ip与已填写的ip地址一样,请重新填写!</b>')
                    $(e).val("");
                    $(e).focus();
                    return false;
                }
                return true;
            }
        }

        function sumbitThForm(){
            var emonsNo,stationName,relRNC,stationBusIp,gatewayBusIp;
            emonsNo = $('#3g_emonsNo').val();
            stationNmae = $('#3g_stationName').val();
            relRNC = $('#3g_scdma_relRNC').val();
            stationBusIp = $('#3g_stationBusIp').val();
            gatewayBusIp = $('#3g_gatewayBusIp').val();
            if(emonsNo && stationNmae && relRNC && stationBusIp && gatewayBusIp){
                $("#thForm").submit();
                $("#thForm").attr('disabled','true');
            }else{
                showMsg();
            }
        }

    </script>
</head>

<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
        <li><a href="#">业务下发</a></li>
        <li><a href="#">设备下发</a></li>
    </ul>
</div>
<div id="usual1" class="usual">
    <div class="itab">
        <ul>
            <li></li>
            <li><a href="#tab1" <c:if test="${lssued.state == '1000000003'}">class='selected'</c:if> >4G基站业务下发</a></li>
            <li><a href="#tab2" <c:if test="${lssued.state == '1000000001'}">class='selected'</c:if>>3G基站业务下发</a></li>
        </ul>
    </div>
    <div id="tab1" class="tabson">
        <form action="${pageContext.request.contextPath}/tj/lssued/createFlow" method="post" id="generateForm">
            <input type="hidden" name="formNo" value="${object.formNo}" id="formNo"/>
            <input name="equipcode" type="hidden" value="${equipcode}" id="equipcode"/>
            <input name="state" type="hidden" value="1000000003" id="state"/>
            <input type="hidden" name="taskId" value="${taskId}" id="taskId"/>
            <ul class="forminfo">
                <li></li>
                <li><label>电子运维工单编号:<b>*</b></label><input name="emonsNo" type="text" class="dfinput" id="emonsNo" value="${lssued.emonsNo}"/><span id="spanMsg"></span></li>
                <li><label>基站名称<b>*</b></label><input name="stationName" type="text" class="dfinput" id="stationName" value="${lssued.stationName}"/></li>
                <li>
                    <label>基站类型<b>*</b></label>
                    <div class="vocation">
                        <select name="equipmentStatus" id="equipmentStatus" class="select1">
                            <option value="FDD" <c:if test="${lssued.equipmentStatus=='FDD'}">selected</c:if>>FDD</option>
                            <option value="TDD" <c:if test="${lssued.equipmentStatus=='TDD'}">selected</c:if>>TDD</option>
                            <option value="UL" <c:if test="${lssued.equipmentStatus=='UL'}">selected</c:if>>UL</option>
                            <option value="GL" <c:if test="${lssued.equipmentStatus=='GL'}">selected</c:if>>GL</option>
                            <option value="NB" <c:if test="${lssued.equipmentStatus=='NB'}">selected</c:if>>NB</option>
                        </select>
                    </div>
                </li>
                <li>
                    <label>时钟提取方式<b>*</b></label>
                    <div class="vocation">
                        <select name="clockExtraction" id="clockExtraction" class="select1">
                            <option value="GPS" <c:if test="${lssued.clockExtraction=='GPS'}">selected</c:if>>GPS</option>
                            <option value="以太网同步" <c:if test="${lssued.clockExtraction=='以太网同步'}">selected</c:if>>以太网同步</option>
                        </select>
                    </div>
                </li>
                <li>
                    <label>无线BBU厂家<b>*</b></label>
                    <div class="vocation">
                        <select name="dhcpRelay" id="dhcpRelay"  class="select1">
                            <option value="10.100.66.68" <c:if test="${lssued.dhcpRelay=='10.100.66.68'}">selected</c:if>>大唐</option>
                            <option value="10.100.65.65" <c:if test="${lssued.dhcpRelay=='10.100.65.65'}">selected</c:if>>中兴</option>
                            <option value="10.100.64.65" <c:if test="${lssued.dhcpRelay=='10.100.64.65'}">selected</c:if>>华为</option>
                            <option value="6.96.4.5" <c:if test="${lssued.dhcpRelay=='6.96.4.5'}">selected</c:if>>电信-中兴基站(宝坻,汉沽,津南,大港)</option>
                            <option value="6.96.4.6" <c:if test="${lssued.dhcpRelay=='6.96.4.6'}">selected</c:if>>电信-中兴基站(宁河,蓟县,静海)</option>
                            <option value="6.96.4.7" <c:if test="${lssued.dhcpRelay=='6.96.4.7'}">selected</c:if>>电信-中兴基站(武清,北辰)</option>
                            <option value="6.96.1.68" <c:if test="${lssued.dhcpRelay=='6.96.1.68'}">selected</c:if>>电信-华为基站</option>
                        </select>
                    </div>
                </li>
                <div id="4gMsg">
                    <li>
                        <label>业务类型<b>*</b></label>
                        <div class="vocation">
                            <select name="equipmentState" id="equipmentState" class="select1">
                                <option value="1" <c:if test="${lssued.equipmentState=='1'}">selected</c:if>>宏站</option>
                                <option value="2" <c:if test="${lssued.equipmentState=='2'}">selected</c:if>>室分</option>
                            </select>
                        </div>
                    </li>
                    <li><label>基站侧业务IP地址/子网掩码(4G)<b>*</b></label><input name="stationBusIp" type="text" class="dfinput" id="stationBusIp" value="${lssued.stationBusIp}" onblur="checkAll(this)"/><span>输入格式如:10.3.64.128/30</span></li>
                    <li><label>网关IP业务地址/子网掩码(4G)<b>*</b></label><input name="gatewayBusIp" type="text" class="dfinput" id="gatewayBusIp" value="${lssued.gatewayBusIp}" onblur="checkAll(this)"/><span>输入格式如:10.3.64.128/30</span></li>
                    <li><label>基站侧管理IP地址/子网掩码(4G)<b>*</b></label><input name="stationManIp" type="text" class="dfinput" id="stationManIp" value="${lssued.stationManIp}" onblur="checkAll(this)"/><span>输入格式如:10.3.64.128/30</span></li>
                    <li><label>网关侧管理IP地址/子网掩码(4G)<b>*</b></label><input name="gatewayManIp" type="text" class="dfinput" id="gatewayManIp" value="${lssued.gatewayManIp}" onblur="checkAll(this)"/><span>输入格式如:10.3.64.128/30</span></li>
                </div>
                <div id="3gMsg">
                    <li><label><b>以下为UL信息:</b></label><input type="button" value="显示4G" id="showLte1" class="btn btn-primary"></input><input type="button" value="隐藏4G" id="hideLte1" class="btn btn-primary"></input></li>
                    <li><label>基站侧业务IP地址/子网掩码(3G)<b>*</b></label><input name="scdma_stationBusIp" type="text" class="dfinput" id="scdma_stationBusIp" value="${lssued.scdma_stationBusIp}" onblur="checkAll(this)"/><span>输入格式如:10.3.64.128/30</span></li>
                    <li><label>网关IP业务地址/子网掩码(3G)<b>*</b></label><input name="scdma_gatewayBusIp" type="text" class="dfinput" id="scdma_gatewayBusIp" value="${lssued.scdma_gatewayBusIp}" onblur="checkAll(this)"/><span>输入格式如:10.3.64.128/30</span></li>
                    <li><label>中继IP/子网掩码<b>*</b></label><input name="scdma_zjIp" type="text" class="dfinput" id="scdma_zjIp" value="${lssued.scdma_zjIp}" /><span>无线中兴不填此列</span></li>
                    <li><label>IP-RAN核心侧占用端口<b>*</b></label><input name="scdma_equipPort" type="text" class="dfinput" id="scdma_equipPort" value="${lssued.scdma_equipPort}" /></li>
                    <li><label>基站归属RNC<b>*</b></label><input name="scdma_relRNC" type="text" class="dfinput" id="scdma_relRNC" value="${lssued.scdma_relRNC}" /></li>
                </div>
                <div id="2gMsg">
                    <li><label><b>以下为GL信息:</b></label><input type="button" value="添加4G" id="showLte" class="btn btn-primary"></input><input type="button" value="隐藏4G" id="hideLte" class="btn btn-primary"></input></li>
                    <li><label>基站侧业务IP地址/子网掩码(2G)<b>*</b></label><input name="gsm_stationBusIp" type="text" class="dfinput" id="gsm_stationBusIp" value="${lssued.gsm_stationBusIp}" onblur="checkAll(this)"/><span>输入格式如:10.3.64.128/30</span></li>
                    <li><label>网关IP业务地址/子网掩码(2G)<b>*</b></label><input name="gsm_gatewayBusIp" type="text" class="dfinput" id="gsm_gatewayBusIp" value="${lssued.gsm_gatewayBusIp}" onblur="checkAll(this)"/><span>输入格式如:10.3.64.128/30</span></li>
                    <li><label>中继IP/子网掩码<b>*</b></label><input name="gsm_zjIp" type="text" class="dfinput" id="gsm_zjIp" value="${lssued.gsm_zjIp}"/><span>无线中兴不填此列</span></li>
                    <li><label>IP-RAN核心侧占用端口<b>*</b></label><input name="gsm_equipPort" type="text" class="dfinput" id="gsm_equipPort" value="${lssued.gsm_equipPort}" /></li>
                    <li><label>基站归属BSC<b>*</b></label><input name="gsm_relBSC" type="text" class="dfinput" id="gsm_relBSC" value="${lssued.gsm_relBSC}" /></li>
                </div>
                <div id="nbMsg">
                    <li><label><b>以下为NB信息:</b></label><input type="button" value="添加GL" id="showGl" class="btn btn-primary"></input><input type="button" value="隐藏GL" id="hideGl" class="btn btn-primary"></input></li>
                    <li><label>基站侧业务IP地址/子网掩码(NB)<b>*</b></label><input name="nb_stationBusIp" type="text" class="dfinput" id="nb_stationBusIp" value="${lssued.nb_stationBusIp}" onblur="checkAll(this)"/><span>输入格式如:10.3.64.128/30</span></li>
                    <li><label>网关IP业务地址/子网掩码(NB)<b>*</b></label><input name="nb_gatewayBusIp" type="text" class="dfinput" id="nb_gatewayBusIp" value="${lssued.nb_gatewayBusIp}" onblur="checkAll(this)"/><span>输入格式如:10.3.64.128/30</span></li>
                </div>
                <li><label>备注</label><textarea name="remark" cols="2" rows="" class="textinput">${lssued.remark}</textarea></li>
                <c:if test="${lssued.reason != null}">
                    <li><label>设备维护中心驳回原因:</label><input name="reason" type="text" class="dfinput" value="${lssued.reason}" readonly/></li>
                </c:if>
                <c:if test="${lssued.reasonCs != null}">
                    <li><label>资源调度工位(传输)驳回原因:</label><input name="reasonCs" type="text" class="dfinput" value="${lssued.reasonCs}" readonly/></li>
                </c:if>
                <li><label>&nbsp;</label><input name="" type="button" class="btn btn-primary" value="创 建 调 单" onclick="sumbitFrom()"/></li>
            </ul>
        </form>
    </div>
    <div id="tab2" class="tabson">
        <form action="${pageContext.request.contextPath}/tj/lssued/createFlow" method="post" id=thForm>
            <input type="hidden" name="formNo" value="${object.formNo}"/>
            <input name="state" type="hidden" value="1000000001"/>
            <input name="equipcode" type="hidden" value="${equipcode}"/>
            <input type="hidden" name="taskId" value="${taskId}"/>
            <ul class="forminfo">
                <li></li>
                <li><label>电子运维工单编号:<b>*</b></label><input name="emonsNo" type="text" class="dfinput" id="3g_emonsNo" value="${lssued.emonsNo}"/></li>
                <li><label>基站名称<b>*</b></label><input name="stationName" type="text" class="dfinput" id="3g_stationName" value="${lssued.stationName}"/></li>
                <li>
                    <label>无线BBU厂家<b>*</b></label>
                    <div class="vocation">
                        <select name="dhcpRelay" id="3g_dhcpRelay"  class="select1">
                            <option value="10.100.66.68" <c:if test="${lssued.dhcpRelay=='10.100.66.68'}">selected</c:if>>大唐</option>
                            <option value="10.100.65.65" <c:if test="${lssued.dhcpRelay=='10.100.65.65'}">selected</c:if>>中兴</option>
                            <option value="10.100.64.65" <c:if test="${lssued.dhcpRelay=='10.100.64.65'}">selected</c:if>>华为</option>
                            <option value="6.96.4.5" <c:if test="${lssued.dhcpRelay=='6.96.4.5'}">selected</c:if>>电信-中兴基站(宝坻,汉沽,津南,大港)</option>
                            <option value="6.96.4.6" <c:if test="${lssued.dhcpRelay=='6.96.4.6'}">selected</c:if>>电信-中兴基站(宁河,蓟县,静海)</option>
                            <option value="6.96.4.7" <c:if test="${lssued.dhcpRelay=='6.96.4.7'}">selected</c:if>>电信-中兴基站(武清,北辰)</option>
                            <option value="6.96.1.68" <c:if test="${lssued.dhcpRelay=='6.96.1.68'}">selected</c:if>>电信-华为基站</option>
                        </select>
                    </div>
                </li>
                <li>
                    <label>业务类型<b>*</b></label>
                    <div class="vocation">
                        <select name="equipmentState" id="3g_equipmentState" class="select1">
                            <option value="1" <c:if test="${lssued.equipmentState=='1'}">selected</c:if>>宏站</option>
                            <option value="2" <c:if test="${lssued.equipmentState=='2'}">selected</c:if>>室分</option>
                        </select>
                    </div>
                </li>
                <li><label>基站侧IP地址/子网掩码<b>*</b></label><input name="scdma_stationBusIp" type="text" class="dfinput" id="3g_stationBusIp" value="${lssued.scdma_stationBusIp}" onblur="checkAll(this)"/><span>输入格式如:10.3.64.128/30</span></li>
                <li><label>网关IP地址/子网掩码<b>*</b></label><input name="scdma_gatewayBusIp" type="text" class="dfinput" id="3g_gatewayBusIp" value="${lssued.scdma_gatewayBusIp}" onblur="checkAll(this)"/><span>输入格式如:10.3.64.128/30</span></li>
                <li><label>基站归属RNC<b>*</b></label><input name="scdma_relRNC" type="text" class="dfinput" id="3g_scdma_relRNC" value="${lssued.scdma_relRNC}"/></li>
                <li><label>备注</label><textarea name="remark" cols="2" rows="" class="textinput">${lssued.remark}</textarea></li>
                <c:if test="${lssued.reason != null}">
                    <li><label>设备维护中心驳回原因:</label><input name="reason" type="text" class="dfinput" value="${lssued.reason}" readonly/></li>
                </c:if>
                <c:if test="${lssued.reasonCs != null}">
                    <li><label>资源调度工位(传输)驳回原因:</label><input name="reasonCs" type="text" class="dfinput" value="${lssued.reasonCs}" readonly/></li>
                </c:if>
                <li><label>&nbsp;</label><input name="" type="button" class="btn btn-primary" value="创 建 调 单" onclick="sumbitThForm()"/></li>
            </ul>
        </form>
    </div>
</div>
</div>
<script type="text/javascript">
    $("#usual1 ul").idTabs();
</script>
<script type="text/javascript">
    $('.tablelist tbody tr:odd').addClass('odd');
</script>
</body>
</html>
