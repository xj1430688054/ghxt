<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page isELIgnored="false" %> 
<%
  String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
	  
  </head>
  
  <body>
        <div class="label_head mTop10" style="margin-top: 0px;"><div class="label_title">医院公告</div></div>
    	<div class="label_contents">
        	<c:forEach items="${sessionScope.gonggaoList}" var="gonggao" varStatus="ss">
        	<h1><a href="<%=path %>/gonggaoDetailQian.action?id=${gonggao.id}"><c:out value="${fn:substring(gonggao.biaoti, 0,12)}" escapeXml="false"></c:out>...</a></h1>
        	</c:forEach>
        </div>
        
        
        <div class="label_head mTop10"><div class="label_title">联系我们</div></div>
    	<div class="label_contents">
        <ul class="label_pad mTop10">
            	<div>地 址：广东省汕头市潮阳区金浦街道11号</div>
				<div>电 话：0745-88000000</div>
				<div>传 真：000-000000 </div>
				<div>邮 箱：123456@163.com</div>
            </ul>
        </div>
        
       
  </body>
</html>
