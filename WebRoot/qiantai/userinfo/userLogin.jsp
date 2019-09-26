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
	  <script type='text/javascript' src='<%=path %>/dwr/interface/loginService.js'></script>
	  <script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
	  <script type='text/javascript' src='<%=path %>/dwr/util.js'></script>
    <style type="text/css">
		.iw_poi_title {color:#CC5522;font-size:14px;font-weight:bold;overflow:hidden;padding-right:13px;white-space:nowrap}
		.iw_poi_content {font:12px arial,sans-serif;overflow:visible;padding-top:4px;white-space:-moz-pre-wrap;word-wrap:break-word}
	</style>
    
    <script type="text/javascript">
            function login()
	        {
	           if(document.userLogin.loginname.value=="")
	           {
	               alert("请输入用户名");
	               return;
	           }
	           if(document.userLogin.loginpw.value=="")
	           {
	               alert("请输入密码");
	               return;
	           }
				//document.getElementById("indicator").style.display="block";
				loginService.login(document.userLogin.loginname.value,document.userLogin.loginpw.value,1,callback);
	        }

			function callback(data)
			{
				//document.getElementById("indicator").style.display="none";

				if(data=="no")
				{
					alert("账号或密码错误");
					var url="<%=path %>/qiantai/huiyuan/huiyuanLogin.jsp";
					window.location.href=url;
				}
				if(data!="no")//返回的data就是用户的id
				{
					alert("通过验证,登录成功");
					var url="<%=path %>/qiantai/default.jsp";
					window.location.href=url;
				}
			}

	        function gerenzhuye()
			{
			    var targetWinUrl="<%=path %>/auser/index.jsp";
				var targetWinName="newWin";
				var features="width="+screen.width+" ,height="+screen.height+" ,toolbar=yes, top=0, left=0, menubar=yes, scrollbars=yes, resizable=yes,location=no, status=yes";
				var new_win=window.open(targetWinUrl,targetWinName,features);
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
	         <span style="float:left;font-family: 微软雅黑;font-size: 13px;margin-top: 3px;margin-left: 10px;color: white">1111</span>
			 <span style="float:right;font-family: 微软雅黑;font-size: 14px;margin-top: 3px;">&nbsp;</span>
	      </div> --%>
	      <div style="height: 100%;border:1px solid white">
	          <form action="<%=path %>/userLogin.action" name="userLogin" method="post">
								 <table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC">
									<!-- <tr bgcolor="#EEF4EA">
								        <td colspan="3" height="20"><span></span></td>
								    </tr> -->
									<tr height="30">
										<td width="10%" bgcolor="#FFFFFF" align="right">
											账号：
										</td>
										<td width="90%" bgcolor="#FFFFFF" align="left">
											&nbsp;
											<input type="text" name="loginname" style="width: 250px;"/>
										</td>
									</tr>
									<tr height="30">
										<td width="10%" bgcolor="#FFFFFF" align="right">
											密码：
										</td>
										<td width="90%" bgcolor="#FFFFFF" align="left">
											&nbsp;
											<input type="password" name="loginpw" style="width: 250px;" value="000000"/>(默认：000000)
										</td>
									</tr>
									<tr height="30">
										<td width="10%" bgcolor="#FFFFFF" align="right">
											&nbsp;
										</td>
										<td width="90%" bgcolor="#FFFFFF" align="left">
											&nbsp;
											<input type="button" value="确定" onclick="login();" style="width: 70px;"/>
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
