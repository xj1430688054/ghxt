package com.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.dao.TGonggaoDAO;

import com.model.TGonggao;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class gonggaoAction extends ActionSupport
{
	private Integer id;
	private String biaoti;
	private String neirong;
	private String shijian;
	
	private String message;
	private String path;
	
	private TGonggaoDAO gonggaoDAO;
	
	public String gonggaoAdd()
	{
		TGonggao gonggao=new TGonggao();
		gonggao.setBiaoti(biaoti);
		gonggao.setNeirong(neirong);
		gonggao.setShijian(shijian);
		gonggaoDAO.save(gonggao);
		this.setMessage("公告添加完毕");
		this.setPath("gonggaoMana.action");
		return "succeed";
	}
	
	
	public String gonggaoMana()
	{
		List gonggaoList =gonggaoDAO.findAll();
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("gonggaoList", gonggaoList);
		return ActionSupport.SUCCESS;
	}
	
	public String gonggaoDel()
	{
		TGonggao gonggao=gonggaoDAO.findById(id);
		gonggaoDAO.delete(gonggao);
		this.setMessage("公告删除完毕");
		this.setPath("gonggaoMana.action");
		return "succeed";
	}
	
	
	public String gonggaoDetailHou()
	{
		TGonggao gonggao=gonggaoDAO.findById(id);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("gonggao", gonggao);
		return ActionSupport.SUCCESS;
	}
	
	
	public String gonggaoAll()
	{
		List gonggaoList =gonggaoDAO.findAll();
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("gonggaoList", gonggaoList);
		return ActionSupport.SUCCESS;
	}
	
	public String gonggaoDetailQian()
	{
		TGonggao gonggao=gonggaoDAO.findById(id);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("gonggao", gonggao);
		
		return ActionSupport.SUCCESS;
	}


	public String getBiaoti()
	{
		return biaoti;
	}


	public void setBiaoti(String biaoti)
	{
		this.biaoti = biaoti;
	}


	public TGonggaoDAO getGonggaoDAO()
	{
		return gonggaoDAO;
	}


	public void setGonggaoDAO(TGonggaoDAO gonggaoDAO)
	{
		this.gonggaoDAO = gonggaoDAO;
	}


	public Integer getId()
	{
		return id;
	}


	public void setId(Integer id)
	{
		this.id = id;
	}


	public String getMessage()
	{
		return message;
	}


	public void setMessage(String message)
	{
		this.message = message;
	}


	public String getNeirong()
	{
		return neirong;
	}


	public void setNeirong(String neirong)
	{
		this.neirong = neirong;
	}


	public String getPath()
	{
		return path;
	}


	public void setPath(String path)
	{
		this.path = path;
	}


	public String getShijian()
	{
		return shijian;
	}


	public void setShijian(String shijian)
	{
		this.shijian = shijian;
	}
	
}
