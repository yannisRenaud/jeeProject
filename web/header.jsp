<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">  
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <div class="row" id="navMenu">
        <div class="col-10 mt-2">
             <nav class="nav">
                <a class="nav-link" href="Index.htm"><span class="glyphicon glyphicon-home"></span> Accueil</a>
                <a class="nav-link" href="customerManagement.htm"><span class="glyphicon glyphicon-user"></span> Gestion des clients</a>
                <a class="nav-link" href="productManagement.htm"><span class="glyphicon glyphicon-list-alt"></span> Gestion des produits </a>
                <a class="nav-link" href="saleManagement.htm"><span class="glyphicon glyphicon-usd"></span> Gestion des ventes </a>
             </nav>
        </div>
        <div class="col-2 mt-2">
             <button type="button" href="logout.htm" class="btn btn-danger">Deconnexion</button>
        </div>   
    </div>
   
</html>
