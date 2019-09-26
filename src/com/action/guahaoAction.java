package com.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.SortedMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.alibaba.fastjson.JSON;
import com.dao.TGuahaoDAO;
import com.dao.TUserDAO;
import com.model.TGuahao;
import com.model.TUser;
import com.model.TUser;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Pagesize;

public class guahaoAction extends ActionSupport
{
	private Integer id;
	private Integer muid;
	private Integer cuid;
	private String riqi;

	private String jibing;
	private String xingming;
	private String lianxi;
	
    private String zt;//预约成功--待处理--预约失败
	private String huifu;
	
	private TGuahaoDAO guahaoDAO;
	private TUserDAO userDAO;
	
	private String message;
	private String path;
	private String shijian;
	
	
	public String guahaoAdd()
	{	
		TGuahao gudd = new TGuahao();
		gudd.setLianxi("");
		guahaoDAO.deleteee();
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		
		TUser user=(TUser)session.getAttribute("user");
		
		String sql="from TGuahao where riqi=? and muid=?";
		Object[] c={riqi,muid};
		List guahaoList=guahaoDAO.getHibernateTemplate().find(sql,c);
		if(guahaoList.size()>=Pagesize.size)
		{
			request.setAttribute("msg1", "预约失败。超过上限");
			return "msg1";
		}
		String shijian = (String)request.getAttribute("shijian");
		TGuahao guahao=new TGuahao();
		guahao.setShijian(shijian);
		guahao.setMuid(muid);
		guahao.setCuid(user.getId());
		guahao.setRiqi(riqi);
		guahao.setJibing(jibing);
		
		guahao.setXingming(xingming);
		guahao.setLianxi(lianxi);
		guahao.setZt("待处理");
		guahao.setHuifu(huifu);
		
		
		String sqls="from TGuahao where riqi=? and muid=? and shijian = ?";
		Object[] cc={riqi,muid,String.valueOf(shijian)};
		List guahaoLisst=guahaoDAO.getHibernateTemplate().find(sqls,cc);
		int lss = guahaoLisst.size() ;
		if(lss >= 6){
			request.setAttribute("msg", "请刷新余号,或者选择有号的");
			return "msg";
		}
		lss = lss+1;
		guahao.setNumbb("第" + lss + "号");
		this.setMessage("成功挂号， 你是第" + lss +"号");
		guahaoDAO.save(guahao);
		this.setPath("index.action");
		return "succeed";
	}
	
	
	public String guahaoCha(){
		HttpServletRequest request=ServletActionContext.getRequest();
//		ServletActionContext.getsess
		TGuahao guahao = new TGuahao();
		String riqi = (String)request.getAttribute("shijian");
		request.getSession().setAttribute("riqi", riqi);
		Integer muid = (Integer)request.getAttribute("muid");
		String jibing = (String)request.getAttribute("jibing");
		request.getSession().setAttribute("jibing", jibing);
//		System.out.println(b);
		guahao.setMuid(muid);
		List<Integer> list = new ArrayList<Integer>();
		Map<String, String> map = new HashMap<String, String>();
		
		String aa [] = new String[7];
		aa[0]="8:00-9:00";
		aa[1]="9:00-10:00";
		aa[2]="10:00-11:00";
		aa[3]="11:00-12:00";
		aa[4]="14:00-15:00";
		aa[5]="15:00-16:00";
		aa[6]="16:00-17:00";
		for(int shijian = 1; shijian<=7; shijian++){
			guahao.setShijian(String.valueOf(shijian));
			String sql="from TGuahao where riqi=? and muid=? and shijian = ?";
			Object[] c={riqi,muid,String.valueOf(shijian)};
			List guahaoList=guahaoDAO.getHibernateTemplate().find(sql,c);
			int lss = guahaoList.size();
			if (lss <= 6) {
				if (lss >= 0 && lss <= 6) {
					lss = 6 - lss;
					map.put(String.valueOf(shijian), aa[shijian - 1] + "余号： "
							+ String.valueOf(lss));
				} else {
					
					//map.put(String.valueOf(shijian), "暂无余号");
				}
			}
		}
		request.getSession().setAttribute("map", map);
		return null;
		
//		return JSON.toJSONString(r);
		
//		ServletActionContext.getResponse().getWriter().print(result); 
//		return null;
	}
	
	public String guahaoDel()
	{   
		HttpServletRequest request=ServletActionContext.getRequest();
		
		TGuahao guahao=guahaoDAO.findById(id);
		guahaoDAO.delete(guahao);
		
		request.setAttribute("msg", "成功取消预约");
		return "msg";
	}
	
	

	public String guahaoMana_user()
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		TUser user=(TUser)session.getAttribute("user");
		
		String sql="from TGuahao where cuid="+user.getId();
		List guahaoList =guahaoDAO.getHibernateTemplate().find(sql);
		for(int i=0;i<guahaoList.size();i++)
		{
			TGuahao guahao=(TGuahao)guahaoList.get(i);
			guahao.setUser(userDAO.findById(guahao.getMuid()));
		}
		
		request.setAttribute("guahaoList", guahaoList);
		return ActionSupport.SUCCESS;
	}
	
	
	
	public String guahaoMana_zhuanjia()
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		TUser user=(TUser)session.getAttribute("user");
		
		String sql="from TGuahao where muid="+user.getId();
		List guahaoList =guahaoDAO.getHibernateTemplate().find(sql);
		for(int i=0;i<guahaoList.size();i++)
		{
			TGuahao guahao=(TGuahao)guahaoList.get(i);
			guahao.setUser(userDAO.findById(guahao.getMuid()));
		}
		
		request.setAttribute("guahaoList", guahaoList);
		return ActionSupport.SUCCESS;
	}
	
	
	public String guahaoChuli()
	{
        HttpServletRequest request=ServletActionContext.getRequest();
		
		TGuahao guahao=guahaoDAO.findById(id);
		guahao.setZt(zt);
		guahao.setHuifu(huifu);
		
		guahaoDAO.attachDirty(guahao);
		
		request.setAttribute("msg", "信息更新完毕");
		return "msg";
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
	

	public String getShijian() {
		return shijian;
	}


	public void setShijian(String shijian) {
		this.shijian = shijian;
	}


	public Integer getMuid() {
		return muid;
	}

	public void setMuid(Integer muid) {
		this.muid = muid;
	}

	public Integer getCuid() {
		return cuid;
	}

	public void setCuid(Integer cuid) {
		this.cuid = cuid;
	}

	public String getRiqi() {
		return riqi;
	}

	public void setRiqi(String riqi) {
		this.riqi = riqi;
	}

	public String getJibing() {
		return jibing;
	}

	public void setJibing(String jibing) {
		this.jibing = jibing;
	}

	public String getXingming() {
		return xingming;
	}

	public void setXingming(String xingming) {
		this.xingming = xingming;
	}

	public String getLianxi() {
		return lianxi;
	}

	public void setLianxi(String lianxi) {
		this.lianxi = lianxi;
	}

	public String getZt() {
		return zt;
	}

	public void setZt(String zt) {
		this.zt = zt;
	}

	public String getHuifu() {
		return huifu;
	}

	public void setHuifu(String huifu) {
		this.huifu = huifu;
	}

	public TGuahaoDAO getGuahaoDAO() {
		return guahaoDAO;
	}

	public void setGuahaoDAO(TGuahaoDAO guahaoDAO) {
		this.guahaoDAO = guahaoDAO;
	}

	public TUserDAO getUserDAO() {
		return userDAO;
	}

	public void setUserDAO(TUserDAO userDAO) {
		this.userDAO = userDAO;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}
}
