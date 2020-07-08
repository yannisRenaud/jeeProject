<%-- 
    Document   : login
    Created on : 19 juin 2020, 16:54:29
    Author     : Siong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <h1>Login</h1>
        <form action="j_security_check" method="post">
            <table style="with: 50%">
		<tbody>
                <tr>
                    <td>ID</td>
                    <td><input type="text" name="j_username"></td>
		</tr>
		<tr>    
                    <td>Password</td>
                    <td><input type="password" name="j_password"></td>
		</tr>
                </tbody>
            </table>
            <input type="submit" value="Login">
        </form>
    </body>
</html>
