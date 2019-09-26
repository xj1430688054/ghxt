package com.dao;

import com.model.TUser;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import java.util.List;

/**
 * A data access object (DAO) providing persistence and search support for
 * TUser entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see TUser
 * @author MyEclipse Persistence Tools
 */

public class TUserDAO extends HibernateDaoSupport
{
	private static final Log log = LogFactory.getLog(TUserDAO.class);
	// property constants
	public static final String LOGINNAME = "loginname";
	public static final String LOGINPW = "loginpw";
	public static final String XINGMING = "xingming";
	public static final String XINGBIE = "xingbie";
	public static final String NIANLING = "nianling";
	public static final String ADDRESS = "address";
	public static final String DIANHUA = "dianhua";
	public static final String YUE = "yue";
	public static final String DEL = "del";

	protected void initDao()
	{
		// do nothing
	}

	public void save(TUser transientInstance)
	{
		log.debug("saving TUser instance");
		try
		{
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re)
		{
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(TUser persistentInstance)
	{
		log.debug("deleting TUser instance");
		try
		{
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re)
		{
			log.error("delete failed", re);
			throw re;
		}
	}

	public TUser findById(Integer id)
	{
		log.debug("getting TUser instance with id: " + id);
		try
		{
			TUser instance = (TUser) getHibernateTemplate().get(
					"com.model.TUser", id);
			return instance;
		} catch (RuntimeException re)
		{
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TUser instance)
	{
		log.debug("finding TUser instance by example");
		try
		{
			List results = getHibernateTemplate().findByExample(instance);
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re)
		{
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value)
	{
		log.debug("finding TUser instance with property: " + propertyName
				+ ", value: " + value);
		try
		{
			String queryString = "from TUser as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re)
		{
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByLoginname(Object loginname)
	{
		return findByProperty(LOGINNAME, loginname);
	}

	public List findByLoginpw(Object loginpw)
	{
		return findByProperty(LOGINPW, loginpw);
	}

	public List findByXingming(Object xingming)
	{
		return findByProperty(XINGMING, xingming);
	}

	public List findByXingbie(Object xingbie)
	{
		return findByProperty(XINGBIE, xingbie);
	}

	public List findByNianling(Object nianling)
	{
		return findByProperty(NIANLING, nianling);
	}

	public List findByAddress(Object address)
	{
		return findByProperty(ADDRESS, address);
	}

	public List findByDianhua(Object dianhua)
	{
		return findByProperty(DIANHUA, dianhua);
	}

	public List findByYue(Object yue)
	{
		return findByProperty(YUE, yue);
	}

	public List findByDel(Object del)
	{
		return findByProperty(DEL, del);
	}

	public List findAll()
	{
		log.debug("finding all TUser instances");
		try
		{
			String queryString = "from TUser";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re)
		{
			log.error("find all failed", re);
			throw re;
		}
	}

	public TUser merge(TUser detachedInstance)
	{
		log.debug("merging TUser instance");
		try
		{
			TUser result = (TUser) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re)
		{
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(TUser instance)
	{
		log.debug("attaching dirty TUser instance");
		try
		{
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re)
		{
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(TUser instance)
	{
		log.debug("attaching clean TUser instance");
		try
		{
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re)
		{
			log.error("attach failed", re);
			throw re;
		}
	}

	public static TUserDAO getFromApplicationContext(ApplicationContext ctx)
	{
		return (TUserDAO) ctx.getBean("TUserDAO");
	}
}