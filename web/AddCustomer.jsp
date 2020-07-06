<%-- 
    Document   : customerManagement
    Created on : 23 juin 2020, 19:47:15
    Author     : lucas.relave
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%@page import="java.util.*" %>
<%@page import="modele.*" %>
<jsp:useBean id="cp" class="beans.resultatrequete" scope="request" />
<jsp:useBean id="dc" class="beans.resultatrequete" scope="request" />
<!DOCTYPE html>
<html>
     <%@include file="./header.jsp"%>
    <head>  
        <title>Création d'un client</title>     
    </head>
    <body>
        <div class="row justify-content-md-center mt-4">
            <div class="col-10">
                <h4>Formulaire de création du client</h4> 
            </div>
             <div class="col-12">
                <hr class="sidebar-divider" style="color:black">
            </div>
        </div>
    
        <div class="row justify-content-md-center mt-2">
            <div class="col-12">
               <form name="inscription" action="Controleur" method="POST">
                <div class="row justify-content-md-center mt-2">
                    <div class='col-2'>
                        <label class="col-form-label" for="nom">Nom</label>
                    </div>
                    <div class='col-4'>
                        <input class="form-control" type="text" name="nom" value="" id="nom" />
                    </div>
                </div>
                   
                <div class="row justify-content-md-center mt-2">
                   <div class='col-2'>
                       <label class="col-form-label" for="adresse">Adresse</label>
                   </div>
                   <div class='col-4'>
                       <input class="form-control" type="text" name="adresse" value="" id="adresse" />
                   </div>
                </div>
                
                <div class="row justify-content-md-center mt-2">
                   <div class='col-2'>
                        <label class="col-form-label" for="telephone">Téléphone</label>
                   </div>
                   <div class='col-4'>
                       <input class="form-control" type="number" name="telephone" value=""  id="tel" />
                   </div>
                </div>
                   
                <div class="row justify-content-md-center mt-2">
                   <div class='col-2'>
                        <label class="col-form-label" for="email">E-mail</label>
                   </div>
                   <div class='col-4'>
                        <input class="form-control" type="email" name="email" value=""  id="email"/>
                   </div>
                </div>  
                   
                <div class="row justify-content-md-center mt-2">
                   <div class='col-2'>
                        <label class="col-form-label" for="code_remise">Code Remise</label>
                   </div>
                   <div class='col-4'>
                        <select class="form-control" name="code_remise" id="dc"  style="height: 30px">
                            <% List <Object> res=dc.getResult();
                                for(Object enreg1 : res){
                                 out.println("<option>"+(Character)enreg1+"</option>");
                             }
                             %>
                        </select>
                   </div>
                </div> 
                        
                <div class="row justify-content-md-center  mt-2">
                   <div class='col-2'>
                        <label class="col-form-label" for="cp">Code Postal</label>
                   </div>
                   <div class='col-4'>
                       <select class="form-control" name="CP" id="cp" style="height: 30px">
                            <% for(Object enreg2 : cp.getResult()){
                                 out.println("<option>"+((MicroMarket)enreg2).getZipCode()+"</option>");
                             }
                             %>
                        </select>
                   </div>
                </div> 
                
                <div class=" row justify-content-end mt-2">
                   <div class='col-2'>
                     <input class="btn btn-warning" type="submit" value="Enregistrer" name="Operation" />   
                   </div>
                </div> 
 
        </form>
            </div> 
        </div> 
        
    </body>
</html>
