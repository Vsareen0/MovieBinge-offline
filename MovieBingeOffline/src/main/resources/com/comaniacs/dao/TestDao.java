package com.comaniacs.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.orm.hibernate5.HibernateTemplate;

import com.comaniacs.models.Test;

public class TestDao {
	
	HibernateTemplate template;  
	
	public void setTemplate(HibernateTemplate template) {  
	    this.template = template;  
	}  
	
	//method to save Test  
	public void saveTest(Test e){  
	    template.save(e);  
	}  
	
	//method to update Test  
	public void updateTest(Test e){  
	    template.update(e);  
	}  
	
	//method to delete Test  
	public void deleteTest(Test e){  
	    template.delete(e);  
	}  
	
	//method to return one Test of given id  
	public Test getById(int id){  
	    Test e=(Test)template.get(Test.class,id);  
	    return e;  
	}  
	
	//method to return all Tests  
	public List<Test> getTests(){  
	    List<Test> list=new ArrayList<Test>();  
	    list=template.loadAll(Test.class);  
	    return list;  
	}  
}
