<%@page import="in.achyuta.bean.CustomerBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
   header{
	    font-size: 30px;
	    padding: 15px;
	    font-family: Arial;
	    font-weight: bold;
	    height: auto;
	    width: auto;
	    color: whitesmoke;
	    background-color: rgb(69, 69, 164);
	    margin-bottom: 2%;
	    text-shadow: 2px 2px 5px brown;
	    display: flex;
	    justify-content: space-between;
     }
     header a{
        text-decoration: none;
        color: white;
        font-size: 15px;
        font-weight: bold;
       }
     footer{
          margin-top:5%;
           height: auto;
           width: auto;
           padding: 0.2%;
           text-align: center;
           background-color: rgb(69, 69, 164);
           color: white;
        }
        footer a{
          text-decoration: none;
          margin-left: 1%;
          margin-right: 1%;
        }
        section{
          display: flex;
          text-align: center;
          justify-content: center;
          font-family: Arial;
          font-size: 15px;
          font-weight: bold;
          padding: 15px;
        }
        .main div{
           padding: 10px;
        }
        .form{
             border: 1px solid gray;
		     box-shadow: 2px 2px 10px black;
	         padding: 15px;
	         width: 100%;
        }
        .main h1{
	        font-size: 40px;
		     font-weight: bold;
		     color: blue;
		     text-shadow: 2px 2px 3px gray;
        }
        .form h1{
           font-size: 30px;
           text-decoration: underline;
           text-shadow: 2px 2px 3px black;
           color: gray; 
        }
        .form h2{
           color: green;
           text-shadow: 2px 2px 5px gray;
        }
        .form a{
       
            display:inline-block;
             text-decoration: none;
	         width: 200px;
	         background-color: green;
	         color: white;
	         border-radius: 10px;
	         font-size: 15px;
	         box-shadow: 2px 2px 2px blue;
	         padding: 10px;
	         text-align: center;
        }
        .logout a{
        background-color: red;
        color: white;
        }
</style>
</head>
<body>
     <header>
            <div class="shop-name">
               Product Store
            </div>
            <nav>
               <span>
                 <a href="cust-dashboard.jsp">Home</a>
               </span>
               <span>
                   <a href="cust-view-all.jsp">View All Product</a>
               </span>
            </nav>
            <div>
               <a href="custLogout">Logout</a>
            </div>
      </header>
    <% 
         CustomerBean ab=(CustomerBean)session.getAttribute("cbean");
	    if(ab!=null){
        
    %>
    <section>
          <div class="main">
              <div>
			           <h1>Welcome : <%=ab.getFirstName() %></h1>
			 </div>
		      <div class="form">
		              <div>
                          <h1>Payment </h1>
                      </div>
				      <div>
				           <h2><%=(String)request.getAttribute("succMsg") %></h2>
				      </div>
				      <div>
				          <h3>You want to Buy more Product ?</h3>
				      </div>
				     <div>
				         <a href="custViewAll">View Product</a>
				     </div>
				      <div class="logout">
                        <a href="custLogout">Logout</a>
                      </div>
		      </div> 
		</div>
				<%
			          }else{
			     %>
	        	  <h1>    Session Expired ....!</h1>
	      		
	      		<div>
	      		    <button><a href="admin-login.html">Login Again</a></button>
	      		</div>
	      		<%
	      			}
	      		%>
    </section>
    <footer>
           <p>Contact us  ?  <a>achyutakumarnayak123@gmail.com</a> visit Again </p>
     </footer>
</body>
</html>