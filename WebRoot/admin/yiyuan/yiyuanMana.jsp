<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
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
		
        <script language="javascript">
           function yiyuanDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/yiyuanDel.action?id="+id;
               }
           }
           
           
           function yiyuanPre(id)
           {
                   window.location.href="<%=path %>/yiyuanPre.action?id="+id;
           }
           
           
           function yiyuanAdd()
           {
                 var url="<%=path %>/admin/yiyuan/yiyuanAdd.jsp";
				 window.location.href=url;
           }
       </script>
	</head>

	<body leftmargin="8" topmargin="8" background='<%=path %>/img/allbg.gif'>
			<table width="99%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="14" background="<%=path %>/img/tbg.gif">&nbsp;&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="5%">序号</td>
					<td width="20%">名称</td>
					<td width="20%">地址</td>
					<td width="20%">电话</td>
					<td width="10%">操作</td>
		        </tr>	
				<s:iterator value="#request.yiyuanList" id="yiyuan" status="ss">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#ss.index+1"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#yiyuan.mingcheng"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#yiyuan.dizhi"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#yiyuan.dianhua"/>
					</td>
					
					<td bgcolor="#FFFFFF" align="center">
						<input type="button" value="删除" onclick="yiyuanDel(<s:property value="#yiyuan.id"/>)"/>
					</td>
				</tr>
				</s:iterator>
			</table>
			
			<br/>
			<input type="button" value="添加医院" style="width: 120px;" onclick="yiyuanAdd()" />
	</body>
</html>
