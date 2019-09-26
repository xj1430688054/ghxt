package com.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.model.TYiyuan;

/**
 * A data access object (DAO) providing persistence and search support for
 * TYiyuan entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.model.TYiyuan
 * @author MyEclipse Persistence Tools
 */

public class TYiyuanDAO extends HibernateDaoSupport
{
	private static final Log log = LogFactory.getLog(TYiyuanDAO.class);
	// property constants
	public static final String MINGCHENG = "mingcheng";
	public static final String DIZHI = "dizhi";
	public static final String DIANHUA = "dianhua";
	public static final String DEL = "del";

	protected void initDao()
	{
		// do nothing
	}

	public void save(TYiyuan transientInstance)
	{
		log.debug("saving TYiyuan instance");
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

	public void delete(TYiyuan persistentInstance)
	{
		log.debug("deleting TYiyuan instance");
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

	public TYiyuan findById(java.lang.Integer id)
	{
		log.debug("getting TYiyuan instance with id: " + id);
		try
		{
			TYiyuan instance = (TYiyuan) getHibernateTemplate().get(
					"com.model.TYiyuan", id);
			return instance;
		} catch (RuntimeException re)
		{
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TYiyuan instance)
	{
		log.debug("finding TYiyuan instance by example");
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
		log.debug("finding TYiyuan instance with property: " + propertyName
				+ ", value: " + value);
		try
		{
			String queryString = "from TYiyuan as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re)
		{
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByMingcheng(Object mingcheng)
	{
		return findByProperty(MINGCHENG, mingcheng);
	}

	public List findByDizhi(Object dizhi)
	{
		return findByProperty(DIZHI, dizhi);
	}

	public List findByDianhua(Object dianhua)
	{
		return findByProperty(DIANHUA, dianhua);
	}

	public List findByDel(Object del)
	{
		return findByProperty(DEL, del);
	}

	public List findAll()
	{
		log.debug("finding all TYiyuan instances");
		try
		{
			String queryString = "from TYiyuan";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re)
		{
			log.error("find all failed", re);
			throw re;
		}
	}

	public TYiyuan merge(TYiyuan detachedInstance)
	{
		log.debug("merging TYiyuan instance");
		try
		{
			TYiyuan result = (TYiyuan) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re)
		{
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(TYiyuan instance)
	{
		log.debug("attaching dirty TYiyuan instance");
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

	public void attachClean(TYiyuan instance)
	{
		log.debug("attaching clean TYiyuan instance");
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

	public static TYiyuanDAO getFromApplicationContext(ApplicationContext ctx)
	{
		return (TYiyuanDAO) ctx.getBean("TYiyuanDAO");
	}
}