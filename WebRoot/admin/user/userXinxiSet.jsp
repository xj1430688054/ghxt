<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>


<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<base href="<%=basePath%>">

	<title>My JSP 'userXinxi.jsp' starting page</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
<form action="<%=path %>/userSet.action" name="form1" method="post">
	<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
		<tr>
			<td width="20%" height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
				用户名：
			</td>
			<td width="80%" bgcolor="#FFFFFF">
				&nbsp;
				<input type="text" name="loginname" id="loginname" readonly="readonly" value="${sessionScope.user.loginname }"/>
			</td>
		</tr>
		<tr>
			<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
				密 码：
			</td>
			<td bgcolor="#FFFFFF">
				&nbsp;
				<input type="password" name="loginpw" value="${sessionScope.user.loginpw }"/>
			</td>
		</tr>
		<tr>
			<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
				真实姓名：
			</td>
			<td bgcolor="#FFFFFF">
				&nbsp;
				<input type="text" name="xingming" value="${sessionScope.user.xingming }"/>
			</td>
		</tr>
		<tr>
			<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
				住址：
			</td>
			<td bgcolor="#FFFFFF">
				&nbsp;
				<input type="text" name="address" value="${sessionScope.user.address }"/>
			</td>
		</tr>

		<tr>
			<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
				联系方式：
			</td>
			<td bgcolor="#FFFFFF">
				&nbsp;
				<input type="text" name="dianhua" value="${sessionScope.user.dianhua }"/>
			</td>
		</tr>
		<tr>
			<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
				年龄：
			</td>
			<td bgcolor="#FFFFFF">
				&nbsp;
				<input type="text" name="nianling" value="${sessionScope.user.nianling }"/>
			</td>
		</tr>
		<%--<tr>
			<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
				余额：
			</td>
			<td bgcolor="#FFFFFF">
				&nbsp;
				<input type="text" name="" readonly="readonly" value="${sessionScope.user.money }"/>
				&lt;%&ndash;  <a href="<%=path %>/site/userinfo/userChongzhi.jsp"  >充值</a> &ndash;%&gt;
			</td>



		</tr>
		<tr>
			<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
				积分：
			</td>
			<td bgcolor="#FFFFFF">
				&nbsp;
				<input type="text" name="" readonly="readonly" value="${sessionScope.user.jifen }"/>
			</td>
		</tr>--%>
		<%-- <tr>
            <td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
                QQ：
            </td>
            <td bgcolor="#FFFFFF">
                &nbsp;
                <input type="text" name="qq" value="${sessionScope.user.qq }"/>
            </td>
        </tr> --%>
		<tr>
			<td height="30" align="right" bgcolor="#F9F9F9">
				&nbsp;
			</td>
			<td bgcolor="#FFFFFF">
				&nbsp;
				<input type="hidden" name="id" value="${sessionScope.user.id }">
				 <input type="submit" value="确定"/>
				 <input type="button" value="取消" onclick="closeOpen()"/>
			</td>
		</tr>
	</table>
</form>
</body>
</html>
