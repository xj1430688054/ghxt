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
        function shoucang(sTitle,sURL) 
		{ 
			try 
			{ 
			    window.external.addFavorite(sURL, sTitle); 
			} 
			catch (e) 
			{ 
				try 
				{ 
				    window.sidebar.addPanel(sTitle, sURL, ""); 
				} 
				catch (e) 
				{ 
				    alert("加入收藏失败，请使用Ctrl+D进行添加"); 
				} 
			} 
        } 
        
        
        function SetHome(obj,vrl)
        { 
			try
			{ 
			    obj.style.behavior='url(#default#homepage)';obj.setHomePage(vrl); 
			} 
			catch(e)
			{ 
			   if(window.netscape) 
			   { 
					try 
					{ 
					    netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect"); 
					} 
					catch (e) 
					{ 
					     alert("此操作被浏览器拒绝！\n请在浏览器地址栏输入“about:config”并回车\n然后将 [signed.applets.codebase_principal_support]的值设置为'true',双击即可。"); 
					} 
			        var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components.interfaces.nsIPrefBranch); 
			        prefs.setCharPref('browser.startup.homepage',vrl); 
			   }
			   else
			   { 
			        alert("您的浏览器不支持，请按照下面步骤操作：1.打开浏览器设置。2.点击设置网页。3.输入："+vrl+"点击确定。"); 
			    } 
			} 
        } 
      </script>
  </head>
  
<body>
<div class="wt1002">
        <div class="r">
            <div class="toplink" style="margin-top: 50px;">
               <a href="javascript:void(0)" onclick="SetHome(this,window.location)"></a> | 
               <a href="javascript:void(0)" onclick="shoucang(document.title,window.location)"></a>
            </div>
            <div class="topsearch">
                <!-- <form action="" method="post" id="form1">
                    <input type="text" value="" class="tetPut" id="searchnew" name="searchnew" />
                    <input name="提交" type="button" class="tetBut"/>
                </form> -->
        	</div>
        </div>
        <div class="l">
            <div style="margin-top: 20px;font-size: 25px;color: #FF6347;margin-left: 50px;margin-bottom: 5px;">医院挂号系统</div>
        </div>
        <div class="clear"></div>
</div>
</body>
</html>
