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
		function liuyanAdd()
		{
			<c:if test="${sessionScope.userType!=2}">
			alert("请先登录");
			</c:if>
			<c:if test="${sessionScope.userType==2}">

			var strUrl = "<%=path %>/qiantai/liuyan/liuyanAdd.jsp";
			var ret = window.showModalDialog(strUrl,"","dialogWidth:800px; dialogHeight:500px; dialogLeft: status:no; directories:yes;scrollbars:yes;Resizable=no;");
			window.location.reload();
			</c:if>

		}

		function liuyanDetail(id)
		{
			var strUrl = "<%=path %>/liuyanDetail.action?id="+id;
			var ret = window.showModalDialog(strUrl,"","dialogWidth:800px; dialogHeight:400px; dialogLeft: status:no; directories:yes;scrollbars:yes;Resizable=no;");
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
               <span style="float:left;font-family: 微软雅黑;font-size: 13px;margin-top: 3px;margin-left: 10px;color: white">医生</span>
               <span style="float:right;font-family: 微软雅黑;font-size: 14px;margin-top: 3px;">&nbsp;</span>
            </div> --%>
			<div style="height: 100%;border:1px solid #FFAF60">
				<c:forEach items="${requestScope.liuyanList}" var="liuyan" varStatus="sta">
					<div class="c1-bline" style="padding:7px 0px;">
						<div class="f-left">
							&nbsp;&nbsp;&nbsp;<img src="<%=path %>/images/head-mark4.gif" align="middle" class="img-vm" border="0"/>
							<a href="#" <%-- onclick="liuyanDetail(${liuyan.id })" --%>>${liuyan.neirong }</a>
						</div>
						<div class="f-right">${liuyan.liuyanshi }&nbsp;&nbsp;&nbsp;</div>
						<div class="clear">
							回复信息：${liuyan.huifu }<br>回复时间：${liuyan.huifushi }
						</div>

					</div>
				</c:forEach>
				<center><a href="#" onclick="liuyanAdd()">我要留言咨询</a></center>
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
