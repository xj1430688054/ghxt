package com.action;

import com.dao.TLiuyanDAO;
import com.model.TLiuyan;
import com.model.TUser;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

public class liuyanAction extends ActionSupport
{
	private Integer id;
	private String neirong;
	private String liuyanshi;
	private Integer uid;

	private String huifu;
	private String huifushi;
	
	private TLiuyanDAO liuyanDAO;
	
	
	
	public String liuyanAdd()
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		Map session=ActionContext.getContext().getSession();
		TUser user=(TUser)session.get("user");
		
		TLiuyan liuyan=new TLiuyan();
		
		liuyan.setId(id);
		liuyan.setNeirong(neirong);
		liuyan.setLiuyanshi(new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date()));
		liuyan.setUid(user.getId());
		
		liuyan.setHuifu("");
		liuyan.setHuifushi("");
		
		liuyanDAO.save(liuyan);
		
		request.setAttribute("msg", "留言完毕");
		return "msg";
	}
	
	
	public String liuyanMana()
	{
		String sql="from TLiuyan order by liuyanshi";
		List liuyanList=liuyanDAO.getHibernateTemplate().find(sql);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("liuyanList", liuyanList);
		return ActionSupport.SUCCESS;
	}
	
	
	public String liuyanDel()
	{
		TLiuyan liuyan=liuyanDAO.findById(id);
		liuyanDAO.delete(liuyan);
		
		HttpServletRequest request=ServletActionContext.getRequest();
		request.setAttribute("msg", "删除成功");
		return "msg";
	}
	
	
	public String liuyanHuifu()
	{
		TLiuyan liuyan=liuyanDAO.findById(id);
		liuyan.setHuifu(huifu);
		liuyan.setHuifushi(new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date()));
		
		liuyanDAO.attachDirty(liuyan);
		
		HttpServletRequest request=ServletActionContext.getRequest();
		request.setAttribute("msg", "回复完毕");
		return "msg";
	}
	
	
	public String liuyanDetail()
	{
		TLiuyan liuyan=liuyanDAO.findById(id);
		HttpServletRequest request=ServletActionContext.getRequest();
		request.setAttribute("liuyan", liuyan);
		return ActionSupport.SUCCESS;
	}
	
	
	
	public String liuyanAll()
	{
		String sql="from TLiuyan order by liuyanshi";
		List liuyanList=liuyanDAO.getHibernateTemplate().find(sql);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("liuyanList", liuyanList);
		return ActionSupport.SUCCESS;
	}

	public String getHuifu()
	{
		return huifu;
	}

	public void setHuifu(String huifu)
	{
		this.huifu = huifu;
	}

	public String getHuifushi()
	{
		return huifushi;
	}

	public void setHuifushi(String huifushi)
	{
		this.huifushi = huifushi;
	}

	public Integer getId()
	{
		return id;
	}

	public void setId(Integer id)
	{
		this.id = id;
	}

	public TLiuyanDAO getLiuyanDAO()
	{
		return liuyanDAO;
	}

	public void setLiuyanDAO(TLiuyanDAO liuyanDAO)
	{
		this.liuyanDAO = liuyanDAO;
	}

	public String getLiuyanshi()
	{
		return liuyanshi;
	}

	public void setLiuyanshi(String liuyanshi)
	{
		this.liuyanshi = liuyanshi;
	}

	public String getNeirong()
	{
		return neirong;
	}

	public void setNeirong(String neirong)
	{
		this.neirong = neirong;
	}

	
}
