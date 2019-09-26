<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page isELIgnored="false" %>

<%
	String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
	<meta http-equiv="description" content="This is my page" />

	<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />

	<script language="javascript">
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
		function isEmail(str)
		{
			var reg = /^(\w)+(\.\w+)*@(\w)+((\.\w+)+)$/;
			return reg.test(str);
		}
	</script>
</head>

<body leftmargin="8" topmargin="8" background='<%=path %>/images/allbg.gif'>
<form action="<%=path %>/userAdd.action" name="form1" method="post">
	<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1">
		<tr>
			<td width="10%" height="30" align="left" bgcolor="#F9F9F9" style="font-size: 11px;">
				用户添加：
			</td>

		</tr>
	</table>
	<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1">
		<tr>
			<td width="10%" height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
				账号：
			</td>
			<td width="90%"  bgcolor="#FFFFFF">
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

					<%--<option value="2">普通用户</option>--%>
					<%--<option value="1">科室管理员</option>--%>
					<option value="0">管理员</option>
					<!--  <option value="3">班干部</option> -->
					<!-- <option value="4">信息安全</option>
                    <option value="5">大数据</option>
                    <option value="6">HTML5</option>
                    <option value="7">SAP</option>
                    <option value="8">UI</option>
                    <option value="9">移动互联网</option> -->
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
</body>
</html>
