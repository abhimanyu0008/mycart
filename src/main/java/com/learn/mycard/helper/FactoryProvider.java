
package com.learn.mycard.helper;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryProvider {
    private static SessionFactory factory;
    public static SessionFactory getFactory(){
        try{
            if(factory==null){
            Configuration cfg=new Configuration();
            cfg.configure("hibernate.cfg.xml");
            factory=cfg.buildSessionFactory();
            }
            System.out.println("done");
        }catch(Exception e){
            e.printStackTrace();
        }
        return factory;
    }
     
}
