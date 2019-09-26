<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
    String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
	<meta http-equiv="description" content="This is my page"/>
	
	<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
	
      
    <script type="text/javascript">
          
    </script>
  </head>
  
  <BODY leftMargin=9 topMargin=9 bgColor=#ffffff>
        
		               <c:forEach items="${requestScope.guahaoList}" var="guahao" varStatus="sta">
		               <fieldset style="width:95%; margin-left:5px;"><legend class="fieldtitle"></legend>
							<form action="<%=path %>/guahaoDel.action" name="111" method="post">
							<table class="bill" width="97%" cellpadding="7" cellspacing="3">
							    <tr>
							        <td>挂号专家：${guahao.user.xingming}</td>
							    </tr>
							    <tr>
							        <td>挂号时间：${guahao.riqi}</td>
							    </tr>
							    <tr>
							        <td>所患疾病：${guahao.jibing}</td>
							    </tr>
							    <tr>
							        <td>你的姓名：${guahao.xingming}</td>
							    </tr>
							    <tr>
							        <td>
							             联系方式：${guahao.lianxi}
							        </td>
							    </tr>
							    <tr>
							        <td>
							                              状态：${guahao.zt}
							        </td>
							    </tr>
							    <tr>
							        <td>回复信息：${guahao.huifu}</td>
							    </tr>
							    <tr>
							        <td>预约号码：${guahao.numbb}</td>
							    </tr>
							     <tr>
							        <td>
							        	<c:if test="${guahao.shijian==1}">
       									   时间段：	08：00-09：00
										</c:if>
										<c:if test="${guahao.shijian==2}">
       									   时间段：	09：00-10：00
										</c:if>
							        	<c:if test="${guahao.shijian==3}">
       									   时间段：	10：00-11：00
										</c:if>
										<c:if test="${guahao.shijian==4}">
       									   时间段：	11：00-12：00
										</c:if>
										<c:if test="${guahao.shijian==5}">
       									   时间段：	14：00-15：00
										</c:if>
										<c:if test="${guahao.shijian==6}">
       									   时间段：	15：00-16：00
										</c:if>
										<c:if test="${guahao.shijian==7}">
       									   时间段：	16：00-17：00
										</c:if>
							        
							        
							        
							        
							        
						
							        
							        
							        
							        </td>
							    </tr>
							    <tr>
							        <td>
							            <input type="hidden" name="id" value="${guahao.id}">
							            <input type="submit" value="取消挂号" style="width: 80px;"/>
							        </td>
							    </tr>
							</table>
							</form>
					   </fieldset>
					   <br/>
					   </c:forEach>
  </BODY>
</html>
