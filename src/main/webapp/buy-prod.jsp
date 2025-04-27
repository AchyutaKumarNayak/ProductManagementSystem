<%@page import="in.achyuta.bean.CustomerBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="in.achyuta.bean.ProductBean "%>
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
          padding: 10px;
          border: 1px solid black; 
          border-radius: 5px;
          box-shadow: 2px 2px 5px white;
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
        justify-content: center;
        font-family: Arial;
        font-size: 25px;
        text-align: center;
        }
        .main{
        border: 1px solid blanchedalmond;
	    box-shadow: 1px 1px 5px black;
	    padding: 10px;
	    border-radius: 10px;
	    /* border-bottom: 2px solid green; */
	    font-weight: bold;
	    color: cornflowerblue;
	    display: inline-block;
	    text-align: center;
          
        }
        form div{
        padding: 10px;
        }
        .button{
         width: 100px;
         background-color: green;
         color: white;
         border-radius: 10px;
         font-size: 15px;
         box-shadow: 2px 2px 2px blue;
         padding: 10px;
        }
        h2{
          font-size: 50px;
           text-decoration: underline;
           text-shadow: 2px 2px 3px black;
           color: gray; 
        }
        form {
	       color: black;
	         padding: 15px;
	         width: 100%;
        }
        h1{
          font-size: 40px;
		     font-weight: bold;
		     color: blue;
		     text-shadow: 2px 2px 3px gray;
        }
       form input{
         padding: 10px;
	    border-radius: 10px;
	    /* border-bottom: 2px solid green; */
	    width: 300px;
	    font-weight: bold;
	    color: cornflowerblue;
	    display: inline-block;
	    text-align: center;
       }
        .value div{
            display:flex;
            padding: 10px;
            justify-content:flex-start;
        }
        .value span{
           margin-right: 20px;
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
                 <a href="cust-dashboard.jsp">Go to Home</a>
               </span>
               <span>
                   <a href="custViewAll">View All Product</a>
               </span>
            </nav>
            <div>
               <a href="custLogout">Logout</a>
            </div>
         </header> 
      <%
           
          CustomerBean cb= (CustomerBean)session.getAttribute("cbean");
           if(cb==null){ 
       %>
       
       <div>
           <h2>Session Expired.....</h2>
           <div>
		      <button><a href="admin-login.html">Login Again</a></button>
		   </div>
       </div>
       <%
           }else{
        	  
        	  ProductBean pb= (ProductBean)request.getAttribute("pbean");
       %>
       <section>
          <div>
		        <div>
		          <h1>Welcome :<%=cb.getFirstName() %></h1>
		           
		             <div class="main">
		                   <div>
		                        <h2>Buy product</h2>
		                   </div>
		                   <div class="value">
			                   <div>
			                      <span>Name</span>
			                      <span>: <%=pb.getProductName() %></span>
			                   </div>
			                   <div>
			                     <span>Price</span>
			                     <span>: <%=pb.getProductPrice() %></span>
			                   </div>       
			                   <div>
			                       <span>Available Stock</span>
			                       <span>: <%=pb.getProductQty() %></span>
			                   </div>
		                   </div>
		                   <form action="payment" method="post">
		                          
		                        <input type="hidden" name="pcode" value="<%=pb.getProductCode()%>">
		                        <input type="hidden" name="pname" value="<%=pb.getProductName()%>">
		                        <input type="hidden" name="pprice" value="<%=pb.getProductPrice()%>">
		                        <div>Required Quantity</div>
		                        <div>
		                             <input type="number" name="rqty" min="1" max="<%=pb.getProductQty()%>">
		                        </div>
		                        <div>
		                            <input type="submit" value="Buy" class="button">
		                        </div>
		                   </form>
		             </div>
		          </div>
          </div>
      </section>
      <% } %>
      <footer>
           <p>Contact us  ?  <a>achyutakumarnayak123@gmail.com</a> visit Again </p>
       </footer>
</body>
</html>