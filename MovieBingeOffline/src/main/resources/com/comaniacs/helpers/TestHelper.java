package com.comaniacs.helpers;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.comaniacs.configurations.HibernateUtil;
import com.comaniacs.models.Test;

public class TestHelper {
	
	Session session = null;
	
	public TestHelper() {
		this.session = HibernateUtil.getSessionFactory().getCurrentSession();
	}
	
	@SuppressWarnings("unchecked")
	public List<Test> getName() {
		List<Test> tests = null;
		try {
			Transaction tx = session.beginTransaction();
			@SuppressWarnings("rawtypes")
			Query q = session.createQuery("From Test");
			tests = (List<Test>) q.list();
			tests.forEach(v -> System.out.println(v.getId()+"  "+v.getName()));
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return tests;
	}
	
}
