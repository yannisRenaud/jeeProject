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
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Locale;
import org.hibernate.Transaction;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import beans.User;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import modele.Customer;
import modele.Product;
import modele.PurchaseOrder;
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
        
    @RequestMapping("logout.htm")
    public String logout (HttpServletRequest request) {
        HttpSession session=request.getSession();  
        session.invalidate();
        user = null;
        return "redirect:/"; 
    }
 
 //    Client___________________________________________________________________________________________________________________
    @RequestMapping("customerManagement.htm")
    public ModelAndView clients(){
        
         if(user != null){
            Session session = createSession();
            List<Customer> customers = session.createQuery("From Customer").list();
            session.close();
            return new ModelAndView("customerManagement").addObject("clients", customers);
        }
        else{
            ModelAndView model = new ModelAndView("dashboard");
            model.setViewName("redirect:/");
            return model;
        }
         
     }
    
    //            View ajouter client 
     @RequestMapping("AddCustomerView.htm")
     public ModelAndView AddCustomer(){
      
         if(user != null){
            return new ModelAndView("AddCustomer");
        }
        else{
            ModelAndView model = new ModelAndView("dashboard");
            model.setViewName("redirect:/");
            return model;
        }  
    }
     
      @RequestMapping(value="AddCustomer.htm",method=RequestMethod.POST)
    public ModelAndView createClient(@RequestParam("customerId") int customerId ,@RequestParam("discountCode") char discountCode , 
                                    @RequestParam("zip") String zip , @RequestParam("name") String name ,
                                    @RequestParam("addressline1") String addressline1 , @RequestParam("addressline2") String addressline2 ,
                                    @RequestParam("city") String city , @RequestParam("state") String state ,
                                    @RequestParam("phone") String phone , @RequestParam("fax") String fax ,
                                    @RequestParam("email") String email , @RequestParam("creditLimit") Integer creditLimit ){
        
         if(user != null){
             
              Transaction tx= null;  
              Session session = createSession();
               String message = null;
           try 
           {
                tx= session.beginTransaction();
                Customer customer = new Customer();
                customer.setCustomerId(customerId);
                customer.setDiscountCode(discountCode);
                customer.setZip(zip);
                customer.setName(name);
                customer.setAddressline1(addressline1);
                customer.setAddressline2(addressline2);
                customer.setCity(city);
                customer.setState(state);
                customer.setPhone(phone);
                customer.setFax(fax);
                customer.setEmail(email);
                customer.setCreditLimit(creditLimit);
                session.save(customer);
                session.flush();
                tx.commit();
                
                message = "Insertion réussie";

           }
           catch(Exception e){
               if (tx!= null) {tx.rollback();}
                message = "Erreur : " +e.getMessage();
           }
           
            
          
            return  new ModelAndView("resultVue").addObject("message", message);
          
     
        }
        else{
            ModelAndView model = new ModelAndView();
            model.setViewName("redirect:/");
            return model;
        }
     
    }
    
     @RequestMapping(value="suppCustomer.htm",method=RequestMethod.POST)
    public ModelAndView suppClients(@RequestParam("clientsIds") String clientsIds ){
        
      if(user != null){
             
              Transaction tx= null;  
              Session session = createSession();
              String message = null;
           try 
           {
                tx= session.beginTransaction();
               String[] ids = clientsIds.split("-");
      
          
               for(int i = 0; i < ids.length; i++) {
                   Customer customer = (Customer) session.load(Customer.class, Integer.parseInt(ids[i]));
                    session.delete(customer);
             }
              
              
                session.flush();
                tx.commit();
                
                 message = "Delete réussie";
               

           }
           catch(Exception e){
               if (tx!= null) {tx.rollback();}
                message = "Erreur : " +e.getMessage();
                System.out.println("e.getMessage() :"+e.getMessage());
           }
         
            
          
            return  new ModelAndView("resultVue").addObject("message", message);
          
     
        }
        else{
            ModelAndView model = new ModelAndView();
            model.setViewName("redirect:/");
            return model;
        }
    
    }
         
    
//    Vente___________________________________________________________________________________________________________________
        @RequestMapping("saleManagement.htm")
    public ModelAndView ventes(){
      
         if(user != null){
         
            Session session = createSession();
            List<PurchaseOrder> orders = session.createQuery("From PurchaseOrder").list();
            session.close();
            return new ModelAndView("saleManagement").addObject("ventes", orders);
        }
        else{
            ModelAndView model = new ModelAndView("dashboard");
            model.setViewName("redirect:/");
            return model;
        }
         
    }
//            View ajouter vente 
     @RequestMapping("AddSale.htm")
     public ModelAndView createVente(){
      
         if(user != null){
            return new ModelAndView("AddSale");
        }
        else{
            ModelAndView model = new ModelAndView("dashboard");
            model.setViewName("redirect:/");
            return model;
        }
         
    }

//           Post View ajouter vente 
    @RequestMapping(value="AddSaletest.htm",method=RequestMethod.POST)
    public ModelAndView createVente(@RequestParam("idClient") int idClient ,@RequestParam("idProduit") int idProduit , 
                                    @RequestParam("quantite") int quantite , @RequestParam("shippingCost") BigDecimal shippingCost ,
                                    @RequestParam("salesDate") String salesDate , @RequestParam("shippingDate") String shippingDate ,
                                    @RequestParam("compagnyName") String compagnyName , @RequestParam("OrderNum") int OrderNum ){
        
         if(user != null){
             
              Transaction tx= null;  
              Session session = createSession();
               String message = null;
               
           try 
           {
               SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd", Locale.FRENCH);
              
                tx= session.beginTransaction();
                PurchaseOrder order = new PurchaseOrder();
                order.setCustomerId(idClient);
                order.setProductId(idProduit);
                order.setQuantity((short)quantite);
                order.setShippingCost(shippingCost);
                order.setShippingDate(formatter.parse(shippingDate));
                order.setSalesDate(formatter.parse(salesDate));
                order.setFreightCompany(compagnyName);
                order.setOrderNum(OrderNum);
                session.save(order);
                session.flush();
                tx.commit();
                
                message = "Insertion réussie";

           }
           catch(Exception e){
               if (tx!= null) {tx.rollback();}
                message = "Erreur : " +e.getMessage();
           }
               
            
          
            return  new ModelAndView("resultVue").addObject("message", message);
          
     
        }
        else{
            ModelAndView model = new ModelAndView();
            model.setViewName("redirect:/");
            return model;
        }
     
    }

    @RequestMapping(value="suppVentes.htm",method=RequestMethod.POST)
        public ModelAndView suppVentes(@RequestParam("ventesIds") String ventesIds ){

          if(user != null){

                  Transaction tx= null;  
                  Session session = createSession();
                  String message = null;
               try 
               {
                    tx= session.beginTransaction();
                   String[] ids = ventesIds.split("-");


                   for(int i = 0; i < ids.length; i++) {
                        PurchaseOrder order = (PurchaseOrder) session.load(PurchaseOrder.class, Integer.parseInt(ids[i]));
                         session.delete(order);
                  }


                     session.flush();
                     tx.commit();

                      message = "Delete réussie";


                }
                catch(Exception e){
                    if (tx!= null) {tx.rollback();}
                     message = "Erreur : " +e.getMessage();
                     System.out.println("e.getMessage() :"+e.getMessage());
                }
                session.close();


                 return  new ModelAndView("resultVue").addObject("message", message);


             }
             else{
                 ModelAndView model = new ModelAndView();
                 model.setViewName("redirect:/");
                 return model;
             }

         }
  

 //    Stock_____________________________________________________________________________________________________________________
  @RequestMapping("stockManagement.htm")
    public ModelAndView stocks(){
        
         if(user != null){
            Session session = createSession();
            List<Product> products = session.createQuery("From Product").list();
            session.close();           
            return new ModelAndView("stockManagement").addObject("stocks", products);
        }
        else{
            ModelAndView model = new ModelAndView("dashboard");
            model.setViewName("redirect:/");
            return model;
        }
    }
    
    //            View ajouter produit 
     @RequestMapping("AddProductView.htm")
     public ModelAndView AddProductView(){
      
         if(user != null){
            return new ModelAndView("AddProduct");
        }
        else{
            ModelAndView model = new ModelAndView("dashboard");
            model.setViewName("redirect:/");
            return model;
        }
         
    }
     
     
     // Post view ajouter produit 
     @RequestMapping(value="AddProduct.htm",method=RequestMethod.POST)
    public ModelAndView createStock(@RequestParam("productId") int productId, @RequestParam("idFabriquant") int idFabriquant, 
                                    @RequestParam("productCode") String productCode, @RequestParam("purchaseCost") BigDecimal purchaseCost,
                                    @RequestParam("quantity") int quantity, @RequestParam("markup") BigDecimal markup,
                                    @RequestParam("available") String available, @RequestParam("description") String description ){
        if(user != null){
            Transaction tx = null;  
            Session session = createSession();
            String message = null;
            try {
                tx = session.beginTransaction();
                Product product = new Product();
                product.setProductId(productId);
                product.setManufacturerId(idFabriquant);
                product.setProductCode(productCode);
                product.setPurchaseCost(purchaseCost);
                product.setQuantityOnHand(quantity);
                product.setMarkup(markup);
                product.setAvailable(available);
                product.setDescription(description);
                session.save(product);
                session.flush();
                tx.commit();
                message = "Insertion réussie";
            }
            catch(Exception e){
                if (tx!= null) {
                    tx.rollback();
                }
                message = "Erreur : " +e.getMessage();
            }
//            session.close();
            return  new ModelAndView("resultVue").addObject("message", message);
        }
        else {
            ModelAndView model = new ModelAndView();
            model.setViewName("redirect:/");
            return model;
        }
    }
    
    
       //       View update produit 
     @RequestMapping("UpdateProduit.htm")
    public ModelAndView UpdateProduit(@RequestParam("idProduit") int idProduit, @RequestParam("idFabriquant") int idFabriquant, 
                                    @RequestParam("productCode") String productCode, @RequestParam("purchaseCost") BigDecimal purchaseCost,
                                    @RequestParam("quantity") int quantity, @RequestParam("markup") BigDecimal markup,
                                    @RequestParam("available") String available, @RequestParam("description") String description ){
        
        if(user != null){
            Transaction tx= null;  
            Session session = createSession();
            String message = null;
            try {
                tx= session.beginTransaction();
                List<Product> products = session.createQuery("From Product Where productId= :num").setParameter("num", idProduit).list();        
                if(products.size() == 1 ){
                    Product product = products.get(0);
                    product.setProductId(idProduit);
                    product.setManufacturerId(idFabriquant);
                    product.setProductCode(productCode);
                    product.setPurchaseCost(purchaseCost);
                    product.setQuantityOnHand(quantity);
                    product.setMarkup(markup);
                    product.setAvailable(available);
                    product.setDescription(description);
                    session.save(product);
                    session.flush();
                    tx.commit();
                    message = "Update réussie";
                }
                else {
                    message = "Il y a 0 ou plusieurs produit avec ce numéro";
                }
            }
            catch(Exception e){
                if (tx!= null) {
                    tx.rollback();
                }
                System.out.println(e.getMessage());
                message = "Erreur : " +e.getMessage();
            }
//            session.close();
            return  new ModelAndView("resultVue").addObject("message", message);
        }
        else {
            ModelAndView model = new ModelAndView();
            model.setViewName("redirect:/");
            return model;
        }
    }
    
     @RequestMapping(value="suppStocks.htm",method=RequestMethod.POST)
    public ModelAndView suppStocks(@RequestParam("stocksIds") String stocksIds ){
        if(user != null){
            Transaction tx= null;  
            Session session = createSession();
            String message = null;
            try {
                tx= session.beginTransaction();
                String[] ids = stocksIds.split("-");
                for(int i = 0; i < ids.length; i++) {
                    Product order = (Product) session.load(Product.class, Integer.parseInt(ids[i]));
                    session.delete(order);
                }
                session.flush();
                tx.commit();
                message = "Delete réussie";
            }
            catch(Exception e){
                if (tx!= null) {
                    tx.rollback();
                }
                message = "Erreur : " +e.getMessage();
                System.out.println("e.getMessage() :"+e.getMessage());
            }
//            session.close();
            return  new ModelAndView("resultVue").addObject("message", message);
        }
        else {
            ModelAndView model = new ModelAndView();
            model.setViewName("redirect:/");
            return model;
        }
    }
}