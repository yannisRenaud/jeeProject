/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

/**
 *
 * @author Siong
 */

import beans.User;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ApplicationController {
    
    private User user;
    private SessionFactory sf;
    
    
    
    private SessionFactory getSessionFactoryInstance(){
        
        if(sf == null){
            sf = new Configuration().configure().buildSessionFactory();
        }
        return sf;
    }
    
    private Session createSession(){
        SessionFactory sessionFactory = getSessionFactoryInstance();
        return sessionFactory.openSession();
    }

    @RequestMapping("index.htm")
    public ModelAndView login(HttpServletRequest request) {
        if(request != null){
             if(request.getUserPrincipal()!=null){ 
                System.out.println("UserName : " + request.getUserPrincipal().getName());
                user = new User(request.getUserPrincipal().getName());
                HttpSession session = request.getSession();
                session.setAttribute("userName", user.getUsername());
             }  
        }
        
        if(user != null){
            return new ModelAndView("menu");
        }
   
        return new ModelAndView("login");
      
    }

}
