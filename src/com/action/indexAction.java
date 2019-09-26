package com.action;





import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.dao.TGonggaoDAO;
import com.dao.TLianjieDAO;
import com.dao.TYiyuanDAO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class indexAction extends ActionSupport
{
	private TGonggaoDAO gonggaoDAO;
	private TYiyuanDAO yiyuanDAO;
	private TLianjieDAO lianjieDAO;
	
	public TGonggaoDAO getGonggaoDAO() {
		return gonggaoDAO;
	}


	public void setGonggaoDAO(TGonggaoDAO gonggaoDAO) {
		this.gonggaoDAO = gonggaoDAO;
	}


	public TYiyuanDAO getYiyuanDAO() {
		return yiyuanDAO;
	}


	public void setYiyuanDAO(TYiyuanDAO yiyuanDAO) {
		this.yiyuanDAO = yiyuanDAO;
	}


	public TLianjieDAO getLianjieDAO() {
		return lianjieDAO;
	}


	public void setLianjieDAO(TLianjieDAO lianjieDAO) {
		this.lianjieDAO = lianjieDAO;
	}


	public String index()
	{
		Map request=(Map)ServletActionContext.getContext().get("request");
		Map session=ActionContext.getContext().getSession();
		
		List gonggaoList =gonggaoDAO.findAll();
		if(gonggaoList.size()>4)
		{
			gonggaoList=gonggaoList.subList(0,4);
		}
		session.put("gonggaoList", gonggaoList);
		
		
		String sql1="from TLianjie where del='no'";
		List lianjieList =lianjieDAO.getHibernateTemplate().find(sql1);
		session.put("lianjieList", lianjieList);
		
		
		String sql="from TYiyuan where del='no'";
		List yiyuanList=yiyuanDAO.getHibernateTemplate().find(sql);
		request.put("yiyuanList", yiyuanList);
		
		return ActionSupport.SUCCESS;
	}
}
