package com.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.directwebremoting.WebContext;
import org.directwebremoting.WebContextFactory;


import com.dao.TKeshiDAO;
import com.dao.TUserDAO;
import com.dao.TYiyuanDAO;

import com.model.TKeshi;
import com.model.TUser;
import com.model.TYiyuan;


public class loginService
{

	private TUserDAO userDAO;
	private TKeshiDAO keshiDAO;
	private TYiyuanDAO yiyuanDAO;

	

	public TUserDAO getUserDAO()
	{
		return userDAO;
	}
	
	public TYiyuanDAO getYiyuanDAO()
	{
		return yiyuanDAO;
	}
	public void setYiyuanDAO(TYiyuanDAO yiyuanDAO)
	{
		this.yiyuanDAO = yiyuanDAO;
	}
	public void setUserDAO(TUserDAO userDAO)
	{
		this.userDAO = userDAO;
	}
	
	
	public TKeshiDAO getKeshiDAO() {
		return keshiDAO;
	}
	public void setKeshiDAO(TKeshiDAO keshiDAO) {
		this.keshiDAO = keshiDAO;
	}
	public String login(String loginname,String loginpw,int userType)
	{

		try
		{
			Thread.sleep(700);
		} catch (InterruptedException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String result="no";
		String sql="from TUser where loginname=? and loginpw=? and shenhe='yes'";
		Object[] con={loginname,loginpw};
		List userList=userDAO.getHibernateTemplate().find(sql,con);
		if(userList.size()==0)
		{
			result="no";
		}
		else
		{
			WebContext ctx = WebContextFactory.get();
			HttpSession session=ctx.getSession();
			TUser user=(TUser)userList.get(0);
			session.setAttribute("userType", user.getType());
			session.setAttribute("user", user);
			System.out.println("userType"+user.getType());
			result="yes";
		}

		/*if(userType==1)//老师登陆
		{

		}
		if(userType==2)//学生登陆
		{

		}*/
		return result;
	}


	public String userPwEdit(String loginpw)
	{
		System.out.println("DDDD");
		try
		{
			Thread.sleep(700);
		}
		catch (InterruptedException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		WebContext ctx = WebContextFactory.get();
		HttpSession session=ctx.getSession();

		TUser user=(TUser)session.getAttribute("user");
		user.setLoginpw(loginpw);

		userDAO.getHibernateTemplate().update(user);
		session.setAttribute("user", user);

		return "yes";
	}

	public String jiance(String loginpw)
	{
		System.out.println("DDDD");
		try
		{
			Thread.sleep(700);
		}
		catch (InterruptedException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String sql="from TUser where loginpw='"+loginpw+"'";
		List list=userDAO.getHibernateTemplate().find(sql);
		if(list.size()>0)
		{
			return "no";
		}
		else
		{
			return "yes";
		}
	}
	public void logout()
	{
		WebContext ctx = WebContextFactory.get();
		HttpSession session=ctx.getSession();
		session.setAttribute("userType", null);
		session.setAttribute("user", null);

	}


	public String userLogout()
	{

		WebContext ctx = WebContextFactory.get();
		HttpSession session=ctx.getSession();

		session.setAttribute("userType", null);
		session.setAttribute("user", null);

		return "yes";
	}
    
    
    public List keshiAll()
    {
    	String sql="from TKeshi where del='no'";
		List keshiList=keshiDAO.getHibernateTemplate().find(sql);
		return keshiList;
    }
    
    
    public List yiyuanAll()
    {
    	String sql="from TYiyuan where del='no'";
		List yiyuanList=yiyuanDAO.getHibernateTemplate().find(sql);
		return yiyuanList;
    }
    
}
