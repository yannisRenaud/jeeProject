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
                <h4>Formulaire de création d'un client</h4> 
            </div>
            <div class="col-12">
                <hr class="sidebar-divider" style="color:black">
            </div>
        </div>
        <div class="row justify-content-md-center mt-2">
            <div class="col-12">
                <form id="formulaireAdd" action="AddCustomer.htm" method="POST">

                    <div class="row justify-content-md-center mt-2">

                        <div class="col-4">
                            <label for="inputIdClientUpdate">Numéro client</label>
                            <input type="number" class="form-control" name="customerId" id="inputIdClient" required>
                        </div>
                        <div class="col-4">
                            <label for="inputDiscountCodeUpdate">Discount Code</label>
                            <select type="text" class="form-control" name="discountCode" id="inputDiscountCode"  style="height: 30px" required>
                                 <c:forEach items="${codes}" var="code" >
                                     <option>${code.discountCode}</option>
                                 </c:forEach>
                            </select>
                        </div> 
                            
                    </div>


                    <div class="row justify-content-md-center mt-2">
                        <div class="col-4">
                            <label for="inputZipUpdate">Zip</label>
                             <select type="text" class="form-control" name="zip" id="inputZip" style="height: 30px" >
                                 <c:forEach items="${zips}" var="zip" >
                                     <option>${zip.zipCode}</option>
                                 </c:forEach>
                            </select>
                        </div>
                        <div class="col-4">             
                            <label for="inputNameUpdate">Nom</label>
                            <input type="text" class="form-control" name="name" id="inputName" required>
                        </div>
                    </div>


                    <div class="row justify-content-md-center mt-2">
                        <div class="col-4">
                            <label for="inputAddressline1Update">adresse 1</label>
                            <input type="text" class="form-control" name="addressline1" id="inputAddressline1" required>       
                        </div>   
                        <div class="col-4">
                            <label for="inputAddressline2Update">adresse 2</label>
                            <input type="text" class="form-control" name="addressline2" id="inputAddressline2" >
                        </div>
                    </div>


                    <div class="row justify-content-md-center mt-2">
                        <div class="col-4">
                            <label for="inputCityUpdate">Ville</label>
                            <input type="text" class="form-control" name="city" id="inputCity" required>
                        </div>

                        <div class="col-4">
                            <label for="inputStateUpdate">Region</label>
                            <input type="text" class="form-control" name="state" id="inputState" required>
                        </div>
                    </div>

                    <div class="row justify-content-md-center mt-2">
                        <div class="col-4">
                            <label for="inputPhoneUpdate">Telephone</label>
                            <input type="text" class="form-control" name="phone" id="inputPhone" required>
                        </div>

                        <div class="col-4">
                            <label for="inputFaxUpdate">Fax</label>
                            <input type="text" class="form-control" name="fax" id="inputFax" required>
                        </div>
                    </div>

                    <div class="row justify-content-md-center mt-2">
                        <div class="col-4">
                            <label for="inputEmailUpdate">Email</label>
                            <input type="text" class="form-control" name="email" id="inputEmail" required>
                        </div>

                        <div class="col-4">
                            <label for="inputCreditLimitUpdate">Limite de credit</label>
                            <input type="number" class="form-control" name="creditLimit" id="inputCreditLimit" required>
                        </div>
                    </div>
                    <div class="row justify-content-md-center mt-2">
                        <button type="submit" id="bouttonAdd" class="btn btn-primary">Ajouter le client</button>
                    </div>
                </form>
            </div> 
        </div>
    </body>
</html>
