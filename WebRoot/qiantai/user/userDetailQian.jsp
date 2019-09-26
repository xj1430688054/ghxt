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
    
    <script type="text/javascript">
        function cx(muid)
        {
            <c:if test="${sessionScope.userType !=2 }">
                alert("请先登录");
	        </c:if>
	        <c:if test="${sessionScope.userType ==2 }">
                var url="<%=path %>/qiantai/guahao/guahaoAdd.jsp?muid="+muid;
                window.location.href=url;
	        </c:if>
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
	         <span style="float:left;font-family: 微软雅黑;font-size: 13px;margin-top: 3px;margin-left: 10px;color: white">医生</span>
			 <span style="float:right;font-family: 微软雅黑;font-size: 14px;margin-top: 3px;">&nbsp;</span>
	      </div> --%>
	      <div style="height: 100%;border:1px solid #FFAF60">
	          <form action="<%=path %>/qiantai/guahao/guahaoAdd.jsp" name="formwww" method="post">
				              <TABLE class=main border=0 cellSpacing=0 cellPadding=0 height=115 style="margin-top: 10px;margin-left: 10px;">
					              <TR>
					                  <td valign="top">
					                      <fieldset style="width:160px; height: 200px;"><legend class="fieldtitle">专家照片</legend>
												<table class="bill" width="97%">
												    <tr>
												        <td><IMG border=0 align=absMiddle src="<%=path %>/${requestScope.user.touxiang}" width=130 height=160></td>
												    </tr>
												</table>
										  </fieldset>
					                  </td>
					                  <td></td>
					                  <td valign="top">
					                      <fieldset style="margin-left:5px;height: 100%;"><legend class="fieldtitle">个人信息</legend>
												<table class="bill" width="420" cellpadding="5" cellspacing="5">
												    <tr>
												        <td>姓名：${requestScope.user.xingming}</td>
												    </tr>
												    <tr>
												        <td>性别：${requestScope.user.xingbie}</td>
												    </tr>
												    <tr>
												        <td>年龄：${requestScope.user.nianling}</td>
												    </tr>
												    <tr>
												        <td>电话：${requestScope.user.dianhua}</td>
												    </tr>
												    <tr>
												        <td>类型：${requestScope.user.type}</td>
												    </tr>
												    <tr>
												        <td>医院：${requestScope.user.yiyuan.mingcheng}</td>
												    </tr>
												    <tr>
												        <td>科室：${requestScope.user.keshi.keshiAnme}</td>
												    </tr>
												     <tr>
												        <td>擅长：${requestScope.user.beizhu3}</td>
												    </tr>
												    
												    <tr>
												        <td>
												            <input type="button" value="挂号" style="width: 80px;" onclick="cx(${requestScope.user.id})"/>&nbsp; 
												        </td>
												    </tr>
												</table>
										  </fieldset>
					                  </td>
					              </TR>
				              </TABLE>
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
