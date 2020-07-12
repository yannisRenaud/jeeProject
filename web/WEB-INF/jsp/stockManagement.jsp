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
        <title>Gestion du stock</title> 
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        
    </head>
    <body >
        <div id="stockMangement">
        <div class="row justify-content-md-center mt-4">
            <div class="col-10">
                <h4>Liste des stocks</h4> 
            </div>
             <div class="col-12">
                <hr class="sidebar-divider" style="color:black">
            </div>
        </div>
        
        <div class="row justify-content-md-center mt-3">
            
            <form id="formulaireSupp" action="suppStocks.htm" method="POST">
                  <div class="col" id="inputIds">
                         <input type="text"  name="stocksIds" id="stocksIds">
                   </div>
                  <button type="submit" id="bouttonSupp" class="btn btn-primary">Supprimer le produit</button>
             </form>
            
            <div class="col-10">
                <a href="AddProductView.htm"><button type="button" class="btn btn-danger">Création d'un produit</button></a>
            </div>
            
        </div>
        <div class="row justify-content-md-center mt-2">
            <div class="col-10">
                 <form name="Result" action="Controleur" method="POST">
                <table class="table">
                <thead class="thead-dark">
                  <tr>
                    <th scope="col">Numéro produit</th>
                    <th scope="col">Id du fabriquant</th>
                    <th scope="col">Code produit</th>
                    <th scope="col">Prix d'achat</th>
                    <th scope="col">Quantité en stock</th>
                    <th scope="col">Markup</th>
                    <th scope="col">Disponible</th>
                    <th scope="col">Description</th>
                    <th scope="col"></th>
                    <th scope="col"></th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                     <c:forEach items="${stocks}" var="stock">
                        <tr class="colonnesDataUpdate" id =${stock.productId}>   
                            <th scope="row">${stock.productId}</th>
                            <TD>${stock.manufacturerId}</TD>
                            <TD>${stock.productCode}</TD>
                            <TD>${stock.purchaseCost}</TD>
                            <TD>${stock.quantityOnHand}</TD>
                            <TD>${stock.markup}</TD>
                            <TD>${stock.available}</TD>
                            <TD>${stock.description}</TD>
                            <td><button class="btn btn-outline-warning BtnUpdate" type="button" id =${stock.productId}><span class="glyphicon glyphicon-cog"></span> </button></td>
                            <td><button type="button" class="btn btn-outline-danger BtnDelete" id =${stock.productId}><span class="glyphicon glyphicon-trash"></span> </button></td>     
                        </tr>
                    </c:forEach>               
                  </tr>    
                </tbody>
                </table>
                </form>
            </div> 
        </div> 
    </div>
        
   <div id="UpdateProduct">
        <div class="row justify-content-md-center mt-4">
            <div class="col-10">
                <h4>Formulaire de modification d'un produit</h4> 
            </div>
             <div class="col-12">
                <hr class="sidebar-divider" style="color:black">
            </div>
        </div>
    
        <div class="row justify-content-md-center mt-2">
            <div class="col-12">
                <form id="formulaireUpdate" action="UpdateProduit.htm" method="POST">
             
             
              <div class="row justify-content-md-center mt-2">
                  
                    <div class="col-4">
                        <label for="inputIdCommandeUpdate">Id du produit</label>
                        <input type="number" class="form-control" name="idProduit" id="inputIdCommandeUpdate" required>
                   </div>
                 <div class="col-4">
                        <label for="inputIdClientUpdate">Id du fabriquant</label>                     
                        <input type="number" class="form-control" name="idFabriquant" id="inputIdClientUpdate"  required>                  
                 </div>                
              </div>
             
             
             <div class="row justify-content-md-center mt-2">
                  <div class="col-4">
                        <label for="inputIdProduitUpdate">Code produit</label>
                           <input type="text" class="form-control" name="productCode" id="inputIdProduitUpdate" required>
                  </div>
                 <div class="col-4">             
                            <label for="inputQuantiteUpdate">Prix d'achat</label>
                            <input type="number" class="form-control" name="purchaseCost" id="inputQuantiteUpdate" required>
                 </div>
              </div>
             
             
              <div class="row justify-content-md-center mt-2">
                  <div class="col-4">
                        <label for="inputShippingCostUpdate">Quantité en stock</label>
                        <input type="number" class="form-control" name="quantity" id="inputShippingCostUpdate" required>       
                   </div>   
                  <div class="col-4">
                       <label for="inputCompagnyUpdate">Description</label>
                    <input type="text" class="form-control" name="description" id="inputCompagnyUpdate" required>
                   </div>
                
              </div>
             
             <div class="row justify-content-md-center mt-2">
                   <div class="col-4">
                         <label for="inputSalesDateUpdate">Markup</label>
                    <input type="number" class="form-control" name="markup" step=".01" max="99.99" id="inputSalesDateUpdate" required>
                   </div>
  
                 <div class="col-4">
                            <label for="inputShippingDateUpdate">Disponible</label>
                    <input type="text" class="form-control" name="available" id="inputShippingDateUpdate" required>
                 </div>
              </div>
              
             <div class="row justify-content-md-center mt-2">
                    <button type="submit" id="bouttonAdd" class="btn btn-primary">Modifier la vente</button>
              </div>
         </form>
        
            </div> 
        </div> 
        
    </div>      
    </body>
    
</html>

<script>
     $(document).ready(function(){
         $("#stockMangement").show();
         $("#UpdateProduct").hide();
         $("#formulaireSupp").hide();
         
         $(".BtnUpdate").click(function() {
                let columns = $(".colonnesDataUpdate").find('td');
                const orderId = $(".colonnesDataUpdate").attr('id');
                const clientId = columns.eq(0).html();
                const produitId = columns.eq(1).html();
                const quantity =  columns.eq(2).html();
                const travelPrice =  columns.eq(3).html();
                const salesDate =  columns.eq(4).html();
                const sendDate =  columns.eq(5).html();
                const company =  columns.eq(6).html();
                $("#inputIdCommandeUpdate").val(orderId);               
                $("#inputIdClientUpdate").val(clientId);
                $("#inputIdProduitUpdate").val(produitId);
                $("#inputQuantiteUpdate").val(quantity);
                $("#inputShippingCostUpdate").val(travelPrice);
                $("#inputSalesDateUpdate").val(salesDate);
                $("#inputShippingDateUpdate").val(sendDate);
                $("#inputCompagnyUpdate").val(company);
                $("#UpdateProduct").show();
                $("#stockMangement").hide();
            });  
            
            
             $(".BtnDelete").click(function() {
                 $("#formulaireSupp").show();
                const orderId = $(this).attr('id');
                console.log(orderId);
                var ids = $("#stocksIds").val().split("-");
                console.log(ids);
                const index = ids.indexOf("");
                if (index > -1) {
                  ids.splice(index, 1);
                }
                if($(this).hasClass("toDelete")){
                    $(this).removeClass("toDelete");
                    const index = ids.indexOf(orderId);
                    if (index > -1) {
                      ids.splice(index, 1);
                    }
                }
                else{
                    $(this).addClass("toDelete");
                    ids.push(orderId)
                }
                $("#stocksIds").val(ids.join('-'));
                console.log(ids.join('-'));
                if(ids.join('-') == ''){
                    $("#bouttonSupp").prop("disabled",true);
                }else{
                    $("#bouttonSupp").prop("disabled",false);
                }
            });
     });
    
</script>
