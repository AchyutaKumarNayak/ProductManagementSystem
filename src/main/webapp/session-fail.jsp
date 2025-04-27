<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
  body{
   height: vh;
   width: 1200px;
   margin:5%;
   padding: 15px;
  }
 section{
           align-content:center;
          display: flex;
          text-align: center;
          justify-content: center;
          font-family: Arial;
          font-size: 15px;
          font-weight: bold;
          padding: 15px;
   }
   .main h2{
      color: red;
      text-shadow: 2px 2px 4px blue;
   }
   .main div{
       padding: 15px;
   }
   .main{
     border: 1px solid gray;
     box-shadow: 2px 2px 10px black;
   }
   .main a{
     text-decoration: none;
     width: 250px;
     color: white;
     background-color: blue;
     padding: 5px;
   }
</style>
</head>
<body>
     <section>
        <div class="main">
          <div>
             <h2><%=(String)request.getAttribute("errMsg") %></h2>
          </div>
          <div>
             <a href="home.html">LogIn Again</a>
          </div>
        </div>
     </section>
</body>
</html>