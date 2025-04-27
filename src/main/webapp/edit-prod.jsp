<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="in.achyuta.bean.AdminBean , in.achyuta.bean.ProductBean "%>
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
        form input{
        border: 1px solid blanchedalmond;
	    box-shadow: 1px 1px 5px black;
	    padding: 10px;
	    border-radius: 10px;
	    /* border-bottom: 2px solid green; */
	    width: 300px;
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
        form h2{
          font-size: 30px;
           text-decoration: underline;
           text-shadow: 2px 2px 3px black;
           color: gray; 
        }
        form {
	       border: 1px solid gray;
		     box-shadow: 2px 2px 10px black;
	         padding: 15px;
	         width: 100%;
        }
        h1{
          font-size: 40px;
		     font-weight: bold;
		     color: blue;
		     text-shadow: 2px 2px 3px gray;
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
                 <a href="admin-dashboard.jsp">Go to Home</a>
               </span>
               <span>
                   <a href="adminViewAll">View All Product</a>
               </span>
               <span>
                     <a href="add-product.jsp">Add Product</a>
               </span>
            </nav>
            <div>
               <a href="logout">Logout</a>
            </div>
         </header> 
      <%
           HttpSession ses=request.getSession(false);
           if(ses==null){ 
       %>
       
       <div>
           <h2>Session Expired.....</h2>
           <div>
		      <button><a href="admin-login.html">Login Again</a></button>
		   </div>
       </div>
       <%
           }else{
        	  AdminBean ab= (AdminBean)session.getAttribute("adminBean");
        	  ProductBean pb= (ProductBean)request.getAttribute("pbean");
       %>
       <section>
          <div>
		        <div>
		          <h1>Welcome :<%=ab.getFirstName() %></h1>
		           
		             <div>
		                   <form action="update" method="post">
		                          <div>
		                              <h2>Edit product</h2>
		                          </div>
		                        <input type="hidden" name="pcode" value="<%=pb.getProductCode()%>">
		                        <input type="hidden" name="pname" value="<%=pb.getProductName()%>">
		                        <div>Product Price</div>
		                        <div>
		                            <input type="text" name="pprice" value="<%=pb.getProductPrice() %>">
		                        </div>
		                        <div>Product Quantity</div>
		                        <div>
		                             <input type="text" name="pqty" value="<%=pb.getProductQty()%>">
		                        </div>
		                        <div>
		                            <input type="submit" value="Edit" class="button">
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