<%-- 
    Document   : invoice
    Created on : Apr 23, 2023, 4:51:42 PM
    Author     : PHAT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link  rel="stylesheet" href="mycss.css" type="text/css" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    </head>
    <body>
        <section style="display: flex; flex-direction: column;
                 height: 100vh;
                 background: #e1f5eb;
                 color: darkgreen;
                 align-items: center;
                 justify-content: center; padding-top: 5rem;
                 padding-bottom: 5rem;
                 font-size: 5rem;">
            <h1 style="font-size: 8rem;" class="card-title text-center">Thanks for your order</h1>
            <div>Total money: <%= request.getParameter("total")%>$</div>
        </div>
    </section>  
</body>
</html>
