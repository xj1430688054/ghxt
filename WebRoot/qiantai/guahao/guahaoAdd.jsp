<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head lang="en">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
    <link href="<%=path %>/css/main.css" rel="stylesheet" />
    <style type="text/css">
		.iw_poi_title {color:#CC5522;font-size:14px;font-weight:bold;overflow:hidden;padding-right:13px;white-space:nowrap}
		.iw_poi_content {font:12px arial,sans-serif;overflow:visible;padding-top:4px;white-space:-moz-pre-wrap;word-wrap:break-word}
	</style>
    
    <link rel="stylesheet" href="<%=path %>/jquery/ui.datepicker.css" type="text/css" media="screen"  charset="utf-8" />
	
	<script src="<%=path %>/jquery/jquery-1.2.6.js" type="text/javascript" charset="utf-8"></script>	
	<script src="<%=path %>/jquery/ui.datepicker.js" type="text/javascript" charset="utf-8"></script>	
	<script src="<%=path %>/jquery/ui.datepicker-zh-CN.js" type="text/javascript" charset="utf-8"></script>	
   
    <script type="text/javascript">
            jQuery(function($){
			$('#datepicker').datepicker({
					yearRange: '1900:2099', //取值范围.
					showOn: 'both', //输入框和图片按钮都可以使用日历控件。
					buttonImage: '<%=path %>/jquery/calendar.gif', //日历控件的按钮
					buttonImageOnly: true,
					showButtonPanel: true
				});	
				
			});
			
			function cx()
            {
                
                    if(document.form2.riqi.value=="")
	                {
	                    alert("请输入挂号日期");
	                    return false;
	                }
	                
	                
	                var jinri="<%=new SimpleDateFormat("yyyy-MM-dd").format(new Date())%>";
			        var guahaori=document.form2.riqi.value;
			        
			        if(Date.parse(jinri.replace("-","/")) >= Date.parse(guahaori.replace("-","/")))
				    {
					    alert("挂号日期只能是今日以后的日期");
					    return false;
				    }
				    
				    var s=DateDiff(jinri,guahaori)
				    if(s>7)
				    {
				        alert("只能挂号未来7天的日期");
					    return false;
				    }
	                
	                
	                if(document.form2.jibing.value=="")
	                {
	                    alert("请输入所患疾病");
	                    return false;
	                }
	                if(document.form2.xingming.value=="")
	                {
	                    alert("请输入你的姓名");
	                    return false;
	                }
	                document.form2.submit();
               
            }
			
			function lala(){
			var a=document.getElementById("datepicker").value;
			var b=document.getElementById("muid").value;
			var c=document.getElementById("jibing").value;
			var myName="<%=session.getAttribute("MYNAME")%>"
			   $.ajax({
   					type: "GET",
   					url: "<%=path %>/guahaoCha.action",
   					data: "shijian="+a+"&muid="+b+"&jibing="+c,
   					success: function(msg){
     				window.location.reload();
     				console.log(2)
     				$("#datepicker").val(b);
   				}
				});
				
			}
			
			function DateDiff(sDate1, sDate2)
			{  
				    var aDate, oDate1, oDate2, iDays 
				    aDate = sDate1.split("-"); 
				    oDate1 = new Date(aDate[1] + '-' + aDate[2] + '-' + aDate[0]);  //转换为mm-dd-yyyy格式 
				    aDate = sDate2.split("-"); 
				    oDate2 = new Date(aDate[1] + '-' + aDate[2] + '-' + aDate[0]); 
				    iDays = parseInt(Math.abs(oDate1 - oDate2) / 1000 / 60 / 60 /24);  //把相差的毫秒数转换为天数 
				    //alert(iDays);
				    return iDays ; 
			} 
      </script>
    
  </head>
  
<body>
<div class="top">
	<jsp:include flush="true" page="/qiantai/top1.jsp"></jsp:include>
</div>


<div class="menu">
    <jsp:include flush="true" page="/qiantai/top2.jsp"></jsp:include>
</div>

<!-- <div class="wt1002">
	<div id="full-screen-slider">
       dff
    </div>
</div> -->

<div class="wt1002 fwmain">
	<div class="fwmain_nright r mTop10">
    	<div style="width:760px;margin-top: 1px;padding-bottom:10px;margin-left: -15px;">
	      <%-- <div style="height:26px;background:url(<%=path %>/images/guang.jpg);font-size: 14px;color:#de3237;">
	         <span style="float:left;font-family: 微软雅黑;font-size: 13px;margin-top: 3px;margin-left: 10px;color: white">挂号</span>
			 <span style="float:right;font-family: 微软雅黑;font-size: 14px;margin-top: 3px;">&nbsp;</span>
	      </div> --%>
	      <div style="height: 100%;border:1px solid #FFAF60">
	          <form action="<%=path %>/guahaoAdd.action" name="form2" method="post">
				               <table align="left" border="0" cellpadding="9" cellspacing="9">
									<tr align='center'>
										<td style="width: 60px;" align="left">
											挂号日期：										    
										</td>
										<td align="left">
											<input name="riqi" type="text" style="width: 200px;" id="datepicker" SelectionChanged="lala()"readonly="readonly" value="${riqi} "/>
											<button onclick="lala()">开始查询改日期的可预约号</button>
										</td>
									</tr>
									<tr align='center'>
										<td style="width: 60px;" align="left">
											选择时间：										    
										</td>
										<td align="left">
											<select name="shijian" id="shijian" class="form-control" style="width: 235px;" >
											<option value="" >--请选择--</option>
  											<c:forEach var="map" items="${map}"> 
        										<option value="${map.key}" >${map.value}</option>
      										</c:forEach>
									</select>
										</td>
									</tr>
										<tr align='center'>
										<td style="width: 60px;" align="left">
											所患疾病：										    
										</td>
										<td align="left">
											<input id="jibing" name="jibing" type="text"   style="width: 200px;"/>
										</td>
										</tr>
									
								
									<tr align='center'>
										<td style="width: 60px;" align="left">
											你的姓名：										    
										</td>
										<td align="left">
											<input name="xingming" type="text" style="width: 200px;"/>
										    
										</td>
									</tr>
									<tr align='center'>
										<td style="width: 60px;" align="left">
											联系方式：										    
										</td>
										<td align="left">
											<input name="lianxi" type="text" style="width: 200px;"/>
										    
										</td>
									</tr>
									<tr align='center'>
									   <td style="width: 60px;" align="left"></td>
									   <td align="left">
									      <input type="hidden" name="muid" id="muid" value="<%=request.getParameter("muid") %>">
									      <input type="button" value="确定" onclick="cx()" style="width: 70px;"/>&nbsp; 
									      <input type="reset" value="重置" style="width: 70px;"/>&nbsp;	
									   </td>
									</tr>
							  </table>
				            </form>
	      </div>
	 </div>
    </div>
    <div class="fwmain_nleft l mTop10">
    	<jsp:include flush="true" page="/qiantai/left.jsp"></jsp:include>
    </div>
    <div class="clear"></div>
</div>
<div class="clear"></div>



<div class="foot">
    <jsp:include flush="true" page="/qiantai/down.jsp"></jsp:include>
</div>

</body>
</html>
