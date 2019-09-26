package com.action;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.dao.TLianjieDAO;

import com.model.TLianjie;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class lianjieAction extends ActionSupport
{
	private int id;
	private String name;
	private String url;
	
	private String message;
	private String path;
	
	private TLianjieDAO lianjieDAO;
	
	public String lianjieAdd()
	{
		TLianjie lianjie=new TLianjie();
		lianjie.setName(name);
		lianjie.setUrl(url);
		lianjie.setDel("no");
		lianjieDAO.save(lianjie);
		this.setMessage("操作成功");
		this.setPath("lianjieMana.action");
		return "succeed";
	}
	
	
	public String lianjieMana()
	{
		String sql="from TLianjie where del='no'";
		List lianjieList =lianjieDAO.getHibernateTemplate().find(sql);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("lianjieList", lianjieList);
		return ActionSupport.SUCCESS;
	}
	
	public String lianjieDel()
	{   
		String sql="update TLianjie set del='yes' where id="+id;
		lianjieDAO.getHibernateTemplate().bulkUpdate(sql);
		this.setMessage("操作成功");
		this.setPath("lianjieMana.action");
		return "succeed";
	}
	
	
	
	
	
	public String lianjieAll()
	{
		String sql="from TLianjie where del='no'";
		List lianjieList =lianjieDAO.getHibernateTemplate().find(sql);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("lianjieList", lianjieList);
		return ActionSupport.SUCCESS;
	}


	public int getId()
	{
		return id;
	}


	public void setId(int id)
	{
		this.id = id;
	}


	public TLianjieDAO getLianjieDAO()
	{
		return lianjieDAO;
	}


	public void setLianjieDAO(TLianjieDAO lianjieDAO)
	{
		this.lianjieDAO = lianjieDAO;
	}


	public String getMessage()
	{
		return message;
	}


	public void setMessage(String message)
	{
		this.message = message;
	}


	public String getName()
	{
		return name;
	}


	public void setName(String name)
	{
		this.name = name;
	}


	public String getPath()
	{
		return path;
	}


	public void setPath(String path)
	{
		this.path = path;
	}


	public String getUrl()
	{
		return url;
	}


	public void setUrl(String url)
	{
		this.url = url;
	}

	
}
