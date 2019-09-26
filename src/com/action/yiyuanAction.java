package com.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.dao.TYiyuanDAO;

import com.model.TYiyuan;
import com.opensymphony.xwork2.ActionSupport;

public class yiyuanAction extends ActionSupport
{
	private Integer id;
	private String mingcheng;
	private String dizhi;
	private String dianhua;
	
	private String del;
	
	private String message;
	private String path;
	
	private TYiyuanDAO yiyuanDAO;
	
	public String yiyuanAdd()
	{
		TYiyuan yiyuan=new TYiyuan();
		
		yiyuan.setMingcheng(mingcheng);
		yiyuan.setDizhi(dizhi);
		yiyuan.setDianhua(dianhua);
		yiyuan.setDel("no");
		
		yiyuanDAO.save(yiyuan);
		this.setMessage("操作成功");
		this.setPath("yiyuanMana.action");
		return "succeed";
	}
	
	
	public String yiyuanMana()
	{
		String sql="from TYiyuan where del='no'";
		List yiyuanList=yiyuanDAO.getHibernateTemplate().find(sql);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("yiyuanList", yiyuanList);
		return ActionSupport.SUCCESS;
	}
	
	
	public String yiyuanDel()
	{
		TYiyuan yiyuan=yiyuanDAO.findById(id);
		yiyuan.setDel("yes");
		
		yiyuanDAO.attachDirty(yiyuan);
		this.setMessage("操作成功");
		this.setPath("yiyuanMana.action");
		return "succeed";
	}
	
	
	public String yiyuanPre()
	{
		TYiyuan yiyuan=yiyuanDAO.findById(id);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("yiyuan", yiyuan);
		return ActionSupport.SUCCESS;
	}
	
	
	public String yiyuanEdit()
	{
		TYiyuan yiyuan=yiyuanDAO.findById(id);
		
		yiyuan.setMingcheng(mingcheng);
		yiyuan.setDizhi(dizhi);
		yiyuan.setDianhua(dianhua);
		yiyuan.setDel("no");
		
		yiyuanDAO.attachDirty(yiyuan);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "更新成功");
		return "msg";
	}
	
	
	
	public String yiyuanAll()
	{
		String sql="from TYiyuan where del='no'";
		List yiyuanList=yiyuanDAO.getHibernateTemplate().find(sql);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("yiyuanList", yiyuanList);
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


	public String getMingcheng()
	{
		return mingcheng;
	}


	public void setMingcheng(String mingcheng)
	{
		this.mingcheng = mingcheng;
	}


	public String getDizhi()
	{
		return dizhi;
	}


	public void setDizhi(String dizhi)
	{
		this.dizhi = dizhi;
	}


	public String getDianhua()
	{
		return dianhua;
	}


	public void setDianhua(String dianhua)
	{
		this.dianhua = dianhua;
	}


	public String getDel()
	{
		return del;
	}


	public void setDel(String del)
	{
		this.del = del;
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


	public TYiyuanDAO getYiyuanDAO()
	{
		return yiyuanDAO;
	}


	public void setYiyuanDAO(TYiyuanDAO yiyuanDAO)
	{
		this.yiyuanDAO = yiyuanDAO;
	}
	
}
