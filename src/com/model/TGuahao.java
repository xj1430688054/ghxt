package com.model;

/**
 * TGuahao generated by MyEclipse Persistence Tools
 */

public class TGuahao implements java.io.Serializable
{

	private Integer id;
	private Integer muid;
	private Integer cuid;
	private String riqi;

	private String jibing;
	private String xingming;
	private String lianxi;
	private String zt;//预约成功--呆处理--预约失败
	
	private String huifu;
	private String shijian;
	private String numbb;
	private TUser user;


	
	public String getNumbb() {
		return numbb;
	}

	public void setNumbb(String numbb) {
		this.numbb = numbb;
	}

	public String getShijian() {
		return shijian;
	}

	public void setShijian(String shijian) {
		this.shijian = shijian;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
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

	public TUser getUser() {
		return user;
	}

	public void setUser(TUser user) {
		this.user = user;
	}
}