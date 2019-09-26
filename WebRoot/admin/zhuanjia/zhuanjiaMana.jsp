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
           function zhuanjiaDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/zhuanjiaDel.action?id="+id;
               }
           }
           
           function zhuanjiaAdd()
           {
                 var url="<%=path %>/admin/zhuanjia/zhuanjiaAdd.jsp";
				 window.location.href=url;
           }
           
           function over(picPath)
	       {
			  if (picPath=="")picPath="/img/default.jpg";
			  x = event.clientX;
			  y = event.clientY;      
			  document.all.tip.style.display = "block";
			  document.all.tip.style.top = y;
			  document.all.tip.style.left = x+10;
			  document.all.photo.src = ".."+picPath; 
		   }
		   function out()
	       {
			  document.all.tip.style.display = "none";
		   }
       </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/img/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="110" background="<%=path %>/img/tbg.gif">&nbsp;&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="4%">序号</td>
					<td width="10%">医院</td>
					<td width="8%">科室</td>
					<td width="8%">姓名</td>
					
					<td width="8%">性别</td>
					<td width="8%">年龄</td>
					<td width="16%">擅长</td>
					<td width="8%">值班时间</td>
					
					<td width="10%">照片</td>
					<td width="10%">账号</td>
					<td width="8%">密码</td>
					<td width="6%">操作</td>
		        </tr>	
				<s:iterator value="#request.zhuanjiaList" id="zhuanjia" status="ss">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td  bgcolor="#FFFFFF" align="center">
						<s:property value="#ss.index+1"/>
					</td>
					<td  bgcolor="#FFFFFF" align="center">
						<s:property value="#zhuanjia.yiyuan.mingcheng"/>
					</td>
					<td  bgcolor="#FFFFFF" align="center">
						<s:property value="#zhuanjia.keshi.keshiAnme"/>
					</td>
					<td  bgcolor="#FFFFFF" align="center">
						<s:property value="#zhuanjia.xingming"/>
					</td>
					
					<td  bgcolor="#FFFFFF" align="center">
					    <s:property value="#zhuanjia.xingbie"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    <s:property value="#zhuanjia.nianling"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    <s:property value="#zhuanjia.shanchang"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    <s:property value="#zhuanjia.leixing"/>
					</td>
					
					<td bgcolor="#FFFFFF" align="center">
					    <div onmouseover = "over('<%=path %>/<s:property value="#zhuanjia.fujian"/>')" onmouseout = "out()" style="cursor:hand;">
							照片
					    </div>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    <s:property value="#zhuanjia.loginname"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    <s:property value="#zhuanjia.loginpw"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<input type="button" value="删除" onclick="zhuanjiaDel(<s:property value="#zhuanjia.id"/>)"/>
					</td>
				</tr>
				</s:iterator>
			</table>
			
			<table width='98%'  border='0'style="margin-top:8px;margin-left: 8px;">
			  <tr>
			    <td>
			      <input type="button" value="添加医生信息" style="width: 120px;" onclick="zhuanjiaAdd()" />
			    </td>
			  </tr>
		    </table>
		    
		    <div id="tip" style="position:absolute;display:none;border:0px;width:120px; height:150px;">
			<TABLE id="tipTable" border="0" bgcolor="#ffffee">
				<TR align="center">
					<TD><img id="photo" src="" height="80" width="80"></TD>
				</TR>
			</TABLE>
		    </div>
	</body>
</html>
