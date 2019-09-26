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
    
    <script type='text/javascript' src='<%=path %>/dwr/interface/loginService.js'></script>
	<script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
	<script type='text/javascript' src='<%=path %>/dwr/util.js'></script>
    
    <script language="JavaScript" type="text/javascript">
        function c()
        {
             if(document.formAdd.keshiId.value=="")
             {
                 alert("请选择所在科室");
                 return false;
             }
             
             document.formAdd.submit();
        }
        
           function keshiAll()
           {
                   document.getElementById("indicator").style.display="block";
                   loginService.keshiAll(callback);
               
           }
           
           function callback(data)
           {
               document.getElementById("indicator").style.display="none";
               DWRUtil.addOptions("keshiId",data,"keshiId","keshiAnme");
           }
           
           function init()
           {
              loginService.yiyuanAll(callback1);
              keshiAll();
           }
           function callback1(data)
           {
               DWRUtil.addOptions("yiyuanId",data,"id","mingcheng");
           }
    </script>
    
  </head>
  
<body onload="init()">
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
	         <span style="float:left;font-family: 微软雅黑;font-size: 13px;margin-top: 3px;margin-left: 10px;color: white">医生</span>
			 <span style="float:right;font-family: 微软雅黑;font-size: 14px;margin-top: 3px;">&nbsp;</span>
	      </div> --%>
	      <div style="height: 100%;border:1px solid white">
	          <form action="<%=path %>/userManaType1ByBeizhuAndBeizhu2.action" name="formAdd" method="post">
								<table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC">
									<tr height="40">
										<td width="10%" bgcolor="#FFFFFF" align="right">
											医院：										    
										</td>
										<td width="90%" bgcolor="#FFFFFF" align="left">
											<select name="beizhu" id="yiyuanId" style="width: 235px;">
					                        </select>
										</td>
									</tr>
									<tr height="40">
										<td width="10%" bgcolor="#FFFFFF" align="right">
											科室：<img id="indicator" src="<%=path %>/img/loading.gif" style="display:none"/>									    
										</td>
										<td width="90%" bgcolor="#FFFFFF" align="left">
											<select name="beizhu2" id="keshiId" style="width: 235px;">
					                        </select>
										</td>
									</tr>
									<%--<tr height="40">
										<td width="10%" bgcolor="#FFFFFF" align="right">
											值班时间：										    
										</td>
										<td width="90%" bgcolor="#FFFFFF" align="left">
											<select name="leixing" id="leixing" style="width: 235px;">
								                 <option value="周一">周一</option>
								                 <option value="周二">周二</option>
								                 <option value="周三">周三</option>
								                 <option value="周四">周四</option>
								                 <option value="周五">周五</option>
								                 <option value="周六">周六</option>
								                 <option value="周日">周日</option>
								            </select>
										</td>
									</tr>
									<tr height="40">
										<td width="10%" bgcolor="#FFFFFF" align="right">
											姓名：										    
										</td>
										<td width="90%" bgcolor="#FFFFFF" align="left">
											<input type="text" name="xingming" style="width: 235px;"/>
										</td>
									</tr>--%>
									<tr height="40">
									   <td width="10%" bgcolor="#FFFFFF" align="right">
									   </td>
									   <td width="90%" bgcolor="#FFFFFF" align="left">
									      <input type="button" value="查询" onclick="c()" style="width: 70px;"/>&nbsp; 
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
