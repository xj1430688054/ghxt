<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
	<meta http-equiv="description" content="This is my page"/>

    <link href="<%=path %>/css/style.css" rel="stylesheet" type="text/css" />
	<script language="JavaScript" src="<%=path %>/js/jquery.js"></script>
	
	<script type="text/javascript">
		$(function(){	
			//导航切换
			$(".menuson .header").click(function(){
				var $parent = $(this).parent();
				$(".menuson>li.active").not($parent).removeClass("active open").find('.sub-menus').hide();
				
				$parent.addClass("active");
				if(!!$(this).next('.sub-menus').size()){
					if($parent.hasClass("open")){
						$parent.removeClass("open").find('.sub-menus').hide();
					}else{
						$parent.addClass("open").find('.sub-menus').show();	
					}
					
					
				}
			});
			
			// 三级菜单点击
			$('.sub-menus li').click(function(e) {
		        $(".sub-menus li.active").removeClass("active")
				$(this).addClass("active");
		    });
			
			$('.title').click(function(){
				var $ul = $(this).next('ul');
				$('dd').find('.menuson').slideUp();
				if($ul.is(':visible')){
					$(this).next('.menuson').slideUp();
				}else{
					$(this).next('.menuson').slideDown();
				}
			});
		})	
     </script>
  </head>
  
<body style="background:#fff3e1;">
	<div class="lefttop"><span></span>导航菜单</div>
    <dl class="leftmenu">
   
   
   
    <dd>
    <div class="title">
    <span><img src="<%=path %>/images/leftico02.png" /></span>修改我的信息
    </div>
    <ul class="menuson">
        <li><cite></cite><a href="<%=path %>/admin/userinfo/zhuanjiainfo.jsp" target="rightFrame">修改我的信息</a><i></i></li>
        </ul>     
    </dd> 
    
    
    
    
    
    <dd><div class="title"><span><img src="<%=path %>/images/leftico03.png" /></span>我的挂号信息</div>
    <ul class="menuson">
        <li><cite></cite><a href="<%=path %>/guahaoMana_zhuanjia.action" target="rightFrame">我的挂号信息</a><i></i></li>
    </ul>    
    </dd>  
    
    
    </dl>
</body>
</html>
