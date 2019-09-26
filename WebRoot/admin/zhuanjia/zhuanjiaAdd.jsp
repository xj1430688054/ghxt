<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 

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
        
        <script type="text/javascript" src="<%=path %>/js/popup.js"></script>
        <script type='text/javascript' src='<%=path %>/dwr/interface/loginService.js'></script>
		<script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
		<script type='text/javascript' src='<%=path %>/dwr/util.js'></script>
       
        <script language="javascript">
           function c()
           {
                if(document.formAdd.keshiId.value=="")
                {
                    alert("请选择所在科室");
                    return false;
                }
                if(document.formAdd.xingming.value=="")
                {
                    alert("请输入姓名");
                    return false;
                }
                if(document.formAdd.loginname.value=="")
                {
                    alert("请输入账号");
                    return false;
                }
                
                document.formAdd.submit();
           }
           
           function up()
	       {
		        var pop=new Popup({ contentType:1,isReloadOnClose:false,width:400,height:200});
	            pop.setContent("contentUrl","<%=path %>/upload/upload.jsp");
	            pop.setContent("title","文件上传");
	            pop.build();
	            pop.show();
	       }
	       
           function keshiAll()
           {
                   document.getElementById("indicator").style.display="block";
                   loginService.keshiAll(callback);
           }
           
           function callback(data)
           {
               document.getElementById("indicator").style.display="none";
               DWRUtil.addOptions("keshiId",data,"keshiId","keshiAnme");
           }
           
           function init()
           {
              loginService.yiyuanAll(callback1);
              keshiAll();
           }
           function callback1(data)
           {
               DWRUtil.addOptions("yiyuanId",data,"id","mingcheng");
           }
           
           
        </script>
	</head>

	<body leftmargin="8" topmargin="8" onload="init()">
			<form action="<%=path %>/zhuanjiaAdd.action" name="formAdd" method="post">
				     <table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
						<tr bgcolor="#E7E7E7">
							<td height="14" colspan="10" background="<%=path %>/img/tbg.gif">&nbsp;&nbsp;</td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="10%" bgcolor="#FFFFFF" align="right">
						                医院：<img id="indicator" src="<%=path %>/img/loading.gif" style="display:none"/>
						    </td>
						    <td width="90%" bgcolor="#FFFFFF" align="left">
						        <select name="yiyuanId" id="yiyuanId" style="width: 204px;">
					                
					            </select>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="10%" bgcolor="#FFFFFF" align="right">
						               科室：<img id="indicator" src="<%=path %>/img/loading.gif" style="display:none"/>
						    </td>
						    <td width="90%" bgcolor="#FFFFFF" align="left">
						        <select name="keshiId" id="keshiId" style="width: 204px;">
					                
					            </select>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="10%" bgcolor="#FFFFFF" align="right">
						                姓名：
						    </td>
						    <td width="90%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="xingming" style="width: 200px;"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="10%" bgcolor="#FFFFFF" align="right">
						         性别：
						    </td>
						    <td width="90%" bgcolor="#FFFFFF" align="left">
						        <input type="radio" name="xingbie" value="男" checked="checked" style="border: 0px;"/>男
						        &nbsp;&nbsp;&nbsp;&nbsp;
						        <input type="radio" name="xingbie" value="女" style="border: 0px;"/>女
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="10%" bgcolor="#FFFFFF" align="right">
						         年龄：
						    </td>
						    <td width="90%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="nianling" style="width: 200px;" value="40" onkeyup="value=value.replace(/[^\d]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="10%" bgcolor="#FFFFFF" align="right">
						        擅长：
						    </td>
						    <td width="90%" bgcolor="#FFFFFF" align="left">
						       <input type="text" name="shanchang" style="width: 500px;"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="10%" bgcolor="#FFFFFF" align="right">
						                值班时间：
						    </td>
						    <td width="90%" bgcolor="#FFFFFF" align="left">
						        <select name="leixing" id="leixing" style="width: 204px;">
					                 <option value="周一">周一</option>
					                 <option value="周二">周二</option>
					                 <option value="周三">周三</option>
					                 <option value="周四">周四</option>
					                 <option value="周五">周五</option>
					                 <option value="周六">周六</option>
					                 <option value="周日">周日</option>
					            </select>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="10%" bgcolor="#FFFFFF" align="right">
						              照片：
						    </td>
						    <td width="90%" bgcolor="#FFFFFF" align="left">
						       <input type="text" name="fujian" id="fujian" readonly="readonly" style="width: 200px;"/>
						       <input type="button" value="上传" onclick="up()"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="10%" bgcolor="#FFFFFF" align="right">
						                账号：
						    </td>
						    <td width="90%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="loginname" style="width: 200px;"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="10%" bgcolor="#FFFFFF" align="right">
						                密码：
						    </td>
						    <td width="90%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="loginpw" style="width: 200px;" value="000000"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="10%" bgcolor="#FFFFFF" align="right">
						        &nbsp;
						    </td>
						    <td width="90%" bgcolor="#FFFFFF" align="left">
						       <input type="button" value="提交" onclick="c()"/>&nbsp; 
						       <input type="reset" value="重置"/>&nbsp;
						    </td>
						</tr>
					 </table>
			</form>
   </body>
</html>
