package com.action;

import com.dao.TKeshiDAO;

import com.dao.TUserDAO;
import com.dao.TYiyuanDAO;
import com.model.TUser;
import com.model.TYiyuan;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

public class userAction extends ActionSupport
{
	private Integer id;
	private String loginname;
	private String loginpw;
	private String xingming;
	
	private String xingbie;
	private String nianling;
	private String address;
	private String dianhua;
	
	private String shenhe;
	private String type;
	private String typename;
	private String money;
	private String jifen;
	private String qq;
	private String shenfenzheng;
	private String touxiang;
	private String youxiang;
	private String chushengnianyue;
	private String addtime;
	private String beizhu;
	private String beizhu2;
	private String beizhu3;
	private String beizhu4;
	private String beizhu5;
	private String beizhu6;
	private String message;
	private String path;
	
	private TUserDAO userDAO;
	private TYiyuanDAO yiyuanDAO;
	private TKeshiDAO keshiDAO;
	
	
	public String userReg()
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		
		String sql="from TUser where loginname=?";
		Object[] c={loginname.trim()};
		List userList=userDAO.getHibernateTemplate().find(sql,c);
		if(userList.size()>0)
		{
			this.setMessage("账号已被占用，请重新注册");
			this.setPath("qiantai/default.jsp");
		}
		else
		{
			TUser user=new TUser();
			
			//user.setId(id);
			user.setLoginname(loginname);
			user.setLoginpw(loginpw);
			user.setXingming(xingming);
			
			user.setXingbie(xingbie);
			user.setNianling(nianling);
			user.setAddress(address);
			user.setDianhua(dianhua);
			
			user.setShenhe("no");
			user.setType(type);
			user.setMoney("0");
			user.setJifen("0");
			user.setBeizhu("0");
			user.setBeizhu2("0");
			//user.setBeizhu(beizhu);
			/*<option value="2">普通用户</option>*/

			/*if(type.equals("1"))
			{
				user.setTypename("社团负责人");
			}*/
			if(type.equals("2"))
			{
				user.setTypename("普通用户");
			}

			
			userDAO.save(user);
			
			this.setMessage("注册成功，请登录");
			this.setPath("qiantai/default.jsp");
		}
		
		return "succeed";
	}


	public String userAdd()
	{
		HttpServletRequest request=ServletActionContext.getRequest();

		String sql="from TUser where loginname=?";
		Object[] c={loginname.trim()};
		List userList=userDAO.getHibernateTemplate().find(sql,c);
		if(userList.size()>0)
		{
			this.setMessage("账号已被占用，请重新添加");
			//this.setPath("qiantai/default.jsp");
		}
		else
		{
			TUser user=new TUser();

			//user.setId(id);
			user.setLoginname(loginname);
			user.setLoginpw(loginpw);
			user.setXingming(xingming);

			user.setXingbie(xingbie);
			user.setNianling(nianling);
			user.setAddress(address);
			user.setDianhua(dianhua);

			user.setShenhe("yes");
			user.setType(type);
			user.setMoney("0");
			user.setJifen("0");
			user.setBeizhu("0");
			/*<option value="2">普通用户</option>
            <option value="3">Java</option>
            <option value="4">信息安全</option>
            <option value="5">大数据</option>
            <option value="6">HTML5</option>
            <option value="7">SAP</option>
            <option value="8">UI</option>
            <option value="9">移动互联网</option>*/
			if(type.equals("0"))
			{
				user.setTypename("管理员");
			}
			if(type.equals("1"))
			{
				user.setTypename("科室管理员");
			}
			if(type.equals("2"))
			{
				user.setTypename("普通用户");
			}


			userDAO.save(user);

			this.setMessage("添加成功");
			this.setPath("userMana.action");
		}

		return "succeed";
	}

	public String userAddSL()
	{
		HttpServletRequest request=ServletActionContext.getRequest();

		String sql="from TUser where loginname=?";
		Object[] c={loginname.trim()};
		List userList=userDAO.getHibernateTemplate().find(sql,c);
		if(userList.size()>0)
		{
			this.setMessage("账号已被占用，请重新添加");
			//this.setPath("qiantai/default.jsp");
		}
		else
		{
			TUser user=new TUser();

			//user.setId(id);
			user.setLoginname(loginname);
			user.setLoginpw(loginpw);
			user.setXingming(xingming);

			user.setXingbie(xingbie);
			user.setNianling(nianling);
			user.setAddress(address);
			user.setDianhua(dianhua);

			user.setShenhe("yes");
			user.setType(type);
			user.setMoney("0");
			user.setJifen("0");
			//user.setBeizhu("0");
			beizhu = request.getParameter("yiyuanid");
			beizhu2 = request.getParameter("keshiid");
			user.setBeizhu(beizhu);
			user.setBeizhu2(beizhu2);
			if(type.equals("0"))
			{
				user.setTypename("管理员");
			}
			if(type.equals("1"))
			{
				user.setTypename("医生");
			}
			if(type.equals("2"))
			{
				user.setTypename("普通用户");
			}


			userDAO.save(user);

			this.setMessage("添加成功");
			this.setPath("userMana.action");
		}

		return "succeed";
	}

	public String userMana()
	{
		//String sql="from TUser where del='no'";
		String sql="from TUser ";
		List userList=userDAO.getHibernateTemplate().find(sql);
		for (int i=0;i<userList.size();i++)
		{
			TUser user = (TUser) userList.get(i);
			user.setYiyuan(yiyuanDAO.findById(Integer.parseInt(user.getBeizhu()) ));
			user.setKeshi(keshiDAO.findById(Integer.parseInt(user.getBeizhu2()) ));
		}
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("userList", userList);
		return ActionSupport.SUCCESS;
	}
	public String userManaType1ByBeizhu()
	{
		//String sql="from TUser where del='no'";
		String sql="from TUser where type='1' and beizhu='"+beizhu+"'";
		List userList=userDAO.getHibernateTemplate().find(sql);
		for (int i=0;i<userList.size();i++)
		{
			TUser user = (TUser) userList.get(i);
			user.setYiyuan(yiyuanDAO.findById(Integer.parseInt(user.getBeizhu()) ));
			user.setKeshi(keshiDAO.findById(Integer.parseInt(user.getBeizhu2()) ));
		}
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("userList", userList);
		return ActionSupport.SUCCESS;
	}

	public String userManaType1ByBeizhuAndBeizhu2()
	{
		//String sql="from TUser where del='no'";
		String sql="from TUser where type='1' and beizhu='"+beizhu+"' and beizhu2='"+beizhu2+"'";
		List userList=userDAO.getHibernateTemplate().find(sql);
		for (int i=0;i<userList.size();i++)
		{
			TUser user = (TUser) userList.get(i);
			user.setYiyuan(yiyuanDAO.findById(Integer.parseInt(user.getBeizhu()) ));
			user.setKeshi(keshiDAO.findById(Integer.parseInt(user.getBeizhu2()) ));
		}
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("userList", userList);
		return ActionSupport.SUCCESS;
	}
	public String userManaType0()
	{
		//String sql="from TUser where del='no'";
		String sql="from TUser where type='0'";
		List userList=userDAO.getHibernateTemplate().find(sql);

		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("userList", userList);
		return ActionSupport.SUCCESS;
	}
	public String userManaType1()
	{
		//String sql="from TUser where del='no'";
		String sql="from TUser where type='1'";
		List userList=userDAO.getHibernateTemplate().find(sql);

		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("userList", userList);
		return ActionSupport.SUCCESS;
	}

	public String userManaType2()
	{
		//String sql="from TUser where del='no'";
		String sql="from TUser where type='2'";
		List userList=userDAO.getHibernateTemplate().find(sql);

		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("userList", userList);
		return ActionSupport.SUCCESS;
	}

	public String userManaPing()
	{
		//String sql="from TUser where del='no'";
		String sql="from TUser where type='"+type+"'";
		List userList=userDAO.getHibernateTemplate().find(sql);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("userList", userList);
		return ActionSupport.SUCCESS;
	}
	
	public String userXinxi()
	{
		
		TUser user=userDAO.findById(id);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("user", user);
		return ActionSupport.SUCCESS;
	}
	
	public String userGet()
	{
		
		TUser user=userDAO.findById(id);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("user", user);
		return ActionSupport.SUCCESS;
	}

	public String userDetailQian()
	{

		TUser user=userDAO.findById(id);
		user.setYiyuan(yiyuanDAO.findById(Integer.parseInt(user.getBeizhu())));
		user.setKeshi(keshiDAO.findById(Integer.parseInt(user.getBeizhu2())));
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("user", user);
		return ActionSupport.SUCCESS;
	}

	public String userSet()
	{
		TUser user=userDAO.findById(id);
		//user.setShenhe("yes");
		user.setLoginname(loginname);
		user.setLoginpw(loginpw);
		user.setXingming(xingming);
		user.setDianhua(dianhua);
		user.setAddress(address);
		user.setNianling(nianling);
		
		userDAO.attachDirty(user);
		
		Map session=ActionContext.getContext().getSession();
		session.put("user", user);
		//userDAO.delete(user);
		//this.setMessage("操作成功");
		HttpServletRequest request=ServletActionContext.getRequest();
		//request.setAttribute("msg", "操作成功");
		this.setMessage("操作成功");
		this.setPath("admin/user/userXinxiSet.jsp");
		return "succeed";
	}
	
	public String userChongzhi()
	{
		TUser user=userDAO.findById(id);
		//user.setShenhe("yes");
		//user.setLoginname(loginname);
		//user.setLoginpw(loginpw);
		//user.setXingming(xingming);
		//user.setDianhua(dianhua);
		//user.setAddress(address);
		//user.setNianling(nianling);
		
		user.setMoney(String.valueOf(( Integer.parseInt(money) + Integer.parseInt(user.getMoney()) )  ));
		userDAO.attachDirty(user);
		
		Map session=ActionContext.getContext().getSession();
		session.put("user", user);
		
		this.setMessage("操作成功");
		this.setPath("qiantai/default.jsp");
		return "succeed";
	}
	public String userTouxiangSet()
	{
		TUser user=userDAO.findById(id);
		//user.setShenhe("yes");
		//user.setLoginname(loginname);
		//user.setLoginpw(loginpw);
		//user.setXingming(xingming);
		//user.setDianhua(dianhua);
		//user.setAddress(address);
		//user.setNianling(nianling);

		//user.setMoney(String.valueOf(( Integer.parseInt(money) + Integer.parseInt(user.getMoney()) )  ));
		user.setTouxiang(touxiang);
		userDAO.attachDirty(user);

		Map session=ActionContext.getContext().getSession();
		session.put("user", user);

		this.setMessage("操作成功");
		this.setPath("admin/user/userTouxiang.jsp");
		return "succeed";
	}
	public String userDel()
	{
		TUser user=userDAO.findById(id);
		//user.setShenhe("no");
		//userDAO.attachDirty(user);
		userDAO.delete(user);
		this.setMessage("删除成功");
		this.setPath("userMana.action");
		return "succeed";
	}
	
	public String userShenhe()
	{
		TUser user=userDAO.findById(id);
		user.setShenhe("yes");
		userDAO.attachDirty(user);
		//userDAO.delete(user);
		this.setMessage("操作成功");
		this.setPath("userMana.action");
		return "succeed";
	}
	public String userJinyong()
	{
		TUser user=userDAO.findById(id);
		user.setShenhe("no");
		userDAO.attachDirty(user);
		//userDAO.delete(user);
		this.setMessage("操作成功");
		this.setPath("userMana.action");
		return "succeed";
	}

	public String userLogout()
	{
		Map session= ServletActionContext.getContext().getSession();
		session.remove("user");
		session.remove("userType");
		session.put("user",null);
		session.put("userType",null);
		return ActionSupport.SUCCESS;
	}
	
	public Integer getId()
	{
		return id;
	}

	public void setId(Integer id)
	{
		this.id = id;
	}

	public String getLoginname()
	{
		return loginname;
	}

	public void setLoginname(String loginname)
	{
		this.loginname = loginname;
	}

	public String getLoginpw()
	{
		return loginpw;
	}

	public void setLoginpw(String loginpw)
	{
		this.loginpw = loginpw;
	}

	public String getXingming()
	{
		return xingming;
	}

	public void setXingming(String xingming)
	{
		this.xingming = xingming;
	}

	public TUserDAO geTUserDAO()
	{
		return userDAO;
	}

	public void seTUserDAO(TUserDAO userDAO)
	{
		this.userDAO = userDAO;
	}

	public String getXingbie()
	{
		return xingbie;
	}

	public void setXingbie(String xingbie)
	{
		this.xingbie = xingbie;
	}

	public String getNianling()
	{
		return nianling;
	}

	public void setNianling(String nianling)
	{
		this.nianling = nianling;
	}

	public String getAddress()
	{
		return address;
	}

	public void setAddress(String address)
	{
		this.address = address;
	}

	public String getDianhua()
	{
		return dianhua;
	}

	public void setDianhua(String dianhua)
	{
		this.dianhua = dianhua;
	}




	public String getShenhe() {
		return shenhe;
	}



	public void setShenhe(String shenhe) {
		this.shenhe = shenhe;
	}



	public String getType() {
		return type;
	}



	public void setType(String type) {
		this.type = type;
	}



	public String getTypename() {
		return typename;
	}



	public void setTypename(String typename) {
		this.typename = typename;
	}



	public String getMoney() {
		return money;
	}



	public void setMoney(String money) {
		this.money = money;
	}



	public String getJifen() {
		return jifen;
	}



	public void setJifen(String jifen) {
		this.jifen = jifen;
	}



	public String getQq() {
		return qq;
	}



	public void setQq(String qq) {
		this.qq = qq;
	}



	public String getShenfenzheng() {
		return shenfenzheng;
	}



	public void setShenfenzheng(String shenfenzheng) {
		this.shenfenzheng = shenfenzheng;
	}



	public String getTouxiang() {
		return touxiang;
	}



	public void setTouxiang(String touxiang) {
		this.touxiang = touxiang;
	}



	public String getYouxiang() {
		return youxiang;
	}



	public void setYouxiang(String youxiang) {
		this.youxiang = youxiang;
	}



	public String getChushengnianyue() {
		return chushengnianyue;
	}



	public void setChushengnianyue(String chushengnianyue) {
		this.chushengnianyue = chushengnianyue;
	}



	public String getAddtime() {
		return addtime;
	}



	public void setAddtime(String addtime) {
		this.addtime = addtime;
	}



	public String getBeizhu() {
		return beizhu;
	}



	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}



	public String getMessage()
	{
		return message;
	}

	public void setMessage(String message)
	{
		this.message = message;
	}

	public String getPath()
	{
		return path;
	}

	public void setPath(String path)
	{
		this.path = path;
	}



	public TUserDAO getUserDAO() {
		return userDAO;
	}



	public void setUserDAO(TUserDAO userDAO) {
		this.userDAO = userDAO;
	}

	public TYiyuanDAO getYiyuanDAO() {
		return yiyuanDAO;
	}

	public void setYiyuanDAO(TYiyuanDAO yiyuanDAO) {
		this.yiyuanDAO = yiyuanDAO;
	}

	public TKeshiDAO getKeshiDAO() {
		return keshiDAO;
	}

	public void setKeshiDAO(TKeshiDAO keshiDAO) {
		this.keshiDAO = keshiDAO;
	}

	public String getBeizhu2() {
		return beizhu2;
	}

	public void setBeizhu2(String beizhu2) {
		this.beizhu2 = beizhu2;
	}

	public String getBeizhu3() {
		return beizhu3;
	}

	public void setBeizhu3(String beizhu3) {
		this.beizhu3 = beizhu3;
	}

	public String getBeizhu4() {
		return beizhu4;
	}

	public void setBeizhu4(String beizhu4) {
		this.beizhu4 = beizhu4;
	}

	public String getBeizhu5() {
		return beizhu5;
	}

	public void setBeizhu5(String beizhu5) {
		this.beizhu5 = beizhu5;
	}

	public String getBeizhu6() {
		return beizhu6;
	}

	public void setBeizhu6(String beizhu6) {
		this.beizhu6 = beizhu6;
	}
}
