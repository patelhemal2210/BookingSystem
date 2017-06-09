<%-- 
    Document   : login
    Created on : 9-Apr-2017, 11:35:48 PM
    Author     : Denmick
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="entity.Room"%>
<%@page import="java.util.List"%>
<%@page import="entity.Customer"%>
<%@page import="session.EntityAccessorBeanRemote"%>
<%@page import="session.AdminSessionBeanRemote"%>
<%@page import="javax.naming.InitialContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        testing
        <%if (request.getParameter("loginEmail") != null && request.getParameter("loginPassword") != null) {
                String email = request.getParameter("loginEmail");
                String password = request.getParameter("loginPassword");
                // if(request.getParameter("loginEmail").toString() == "xxx@xxx.com" && request.getParameter("loginPassword").toString()== "xxx"){
                if (email.equals("xxx@xxx.com") && password.equals("xxx")) {
                    //response.sendRedirect("admin");
                    //return;
                    request.getRequestDispatcher("admin.jsp").forward(request, response);

                } else {
                    //include file = "dummy.jsp";
                    response.sendRedirect("dummy");
                    return;

                }
            } else {
                //include file = "dummy.jsp";
                response.sendRedirect("dummy");
                return;

            }
        %>
    </body>
</html>
