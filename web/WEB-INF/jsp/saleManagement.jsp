<%-- 
    Document   : saleManagement
    Created on : 23 juin 2020, 19:47:15
    Author     : lucas.relave
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
     <%@include file="./header.jsp"%>
    <head>  
        <title>Gestion de Vente</title>     
    </head>
    <body>
        <div class="row justify-content-md-center mt-4">
            <div class="col-10">
                <h4>Liste des ventes</h4> 
            </div>
             <div class="col-12">
                <hr class="sidebar-divider" style="color:black">
            </div>
        </div>
        
        <div class="row justify-content-md-center mt-3">
            <div class="col-10">
                <a href="AddSale.htm"><button type="button" class="btn btn-danger">Création d'une vente</button></a>
            </div>
        </div>
        
        <div class="row justify-content-md-center mt-2">
            <div class="col-10">
                <table class="table">
                <thead class="thead-dark">
                 <tr>
                    <th scope="col">Numéro de commande</th>
                    <th scope="col">Id du client</th>
                    <th scope="col">Id du produit</th>
                    <th scope="col">Quantité</th>
                    <th scope="col">Prix du voyage</th>
                    <th scope="col">Date de vente</th>
                    <th scope="col">Date d'envoie</th>
                    <th scope="col">compagny d'envoie</th>
                    <th scope="col"></th>
                    <th scope="col"></th>
               </tr>
                </thead>
                <tbody>
                    <c:forEach items="${ventes}" var="vente">
                  <TR class="colonnesDataUpdate" id =${vente.orderNum} >   
                    <th scope="row">${vente.orderNum}</th>
                    <TD >${vente.customerId}</TD>
                    <TD>${vente.productId}</TD>
                    <TD>${vente.quantity}</TD>
                    <TD>${vente.shippingCost}</TD>
                    <TD>${vente.salesDate}</TD>
                    <TD>${vente.shippingDate}</TD>
                    <TD>${vente.freightCompany}</TD>
                    <td><button type="button" class="btn btn-outline-warning"><span class="glyphicon glyphicon-cog"></span> </button></td>
                    <td><button type="button" class="btn btn-outline-danger"><span class="glyphicon glyphicon-trash"></span> </button></td>                
                  </tr> 
                  </c:forEach>
                </tbody>
                </table>
                </form>
            </div> 
        </div> 
        
    </body>
</html>
