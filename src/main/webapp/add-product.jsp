<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="in.achyuta.bean.AdminBean"%>
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
       section{
       display: flex;
       justify-content: center;
       text-align: center;
       font-family: Arial;
       font-size: 22px;
       padding: 10px;
       width: 100%;
       }
       form div{
         padding: 5px;
       }
       form input{
          height: 30px;
          width: 300px;
          border-radius: 10px;
          text-align: center;
       }
       select{
          height: 35px;
          width: 310px;
          border-radius: 10px;
          text-align: center;
       }
       .button{
         height: 30px;
         width: 150px;
         background-color: green;
         color: white;
         border-radius: 10px;
         font-size: 15px;
         box-shadow: 2px 2px 2px blue;
       }
       h1{
	     font-size: 40px;
	     font-weight: bold;
	     color: blue;
	     text-shadow: 2px 2px 3px gray;
      }
      form {
	     border: 1px solid gray;
	     box-shadow: 2px 2px 10px black;
         padding: 15px;
         width: 100%;
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
            </nav>
            <div>
               <a href="logout">Logout</a>
            </div>
      </header>
      <%
          HttpSession sess=request.getSession(false);
          if(sess!=null){
        	  AdminBean bean=(AdminBean)session.getAttribute("adminBean");
        	  String errMsg=(String)request.getAttribute("errMsg");
      %>
      <section>
	       <div class="main">
	           <div>
	                <h1>Welcome : <%=bean.getFirstName() %></h1>
	           </div>
	           <div class="add-product">
	                <form action="addProduct" method="post">
	                         <div>Product Code</div>
					         <div>
					             <input type="text" name="pcode" placeholder="Enter Product Code" required="required">
					         </div>
					         <div>Product Name</div>
					         <div>
					               <input type="text" name="name" placeholder="Enter Product Name" required="required">
					         </div>
					        <div>Product Price</div>
					        <div>
					              <input type="text" name="price" placeholder="Enter Price" required="required">
					        </div>
					        <div>Product Quantity</div>
					        <div>
					               <input type="text" name="qty" placeholder="Enter Price" required="required">
					        </div>
					        <div>Product Type</div>
					        <div>
					              <select class="ptype" name="ptype" required="required">
							         <option value="">-Select Product Type-</option>
							         <option value="electronic">Electronics</option>
							         <option value="cloth">Clothing</option>
							         <option value="kitchen">Kitchen</option>
					               </select>
					        </div>
					        <div>
					            <input type="submit" value="Add" class="button">
					        </div>
	                </form>
	          </div>
	          <%
	             }else{
	          %>
	        	  <h1><%out.println("Session Expired :"); %></h1>
	      		
	      		<div>
	      		    <button><a href="admin-login.html">Login Again</a></button>
	      		</div>
	      		<%
	      			}
	      		%>
	      </div>
      </section>
      <footer>
           <p>Contact us  ?  <a>achyutakumarnayak123@gmail.com</a> visit Again </p>
       </footer>
       
</body>
</html>