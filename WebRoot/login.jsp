<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
   String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtm1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

  <head>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
	<meta http-equiv="description" content="This is my page"/>
	
	
    <style type="text/css">
        *{margin:0px; padding:0px;}
		body{font-size:12px; font-family:"宋体"; color:#555555;  }
		ul,ol,li{list-style-type:none;}
		a{text-decoration:none;}
		img{border:none;}
		html,body{
		    margin:0px;
		    height:100%;
		}
		body{
			width:90%;
			height:100%;
			margin:0;
			padding:0;
			
			background-size:cover;
			overflow:hidden;
		}
		.main-login{
			width:100%;
			height:150px;
			margin-left:auto;
			margin-right:auto;
			background:url(<%=path %>/images/bg4.gif);
			position:absolute; top:40%;
		}
		
		.login-content{
			width:400px;
			background:#fff;
			margin-top:-52px;
			margin-left:auto;
			margin-right:auto;
			border:2px solid #425f8c;
		}
		h2{
			text-align:center;
			height:50px; 
			line-height:50px;
			background:#eee;
		}
		.login-info{
			width:320px; 
			height:40px;
			margin-left:auto;
			margin-right:auto; 
			background:#ffffff;
			border: 2px solid #f0f7fb;
			margin-top:20px;
			border:2px solid #ddd;
		}
		.login-info span.user{
			float:left;
			width:40px; 
			height:30px;
			margin:5px auto 5px auto; 
			background:url(<%=path %>/images/icon-user.gif) no-repeat center center; 
			border-right:1px solid #a9a9a9
		}
		.login-info span.pwd{
			float:left;
			width:40px; 
			height:30px;
			margin:5px auto 5px auto; 
			background:url(<%=path %>/images/icon-pwd.png) no-repeat center center; 
			border-right:1px solid #a9a9a9
		}
		.login-input{
			width:257px; 
			line-height: 40px;
			height:40px;
			background:#ffffff;
			border:none;
			margin:0;
			padding:0;
			padding-left:20px;
		
		}
		.login-oper{
			width:325px; 
			height:40px;
			margin-left:auto;
			margin-right:auto; 
			margin-top:10px;
			
		}
		.login-btn{
			width:100px;
			height:30px;
			border:none;
			background:#056daa;
			color:#ffffff;
			margin-left:2px;
		
			
		}
		.login-reset{
			float:right;
			width:100px;
			height:30px;
			border:none;
			background:#7c7777;
			color:#ffffff;
			margin-right:2px;
		}
		
		.bottom{
			width:100%; 
			height:40px;
			line-height:40px;
			text-align:right;
			color:#ffffff;
			font-weight:bold;
			font-size:24px;
			margin-top:80px;
			padding-right:40px;
		}
    </style>
    
    
    <script type='text/javascript' src='<%=path %>/dwr/interface/loginService.js'></script>
    <script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
    <script type='text/javascript' src='<%=path %>/dwr/util.js'></script>
    
    <script language="javascript">
		function check1()
		{
			if(document.ThisForm.loginname.value=="")
			{
				alert("请输入用户名");
				document.ThisForm.loginname.focus();
				return false;
			}
			if(document.ThisForm.loginpw.value=="")
			{
				alert("请输入密码");
				document.ThisForm.loginpw.focus();
				return false;
			}
			//document.getElementById("indicator").style.display="block";
			loginService.login(document.ThisForm.loginname.value,document.ThisForm.loginpw.value,0,callback);
		}

		function callback(data)
		{
			//document.getElementById("indicator").style.display="none";
			if(data=="no")
			{
				alert("用户名或密码错误");
			}
			if(data=="yes")
			{
				alert("通过验证,系统登录成功");
				window.location.href="<%=path %>/loginSuccess.jsp";
			}
		}
	</script>
  </head>
  
<body>
<div class="main-login">
	<div class="login-content">	
	    <h2>后台登录</h2>
	
	    <form action="<%=path %>/admin/index.jsp" method="post" id="ThisForm" name="login-form">
		    <div class="login-info">
				<span class="user">&nbsp;</span>
				    <input name="loginname" type="text" class="login-input"/>
				</div>
		    <div class="login-info">
				<span class="pwd">&nbsp;</span>
				<input name="loginpw" type="password" class="login-input"/>
			</div>
			<%--<div class="login-info">
				<span class="pwd">&nbsp;</span>
				<input type="radio" name="leixing" value="0" checked="checked"/>管理员
				&nbsp;
				<input type="radio" name="leixing" value="1"/>医生
			</div>--%>
		    <div class="login-oper">
				<input name="" type="button" value="登 录" class="login-btn" style="margin-left: 50px;" onclick="check1()"/>
				<input name="" type="reset" value="重 置" class="login-btn"/>
				<img id="indicator" src="<%=path %>/img/loading.gif" style="display:none"/>
			</div>
	    </form>
    </div>
</div>   

</body>

</html>
