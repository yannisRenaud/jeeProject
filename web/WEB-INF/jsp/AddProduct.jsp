<%-- 
    Document   : customerManagement
    Created on : 23 juin 2020, 19:47:15
    Author     : lucas.relave
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
     <%@include file="./header.jsp"%>
    <head>  
        <title>Création d'un produit</title>     
    </head>
    <body>
        <div class="row justify-content-md-center mt-4">
            <div class="col-10">
                <h4>Formulaire de création d'un produit</h4> 
            </div>
             <div class="col-12">
                <hr class="sidebar-divider" style="color:black">
            </div>
        </div>
    
        <div class="row justify-content-md-center mt-2">
            <div class="col-12">
                <form id="formulaireAdd" action="AddProduct.htm" method="POST">
             
             
              <div class="row justify-content-md-center mt-2">
                  
                    <div class="col-4">
                        <label for="inputIdCommande">Id du produit</label>
                        <input type="number" class="form-control" name="productId" id="inputIdCommande" required>
                   </div>
                 <div class="col-4">
                        <label for="inputIdClient">Id du fabriquant</label>
                         <select type="number" class="form-control" name="idFabriquant" id="inputIdClient"  style="height: 30px" required >
                                 <c:forEach items="${fabriquants}" var="fabriquant" >
                                     <option>${fabriquant.manufacturerId}</option>
                                 </c:forEach>
                         </select>                 
                 </div>                
              </div>
             
             
             <div class="row justify-content-md-center mt-2">
                  <div class="col-4">
                        <label for="inputIdProduit">Code produit</label>
                           <input type="text" class="form-control" name="productCode" id="inputIdProduit" required>
                  </div>
                 <div class="col-4">             
                            <label for="inputQuantite">Prix d'achat</label>
                            <input type="number" class="form-control" name="purchaseCost" id="inputQuantite" required>
                 </div>
              </div>
             
             
              <div class="row justify-content-md-center mt-2">
                  <div class="col-4">
                        <label for="inputShippingCost">Quantité en stock</label>
                        <input type="number" class="form-control" name="quantity" id="inputShippingCost" required>       
                   </div>   
                 <div class="col-4">
                        <label for="inputSalesDate">Date de vente</label>
                        <input type="date" class="form-control" name="salesDate" id="inputSalesDate" required>
                 </div>
              </div>
             
             <div class="row justify-content-md-center mt-2">
                   <div class="col-4">
                         <label for="inputSalesDate">Markup</label>
                    <input type="number" class="form-control" name="markup" step=".01" max="99.99" id="inputSalesDate" required>
                   </div>
  
                 <div class="col-4">
                            <label for="inputShippingDate">Disponible</label>
                    <input type="text" class="form-control" name="available" id="inputShippingDate" required>
                 </div>
              </div>
              <div class="row justify-content-md-center mt-2">
                   <div class="col-4">
                       <label for="inputCompagny">Description</label>
                    <input type="text" class="form-control" name="description" id="inputCompagny" required>
                   </div>
  
               
              </div>
             <div class="row justify-content-md-center mt-2">
                    <button type="submit" id="bouttonAdd" class="btn btn-primary">Ajouter la vente</button>
              </div>
         </form>
        
            </div> 
        </div> 
        
    </body>
</html>
