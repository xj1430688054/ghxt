package com.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.dao.TKeshiDAO;
import com.dao.TUserDAO;
import com.model.TKeshi;
import com.opensymphony.xwork2.ActionSupport;

public class keshiAction extends ActionSupport
{
	private int keshiId;
	private String keshiAnme;
	private String keshiJianjie;
	
	private String message;
	private String path;
	
	private TKeshiDAO keshiDAO;
	private TUserDAO userDAO;
	
	public String keshiAdd()
	{
		TKeshi keshi=new TKeshi();
		keshi.setKeshiAnme(keshiAnme);
		keshi.setDel("no");
		keshiDAO.save(keshi);
		this.setMessage("操作成功");
		this.setPath("keshiMana.action");
		return "succeed";
	}
	
	
	public String keshiMana()
	{
		String sql="from TKeshi where del='no'";
		List keshiList=keshiDAO.getHibernateTemplate().find(sql);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("keshiList", keshiList);
		return ActionSupport.SUCCESS;
	}
	
	
	public String keshiDel()
	{
		TKeshi keshi=keshiDAO.findById(keshiId);
		keshi.setDel("yes");
		keshiDAO.attachDirty(keshi);
		this.setMessage("操作成功");
		this.setPath("keshiMana.action");
		return "succeed";
	}
	
	
	public String keshiPre()
	{
		TKeshi keshi=keshiDAO.findById(keshiId);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("keshi", keshi);
		return ActionSupport.SUCCESS;
	}
	
	
	public String keshiEdit()
	{
		TKeshi keshi=keshiDAO.findById(keshiId);
		
		keshi.setKeshiAnme(keshiAnme);
		keshi.setDel("no");
		keshiDAO.attachDirty(keshi);
		this.setMessage("操作成功");
		this.setPath("keshiMana.action");
		return "succeed";
	}
	
	
	
	

	public String getKeshiAnme()
	{
		return keshiAnme;
	}

	public void setKeshiAnme(String keshiAnme)
	{
		this.keshiAnme = keshiAnme;
	}

	public TKeshiDAO getKeshiDAO()
	{
		return keshiDAO;
	}

	public void setKeshiDAO(TKeshiDAO keshiDAO)
	{
		this.keshiDAO = keshiDAO;
	}

	public TUserDAO getUserDAO() {
		return userDAO;
	}

	public void setUserDAO(TUserDAO userDAO) {
		this.userDAO = userDAO;
	}

	public int getKeshiId()
	{
		return keshiId;
	}

	public void setKeshiId(int keshiId)
	{
		this.keshiId = keshiId;
	}

	public String getKeshiJianjie()
	{
		return keshiJianjie;
	}

	public void setKeshiJianjie(String keshiJianjie)
	{
		this.keshiJianjie = keshiJianjie;
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
	

}
