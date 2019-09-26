package com.model;

/**
 * TYiyuan entity. @author MyEclipse Persistence Tools
 */

public class TYiyuan implements java.io.Serializable
{

	// Fields

	private Integer id;
	private String mingcheng;
	private String dizhi;
	private String dianhua;
	
	private String del;

	// Constructors

	/** default constructor */
	public TYiyuan()
	{
	}

	/** full constructor */
	public TYiyuan(String mingcheng, String dizhi, String dianhua, String del)
	{
		this.mingcheng = mingcheng;
		this.dizhi = dizhi;
		this.dianhua = dianhua;
		this.del = del;
	}

	// Property accessors

	public Integer getId()
	{
		return this.id;
	}

	public void setId(Integer id)
	{
		this.id = id;
	}

	public String getMingcheng()
	{
		return this.mingcheng;
	}

	public void setMingcheng(String mingcheng)
	{
		this.mingcheng = mingcheng;
	}

	public String getDizhi()
	{
		return this.dizhi;
	}

	public void setDizhi(String dizhi)
	{
		this.dizhi = dizhi;
	}

	public String getDianhua()
	{
		return this.dianhua;
	}

	public void setDianhua(String dianhua)
	{
		this.dianhua = dianhua;
	}

	public String getDel()
	{
		return this.del;
	}

	public void setDel(String del)
	{
		this.del = del;
	}

}