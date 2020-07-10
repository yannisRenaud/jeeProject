<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
              <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
       <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">  
        
    </head>
    <div class="row" id="navMenu">
        <div class="col-10 mt-2">
             <nav class="nav">
                <a class="nav-link" href="#"><span class="glyphicon glyphicon-home"></span> Accueil</a>
                <a class="nav-link" href="customerManagement.htm"><span class="glyphicon glyphicon-user"></span> Gestion des clients</a>
                <a class="nav-link" href="saleManagement.htm"><span class="glyphicon glyphicon-usd"></span> Gestion des ventes </a>
                <a class="nav-link" href="stockManagement.htm"><span class="glyphicon glyphicon-list-alt"></span> Gestion des stocks </a>
                
                     
             </nav>
        </div>
        <div class="col-2 mt-2">
            <a href="logout.htm"><button type="button" class="btn btn-danger">Deconnexion</button></a>
        </div>   
    </div>
   
</html>

<style>
    body{
    font-size: 1.7em

    }
    .nav {
    text-decoration: none;
    color: #f8f9fc;
    }
    .nav a {
      color: rgba(255,255,255,.6); 
    }
    .nav > .active {
    color: white;

    }

    .nav > .active a {
    color: white;
    }

    .nav > a:hover {
    text-decoration: none;
    color: white;
    border-bottom: white solid 2px;
    }
    #navMenu{
    background-color: darkslategray;
    padding: 10px;
    }
  
</style>