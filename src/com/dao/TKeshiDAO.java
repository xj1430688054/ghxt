package com.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.model.TKeshi;

/**
 * Data access object (DAO) for domain model class TKeshi.
 * 
 * @see com.model.TKeshi
 * @author MyEclipse Persistence Tools
 */

public class TKeshiDAO extends HibernateDaoSupport
{
	private static final Log log = LogFactory.getLog(TKeshiDAO.class);

	protected void initDao()
	{
		// do nothing
	}

	public void save(TKeshi transientInstance)
	{
		log.debug("saving TKeshi instance");
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

	public void delete(TKeshi persistentInstance)
	{
		log.debug("deleting TKeshi instance");
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

	public TKeshi findById(java.lang.Integer id)
	{
		log.debug("getting TKeshi instance with id: " + id);
		try
		{
			TKeshi instance = (TKeshi) getHibernateTemplate().get(
					"com.model.TKeshi", id);
			return instance;
		} catch (RuntimeException re)
		{
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TKeshi instance)
	{
		log.debug("finding TKeshi instance by example");
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
		log.debug("finding TKeshi instance with property: " + propertyName
				+ ", value: " + value);
		try
		{
			String queryString = "from TKeshi as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re)
		{
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findAll()
	{
		log.debug("finding all TKeshi instances");
		try
		{
			String queryString = "from TKeshi";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re)
		{
			log.error("find all failed", re);
			throw re;
		}
	}

	public TKeshi merge(TKeshi detachedInstance)
	{
		log.debug("merging TKeshi instance");
		try
		{
			TKeshi result = (TKeshi) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re)
		{
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(TKeshi instance)
	{
		log.debug("attaching dirty TKeshi instance");
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

	public void attachClean(TKeshi instance)
	{
		log.debug("attaching clean TKeshi instance");
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

	public static TKeshiDAO getFromApplicationContext(ApplicationContext ctx)
	{
		return (TKeshiDAO) ctx.getBean("TKeshiDAO");
	}
}