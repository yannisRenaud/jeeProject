<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="./header.jsp"%>
    <head>
        <title>Menu</title>
    </head>
    <body>
        <h1>choisissez une opération dans la liste suivante</h1>
        <form name="form" action="Controleur" method="POST">
        <select name="Operation">
            <option>Afficher tous les enregistrements</option>
            <option>inserer un enregistrement</option>
            <option>rechercher un enregistrement</option>
        </select>
            <input type="submit" value="Valider" name="validation" />
        </form>
    </body>
</html>
