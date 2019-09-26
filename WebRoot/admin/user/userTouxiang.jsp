<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

	<script type="text/javascript" src="<%=path %>/js/popup.js"></script>
	<script type='text/javascript' src='<%=path %>/dwr/interface/loginService.js'></script>
	<script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
	<script type='text/javascript' src='<%=path %>/dwr/util.js'></script>

	<script language="javascript">
		function check()
		{


			if(document.formPw.touxiang.value =="")
			{
				alert("内容不能空");
				return ;
			}

			document.getElementById("indicator").style.display="block";
			loginService.userPwEdit(document.formPw.loginpw1.value,callback);
		}
		function callback(data)
		{
			document.getElementById("indicator").style.display="none";
			alert("修改成功");
		}

		function up()
		{
			var pop=new Popup({ contentType:1,isReloadOnClose:false,width:400,height:200});
			pop.setContent("contentUrl","<%=path %>/upload/upload.jsp");
			pop.setContent("title","文件上传");
			pop.build();
			pop.show();
		}
	</script>
</head>

<body leftmargin="2" topmargin="9" background='<%=path %>/images/allbg.gif'>
<form method="post" action="<%=path %>/userTouxiangSet.action" name="formPw">
	<table width="98%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px">
		<tr bgcolor="#EEF4EA">
			<td colspan="2" background="<%=path %>/images/wbg.gif" class='title'><span>&nbsp;</span></td>
		</tr>
		<tr bgcolor="#FFFFFF">
			<td width="10%" bgcolor="#FFFFFF" align="right">
				头像：
			</td>
			<td width="90%" bgcolor="#FFFFFF">
				<input type="text" name="touxiang" id="fujian" readonly="readonly" value="${sessionScope.user.touxiang }" style="width: 200px;"/>
				<input type="button" value="上传" onclick="up()"/>
				<%--<input type="text" value="${sessionScope.user.touxiang }" name="touxiang" style="width: 250px;" readonly="readonly"/>--%>
			</td>
		</tr>
		<tr bgcolor="#FFFFFF">
			<td width="10%" bgcolor="#FFFFFF" align="right">
				头像：
			</td>
			<td width="90%" bgcolor="#FFFFFF">
				<IMG border=0 align=absMiddle src="<%=path %>/${sessionScope.user.touxiang}" width=130 height=160></td>
			<%--<IMG border=0 src="<%=path %>/${user.touxiang}" width=173 height=200></A>	--%>
			<%--<input type="text" value="${sessionScope.user.touxiang }" name="touxiang" style="width: 250px;" readonly="readonly"/>--%>
			</td>
		</tr>
		<%--<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
			<td width="10%" bgcolor="#FFFFFF" align="right">
				头像：
			</td>
			<td width="90%" bgcolor="#FFFFFF" align="left">
				<input type="text" name="fujian" id="fujian" readonly="readonly" style="width: 200px;"/>
				<input type="button" value="上传" onclick="up()"/>
			</td>
		</tr>--%>
		<tr bgcolor="#FFFFFF">
			<td width="10%" bgcolor="#FFFFFF" align="right">
				&nbsp;
			</td>
			<td width="90%" bgcolor="#FFFFFF">
				<input type="hidden" name="id" value="${sessionScope.user.id }">
				<input type="submit" value="修改" onclick="check()"/>
				&nbsp;&nbsp;&nbsp;
				<input type="reset" value="重置"/>
				<img id="indicator" src="<%=path %>/images/loading.gif" alt="Loading..." style="display:none"/>
			</td>
		</tr>
	</table>
</form>
</body>
</html>
