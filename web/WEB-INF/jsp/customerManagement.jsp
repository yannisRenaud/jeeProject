<%-- 
    Document   : customerManagement
    Created on : 23 juin 2020, 19:47:15
    Author     : lucas.relave
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
     <%@include file="./header.jsp"%>
    <head>  
        <title>Gestion de client</title>    
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
            <form id="formulaireSupp" action="suppCustomer.htm" method="POST">
                 
                  <div class="col" id="inputIds">
                         <input type="text"  name="clientsIds" id="clientsIds">
                   </div>
                 
                  <button type="submit" id="bouttonSupp" class="btn btn-primary">Supprimer le client</button>
             </form>
            <div class="col-10">
                <a href="AddCustomerView.htm"><button type="button" class="btn btn-danger">Création d'un client</button></a>
            </div>
        </div>
        
        <div class="row justify-content-md-center mt-2">
            <div class="col-10">
                <table class="table">
                <thead class="thead-dark">
                  <tr>
                  <th scope="col">Numéro client</th>
                 <th scope="col">Discount Code</th>
                 <th scope="col">Zip</th>
                 <th scope="col">Nom</th>
                 <th scope="col">adresse 1</th>
                 <th scope="col">adresse 2</th>
                 <th scope="col">Ville</th>
                 <th scope="col">Etat</th>
                 <th scope="col">Telephone</th>
                 <th scope="col">Fax</th>
                 <th scope="col">Email</th>
                  <th scope="col">Limite de crédit</th>
                  <th scope="col"></th>
                  <th scope="col"></th>

                  </tr>
                </thead>
                <tbody>
                  <c:forEach items="${clients}" var="client">
                  <tr class="colonnesData" id =${client.customerId}>   
                    <th scope="row">${client.customerId}</th>
                    <td>${client.discountCode}</td>
                    <td>${client.zip}</td>
                    <td>${client.name}</td>
                    <td>${client.addressline1}</td>
                    <td>${client.addressline2}</td>
                    <td>${client.city}</td>
                    <td>${client.state}</td>
                    <td>${client.phone}</td>
                    <td>${client.fax}</td>
                    <td>${client.email}</td>
                    <td>${client.creditLimit}</td>     
                    <td><button class="btn btn-outline-warning BtnUpdate" type="button" id =${client.customerId}><span class="glyphicon glyphicon-cog"></span> </button></td>
                    <td><button type="button" class="btn btn-outline-danger BtnDelete" id =${client.customerId}><span class="glyphicon glyphicon-trash"></span> </button></td>                       
                  </tr>  
                  </c:forEach>
                </tbody>
                </table>
            </div> 
        </div> 
    </body>
</html>

<script>
     $(document).ready(function(){
       
         $("#formulaireSupp").hide();
          
             $(".BtnDelete").click(function() {
                  $("#formulaireSupp").show();
                 const customerId = $(".BtnDelete").attr('id');
                 var ids = $("#clientsIds").val().split("-");
                 
                 const index = ids.indexOf("");
                            if (index > -1) {
                              ids.splice(index, 1);
                            }
                 if( $(this).hasClass("toDelete")){
                     $(this).removeClass("toDelete");
                         const index = ids.indexOf(customerId);
                            if (index > -1) {
                              ids.splice(index, 1);
                            }
                 }
                 else{
                     $(this).addClass("toDelete");
                     ids.push(customerId)
                 }
                  
                $("#clientsIds").val(ids.join('-'));
                
                if(ids.join('-') == ''){
                     $("#bouttonSupp").prop("disabled",true);
                }else{
                    $("#bouttonSupp").prop("disabled",false);

                }
                
                });
     });
    
</script>