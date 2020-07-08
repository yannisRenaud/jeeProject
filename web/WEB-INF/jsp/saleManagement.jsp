<%-- 
    Document   : customerManagement
    Created on : 23 juin 2020, 19:47:15
    Author     : lucas.relave
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%@page import="java.util.*" %>
<%@page import="modele.*" %>
<jsp:useBean id="resultat" class="beans.resultatrequete" scope="request" />
<!DOCTYPE html>
<html>
     <%@include file="./header.jsp"%>
    <head>  
        <title>Gestion de Vente</title>     
    </head>
    <body>
        <div class="row justify-content-md-center mt-4">
            <div class="col-10">
                <h4>Liste des clients</h4> 
            </div>
             <div class="col-12">
                <hr class="sidebar-divider" style="color:black">
            </div>
        </div>
        
        <div class="row justify-content-md-center mt-3">
            <div class="col-10">
                <button type="button" class="btn btn-danger">Création d'un client</button>
            </div>
        </div>
        
        <div class="row justify-content-md-center mt-2">
            <div class="col-10">
                 <form name="Result" action="Controleur" method="POST">
                <table class="table">
                <thead class="thead-dark">
                  <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Nom</th>
                    <th scope="col">Zip</th>
                    <th scope="col">Adresse</th>
                    <th scope="col">Code</th>
                    <th scope="col">Email</th>
                    <th scope="col"></th>
                    <th scope="col"></th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                        <%    List <Object> res=resultat.getResult();
                            for(Object  ligne : res){
                         out.println("<TR>");           
                         out.println("<TD> <input type=submit value="+String.valueOf(((Customer)ligne).getCustomerId())+" name=Operation /></TD>");
                         out.println("<TD>"+((Customer)ligne).getName()+"</TD>");
                         out.println("<TD>"+((Customer)ligne).getZip()+"</TD>");
                         out.println("<TD>"+((Customer)ligne).getAddressline1()+"</TD>");
                         out.println("<TD>"+((Customer)ligne).getDiscountCode()+"</TD>");
                         out.println("<TD>"+((Customer)ligne).getEmail()+"</TD>");
                         /*jointure réalisée par mappng xml
                         out.println("<TD>"+((Customer)resultat.getResult().get(i)).getName()+"</TD>");
                         out.println("<TD>"+((Customer)resultat.getResult().get(i)).getDiscountCode().getRate()+"</TD>");*/
                        %>
                       <td><button type="button" class="btn btn-outline-warning"><span class="glyphicon glyphicon-cog"></span> </button></td>
                       <td><button type="button" class="btn btn-outline-danger"><span class="glyphicon glyphicon-trash"></span> </button></td>   
                      <%
                          out.println("</TR>");
                     } %>
            
                                 
                  </tr>    
                </tbody>
                </table>
                </form>
            </div> 
        </div> 
        
    </body>
</html>
