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
        <div id="clientManagement">
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
                        <td scope="row">${client.customerId}</td>
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
        </div>
        
        <div id="UpdateClient">
        <div class="row justify-content-md-center mt-4">
            <div class="col-10">
                <h4>Formulaire de modification d'un client</h4> 
            </div>
             <div class="col-12">
                <hr class="sidebar-divider" style="color:black">
            </div>
        </div>
    
        <div class="row justify-content-md-center mt-2">
            <div class="col-12">
                <form id="formulaireUpdate" action="UpdateClient.htm" method="POST">
             
             
              <div class="row justify-content-md-center mt-2">

                        <div class="col-4">
                            <label for="inputIdClientUpdate">Numéro client</label>
                            <input type="number" class="form-control" name="customerId" id="inputIdClientUpdate" required>
                        </div>
                        <div class="col-4">
                            <label for="inputDiscountCodeUpdate">Discount Code</label>
                            <input type="text" class="form-control" name="discountCode" id="inputDiscountCodeUpdate" required>
                        </div> 
                            
                    </div>

                    <div class="row justify-content-md-center mt-2">
                        <div class="col-4">
                            <label for="inputZipUpdate">Zip</label>
                             <input type="text" class="form-control" name="zip" id="inputZipUpdate">
                        </div>
                        <div class="col-4">             
                            <label for="inputNameUpdate">Nom</label>
                            <input type="text" class="form-control" name="name" id="inputNameUpdate" required>
                        </div>
                    </div>


                    <div class="row justify-content-md-center mt-2">
                        <div class="col-4">
                            <label for="inputAddressline1Update">adresse 1</label>
                            <input type="text" class="form-control" name="addressline1" id="inputAddressline1Update" required>       
                        </div>   
                        <div class="col-4">
                            <label for="inputAddressline2Update">adresse 2</label>
                            <input type="text" class="form-control" name="addressline2" id="inputAddressline2Update" >
                        </div>
                    </div>


                    <div class="row justify-content-md-center mt-2">
                        <div class="col-4">
                            <label for="inputCityUpdate">Ville</label>
                            <input type="text" class="form-control" name="city" id="inputCityUpdate" required>
                        </div>

                        <div class="col-4">
                            <label for="inputStateUpdate">Region</label>
                            <input type="text" class="form-control" name="state" id="inputStateUpdate" required>
                        </div>
                    </div>

                    <div class="row justify-content-md-center mt-2">
                        <div class="col-4">
                            <label for="inputPhoneUpdate">Telephone</label>
                            <input type="text" class="form-control" name="phone" id="inputPhoneUpdate" required>
                        </div>

                        <div class="col-4">
                            <label for="inputFaxUpdate">Fax</label>
                            <input type="text" class="form-control" name="fax" id="inputFaxUpdate" required>
                        </div>
                    </div>

                    <div class="row justify-content-md-center mt-2">
                        <div class="col-4">
                            <label for="inputEmailUpdate">Email</label>
                            <input type="text" class="form-control" name="email" id="inputEmailUpdate" required>
                        </div>

                        <div class="col-4">
                            <label for="inputCreditLimitUpdate">Limite de credit</label>
                            <input type="number" class="form-control" name="creditLimit" id="inputCreditLimitUpdate" required>
                        </div>
                    </div>
                    <div class="row justify-content-md-center mt-2">
                        <button type="submit" id="bouttonUpdate" class="btn btn-primary">Modifier le client</button>
                    </div>
         </form>
        
            </div> 
        </div> 
        
    </div>    
    </body>
</html>

<script>
     $(document).ready(function(){
       
         $("#formulaireSupp").hide();
         $("#clientManagement").show();
         $("#UpdateClient").hide();
         
         $(".BtnUpdate").click(function() {
                let columns = $(".colonnesData").find('td');
                const orderId = $(".colonnesData").attr('id');
                const customerId = columns.eq(0).html();
                const discountCode = columns.eq(1).html();
                const zip = columns.eq(2).html();
                const name =  columns.eq(3).html();
                const addressline1 =  columns.eq(4).html();
                const addressline2 =  columns.eq(5).html();
                const city =  columns.eq(6).html();
                const state =  columns.eq(7).html();
                const phone =  columns.eq(8).html();
                const fax =  columns.eq(9).html();
                const email =  columns.eq(10).html();
                const creditLimit =  columns.eq(11).html();
                $("#inputIdClientUpdate").val(customerId);               
                $("#inputDiscountCodeUpdate").val(discountCode);
                $("#inputZipUpdate").val(zip);
                $("#inputNameUpdate").val(name);
                $("#inputAddressline1Update").val(addressline1);
                $("#inputAddressline2Update").val(addressline2);
                $("#inputCityUpdate").val(city);
                $("#inputStateUpdate").val(state);
                $("#inputPhoneUpdate").val(phone);
                $("#inputFaxUpdate").val(fax);
                $("#inputEmailUpdate").val(email);
                $("#inputCreditLimitUpdate").val(creditLimit);
                $("#UpdateClient").show();
                $("#clientManagement").hide();
            });  
          
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