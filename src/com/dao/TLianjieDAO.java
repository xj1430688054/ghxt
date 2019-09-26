package com.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.model.TLianjie;

/**
 * Data access object (DAO) for domain model class TLianjie.
 * 
 * @see com.model.TLianjie
 * @author MyEclipse Persistence Tools
 */

public class TLianjieDAO extends HibernateDaoSupport
{
	private static final Log log = LogFactory.getLog(TLianjieDAO.class);

	// property constants
	public static final String NAME = "name";

	public static final String URL = "url";

	public static final String DEL = "del";

	protected void initDao()
	{
		// do nothing
	}

	public void save(TLianjie transientInstance)
	{
		log.debug("saving TLianjie instance");
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

	public void delete(TLianjie persistentInstance)
	{
		log.debug("deleting TLianjie instance");
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

	public TLianjie findById(java.lang.Integer id)
	{
		log.debug("getting TLianjie instance with id: " + id);
		try
		{
			TLianjie instance = (TLianjie) getHibernateTemplate().get(
					"com.model.TLianjie", id);
			return instance;
		} catch (RuntimeException re)
		{
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TLianjie instance)
	{
		log.debug("finding TLianjie instance by example");
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
		log.debug("finding TLianjie instance with property: " + propertyName
				+ ", value: " + value);
		try
		{
			String queryString = "from TLianjie as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re)
		{
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByName(Object name)
	{
		return findByProperty(NAME, name);
	}

	public List findByUrl(Object url)
	{
		return findByProperty(URL, url);
	}

	public List findByDel(Object del)
	{
		return findByProperty(DEL, del);
	}

	public List findAll()
	{
		log.debug("finding all TLianjie instances");
		try
		{
			String queryString = "from TLianjie";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re)
		{
			log.error("find all failed", re);
			throw re;
		}
	}

	public TLianjie merge(TLianjie detachedInstance)
	{
		log.debug("merging TLianjie instance");
		try
		{
			TLianjie result = (TLianjie) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re)
		{
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(TLianjie instance)
	{
		log.debug("attaching dirty TLianjie instance");
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

	public void attachClean(TLianjie instance)
	{
		log.debug("attaching clean TLianjie instance");
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

	public static TLianjieDAO getFromApplicationContext(ApplicationContext ctx)
	{
		return (TLianjieDAO) ctx.getBean("TLianjieDAO");
	}
}