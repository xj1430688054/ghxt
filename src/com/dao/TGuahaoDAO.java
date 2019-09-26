package com.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.model.TGuahao;

/**
 * Data access object (DAO) for domain model class TGuahao.
 * 
 * @see com.model.TGuahao
 * @author MyEclipse Persistence Tools
 */

public class TGuahaoDAO extends HibernateDaoSupport
{
	private static final Log log = LogFactory.getLog(TGuahaoDAO.class);

	protected void initDao()
	{
		// do nothing
	}

	public void save(TGuahao transientInstance)
	{
		log.debug("saving TGuahao instance");
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

	public void delete(TGuahao persistentInstance)
	{
		log.debug("deleting TGuahao instance");
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

	public TGuahao findById(java.lang.Integer id)
	{
		log.debug("getting TGuahao instance with id: " + id);
		try
		{
			TGuahao instance = (TGuahao) getHibernateTemplate().get(
					"com.model.TGuahao", id);
			return instance;
		} catch (RuntimeException re)
		{
			log.error("get failed", re);
			throw re;
		}
	}
	public int count(java.lang.Integer id)
	{
		log.debug("getting TGuahao instance with id: " + id);
		try
		{
			String hql = "select count(*) from User u"; 
//			this.getSession().createSQLQuery(hql).
		} catch (RuntimeException re)
		{
			log.error("get failed", re);
			throw re;
		}
		return 2;
	}

	public List findByExample(TGuahao instance)
	{
		log.debug("finding TGuahao instance by example");
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
		log.debug("finding TGuahao instance with property: " + propertyName
				+ ", value: " + value);
		try
		{
			String queryString = "from TGuahao as model where model."
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
		log.debug("finding all TGuahao instances");
		try
		{
			String queryString = "from TGuahao";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re)
		{
			log.error("find all failed", re);
			throw re;
		}
	}

	public TGuahao merge(TGuahao detachedInstance)
	{
		log.debug("merging TGuahao instance");
		try
		{
			TGuahao result = (TGuahao) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re)
		{
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(TGuahao instance)
	{
		log.debug("attaching dirty TGuahao instance");
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

	public void attachClean(TGuahao instance)
	{
		log.debug("attaching clean TGuahao instance");
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

	public static TGuahaoDAO getFromApplicationContext(ApplicationContext ctx)
	{
		return (TGuahaoDAO) ctx.getBean("TGuahaoDAO");
	}

	public void deleteee() {
		// TODO Auto-generated method stub
		String a="";
		this.getSession().createSQLQuery("delete from  t_guahao where length(lianxi)=0  ").executeUpdate();
		
	}
}