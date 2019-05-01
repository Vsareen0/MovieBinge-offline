package com.comaniacs.utils;

import java.math.BigInteger;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.query.Query;

import com.comaniacs.configurations.HibernateUtil;

public class Functions {
	Session session;
	
	@SuppressWarnings("rawtypes")
	public int getCount() {
		session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        
		String hql = "SELECT COUNT(*) FROM MOVIE;";
		Query query = session.createSQLQuery(hql);
		List results = query.list();
		
		Integer count  = ((BigInteger) results.get(0)).intValue();
		
		session.close();
		
		return count;
	}
	
}
