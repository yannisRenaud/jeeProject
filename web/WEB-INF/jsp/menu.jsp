<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp"%>
    <head>
        <title>Menu</title>
    </head>
    <body>
        <h1>Bienvenue <%= request.getSession().getAttribute("userName")%></h1>
   </body>
</html>
