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
		function check1()
		{
			if(document.form1.loginname.value=="")
			{
				alert("请输入账号");
				return false;
			}
			if(document.form1.loginpw.value=="")
			{
				alert("请输入密码");
				return false;
			}
			if(document.form1.xingming.value=="")
			{
				alert("请输入姓名");
				return false;
			}
			document.form1.submit();
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
	         <span style="float:left;font-family: 微软雅黑;font-size: 13px;margin-top: 3px;margin-left: 10px;color: white">用户注册</span>
			 <span style="float:right;font-family: 微软雅黑;font-size: 14px;margin-top: 3px;">&nbsp;</span>
	      </div> --%>
	      <div style="height: 100%;border:1px solid white">
			  <form action="<%=path %>/userReg.action" name="form1" method="post">
				  <table width="98%" border="0" align="center" cellpadding="0" cellspacing="1">
					  <tr>
						  <td width="10%" height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
							  账号：
						  </td>
						  <td width="90%" bgcolor="#FFFFFF">
							  &nbsp;
							  <input type="text" name="loginname" style="width: 260px;"/>
						  </td>
					  </tr>
					  <tr>
						  <td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
							  密码：
						  </td>
						  <td bgcolor="#FFFFFF">
							  &nbsp;
							  <input type="password" name="loginpw" style="width: 260px;"/>
						  </td>
					  </tr>
					  <tr>
						  <td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
							  姓名：
						  </td>
						  <td bgcolor="#FFFFFF">
							  &nbsp;
							  <input type="text" name="xingming" style="width: 260px;"/>
						  </td>
					  </tr>
					  <tr>
						  <td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
							  性别：
						  </td>
						  <td bgcolor="#FFFFFF">
							  &nbsp;
							  <input type="radio" name="xingbie" value="男" style="border: 0px;" checked="checked"/>男
							  &nbsp;&nbsp;&nbsp;&nbsp;
							  <input type="radio" name="xingbie" value="女" style="border: 0px;" checked="checked"/>女
						  </td>
					  </tr>
					  <tr>
						  <td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
							  年龄：
						  </td>
						  <td bgcolor="#FFFFFF">
							  &nbsp;
							  <input type="text" name="nianling" style="width: 260px;" onkeyup="value=value.replace(/[^\d]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>
						  </td>
					  </tr>
					  <tr>
						  <td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
							  住址：
						  </td>
						  <td bgcolor="#FFFFFF">
							  &nbsp;
							  <input type="text" name="address" style="width: 260px;"/>
						  </td>
					  </tr>
					  <tr>
						  <td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
							  电话：
						  </td>
						  <td bgcolor="#FFFFFF">
							  &nbsp;
							  <input type="text" name="dianhua" style="width: 260px;"/>
						  </td>
					  </tr>
					  <tr>
						  <td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
							  类型：
						  </td>
						  <td bgcolor="#FFFFFF">
							  &nbsp;
							  <select name="type" style="width: 260px;">
								  <option value="2">普通用户</option>
								  <%-- <option value="1">发布者</option>--%>
							  </select>
						  </td>
					  </tr>
					  <tr>
						  <td height="30" align="right" bgcolor="#F9F9F9">
							  &nbsp;
						  </td>
						  <td bgcolor="#FFFFFF">
							  &nbsp;
							  <input type="button" value="确定" onclick="check1();" style="width: 70px;"/>
							  <input type="reset" value="重置" style="width: 70px;"/>
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
