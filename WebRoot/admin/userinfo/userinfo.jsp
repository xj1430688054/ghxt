<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
	<meta http-equiv="description" content="This is my page"/>
	<link href="<%=path %>/css/base.css" rel="stylesheet" type="text/css" />
    
    <script language="JavaScript" type="text/javascript">
        function check2()
	    {
	        if(document.form1.userName.value=="")
	        {
	            alert("请输入账号");
	            return false;
	        }
	        if(document.form1.userPw.value=="")
	        {
	            alert("请输入密码");
	            return false;
	        }
	        document.form1.submit();
	    }
    </script>
    
  </head>
  
  <body>
	
						    <form action="<%=path %>/userEdit.action" name="form1" method="post">
								 <table width="98%" border="0" align="right" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
									<tr>
										<td width="10%" height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
											账号：
										</td>
										<td width="90%" bgcolor="#FFFFFF">
											&nbsp;
											<input readonly="readonly" type="text" name="userName" style="width: 250px;" value="${sessionScope.user.userName }"/>
										    (账号只读)
										</td>
									</tr>
									<tr>
										<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
											密码：
										</td>
										<td bgcolor="#FFFFFF">
											&nbsp;
											<input type="password" name="userPw" style="width: 250px;" value="${sessionScope.user.userPw }"/>
										</td>
									</tr>
									<tr>
										<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
											姓名：
										</td>
										<td bgcolor="#FFFFFF">
											&nbsp;
											<input type="text" name="userRealname" style="width: 250px;" value="${sessionScope.user.userRealname }"/>
										</td>
									</tr>
									<tr>
										<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
											住址：
										</td>
										<td bgcolor="#FFFFFF">
											&nbsp;
											<input type="text" name="userAddress" size="50" style="width: 250px;" value="${sessionScope.user.userAddress }"/>
										</td>
									</tr>
									<tr>
										<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
											电话：
										</td>
										<td bgcolor="#FFFFFF">
											&nbsp;
											<input type="text" name="userTel" style="width: 250px;" value="${sessionScope.user.userTel }"/>
										</td>
									</tr>
									<tr>
										<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
											身份证号：
										</td>
										<td bgcolor="#FFFFFF">
											&nbsp;
											<input type="text" name="userEmail" style="width: 250px;" value="${sessionScope.user.userEmail }"/>
										</td>
									</tr>
									<tr>
										<td height="30" align="right" bgcolor="#F9F9F9">
											&nbsp;
										</td>
										<td bgcolor="#FFFFFF">
											&nbsp;
											<input type="button" value="修改" onclick="check2();" />
											<input type="reset" value="重置"/>
											<input type="hidden" name="userId" value="${sessionScope.user.userId }"/>
										</td>
									</tr>
								</table>
							</form>
						
  </body>
</html>
