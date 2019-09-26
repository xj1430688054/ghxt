<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
  String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
	  <script type="text/javascript">
            function gerenzhuye()
			{
			    var targetWinUrl="<%=path %>/admin/index.jsp";
				var targetWinName="newWin";
				var features="width="+screen.width+" ,height="+screen.height+" ,toolbar=yes, top=0, left=0, menubar=yes, scrollbars=yes, resizable=yes,location=no, status=yes";
				var new_win=window.open(targetWinUrl,targetWinName,features);
			}
            function userLogout()
            {
                loginService.userLogout();
                var url="<%=path %>/qiantai/default.jsp";
                window.location.href=url;
            }
      </script>
  </head>
  
<body>
<div class="wt1002">
    	<ul id="ulMenu">
            <li><a href="<%=path %>/index.action">系统首页</a></li>
            <li><a href="<%=path %>/qiantai/chaxun/chaxunPre.jsp">医生查询</a></li>
            <c:if test="${sessionScope.userType !=2 }">
            <li><a href="<%=path %>/qiantai/userinfo/userReg.jsp">用户注册</a></li>
            <li><a href="<%=path %>/qiantai/userinfo/userLogin.jsp">用户登陆</a></li>
             <li><a href="<%=path %>/login.jsp" style="color: white;">后台登陆</a></li>
            </c:if>
            
            <c:if test="${sessionScope.userType ==2 }">
            <li><a href="#">欢迎你：${sessionScope.user.loginname }</a></li>
            <li><a href="<%=path %>/userLogout.action">注销退出</a></li>
            <li><a href="#" onclick="gerenzhuye()">管理中心</a></li>
            </c:if>
        </ul>    
</div>
</body>
</html>
