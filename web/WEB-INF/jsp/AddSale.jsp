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
        <title>Création d'une vente</title>     
    </head>
    <body>
        <div class="row justify-content-md-center mt-4">
            <div class="col-10">
                <h4>Formulaire de création d'une vente</h4> 
            </div>
            <div class="col-12">
                <hr class="sidebar-divider" style="color:black">
            </div>
        </div>

        <div class="row justify-content-md-center mt-2">
            <div class="col-12">
                <form id="formulaireAdd" action="AddSaletest.htm" method="POST">

                    <div class="row justify-content-md-center mt-2">

                        <div class="col-4">
                            <label for="inputIdCommande">Id de la commande</label>
                            <input type="text" class="form-control" name="OrderNum" id="inputIdCommande" required>
                        </div>
                        <div class="col-4">
                            <label for="inputIdClient">Id du client</label>
                             <select  type="number" class="form-control" name="idClient" id="inputIdClient" style="height: 30px" required >
                                 <c:forEach items="${customers}" var="customer" >
                                     <option>${customer.customerId}</option>
                                 </c:forEach>
                            </select>
                            

                        </div>                
                    </div>


                    <div class="row justify-content-md-center mt-2">
                        <div class="col-4">
                            <label for="inputIdProduit">Id du produit</label>
                            <select type="number" class="form-control" name="idProduit" id="inputIdProduit" style="height: 30px" required >
                                 <c:forEach items="${produits}" var="produit" >
                                     <option>${produit.productId}</option>
                                 </c:forEach>
                            </select>
                        </div>
                        <div class="col-4">             
                            <label for="inputQuantite">Quantité</label>
                            <input type="number" class="form-control" name="quantite" id="inputQuantite" required>
                        </div>
                    </div>


                    <div class="row justify-content-md-center mt-2">
                        <div class="col-4">
                            <label for="inputShippingCost">Coût du transport</label>
                            <input type="number" class="form-control" name="shippingCost" step=".01" id="inputShippingCost" required>       
                        </div>   
                        <div class="col-4">
                            <label for="inputSalesDate">Date de vente</label>
                            <input type="date" class="form-control" name="salesDate" id="inputSalesDate" required>
                        </div>
                    </div>
                    <div class="row justify-content-md-center mt-2">
                        <div class="col-4">
                            <label for="inputShippingDate">Date de livraison</label>
                            <input type="date" class="form-control" name="shippingDate" id="inputShippingDate" required>
                        </div>

                        <div class="col-4">
                            <label for="inputCompagny">Compagny de livraison</label>
                            <input type="text" class="form-control" name="compagnyName" id="inputCompagny" required>
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
