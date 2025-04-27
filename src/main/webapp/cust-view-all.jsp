<%@page import="in.achyuta.bean.CustomerBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="in.achyuta.bean.ProductBean  , java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
     table {
	        border-collapse: collapse;
	        width: 80%;
	        margin: 20px auto;
	        background-color: black;
	        color: white;
        }
       th, td {
          border: 1px solid #333;
          padding: 10px;
          text-align: center;
        
        }
       
        td{
           background-color: lightgray;
           font-size: 15px;
           font-family: Arial;
           font-weight: bold;
        }
        header{
          margin-bottom: 2%;
          padding: 1%;
          display: flex;
          justify-content: space-between;
          background-color: rgb(69, 69, 164);
          color: white;
          text-align: center;
          font-family: arial;
        }
        header a{
          text-decoration: none;
          color: white;
          padding: 10px;
          border: 1px solid black; 
          border-radius: 5px;
          box-shadow: 2px 2px 5px white;
        }
        
        .store-name{
          font-size: 25px;
          font-weight: bold;
        }
        .logout{
         margin-top: 5px
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
        h2{
         font-size: 40px;
         font-weight: bold;
         font-family: Arial;
         text-shadow: 1px 1px 5px black;
         color: blue;
        }
        .action a{
          text-decoration: none;
          padding: 4px;
          border: 1px solid black; 
          border-radius: 5px;
          box-shadow: 2px 2px 5px black;
          margin-right: 10px;
        }
        .edit{
         background-color: green;
         color: white;
         
        }
        .delete{
         background-color: red;
         color: white;
         
        }
</style>
</head>
<body>
      <header>
        
             <div class="store-name">
                  Product Store
             </div>
             <div class="logout">
                 <span><a href="custLogout">Logout</a></span>
             </div>
         
      </header>
       <%
           CustomerBean ab=(CustomerBean)session.getAttribute("cbean");
           if(ab==null){
      %>
        <div>
              <h2>Session Expired..</h2>
              <div>
                 <button><a href="admin.login.html">Login Again</a></button>
              </div>
        </div>
        <%
           }else{
        	   
               List<ProductBean> products=(List<ProductBean>)session.getAttribute("products");
               if(products==null || products.isEmpty()){
         %>
               <div>
		            <table>
		                 <thead>
		                 <tr>
		                     <th>Product Code</th>
		                     <th>Product Name</th>
		                     <th>Product Price</th>
		                     <th>Product Quantity</th>
		                     <th>Product Category</th>
		                  </tr>  
		                 </thead>
		                 <tbody>
		                    <tr>
		                       <td colspan="6" style="text-align: center;">No Products found</td>
		                    </tr>
		                 </tbody>
		            </table>
            </div>
            <% 
                 }else {
                 
             %>
          <div>
             <h2 style="text-align:center;">Product List</h2>
            <table>
                 <thead>
                   <tr>
	                     <th>Product Code</th>
	                     <th>Product Name</th>
	                     <th>Product Price</th>
	                     <th>Product Quantity</th>
	                     <th>Product Category</th>
	                     <th>Action</th>
                   </tr>
                 </thead>
                
                 <tbody>
                     <%
                        for(ProductBean pb:products) {
                     %>
                    <tr>
                       <td><%=pb.getProductCode() %></td>
                       <td><%=pb.getProductName() %></td>
                       <td><%=pb.getProductPrice() %></td>
                       <td><%=pb.getProductQty() %></td>
                       <td><%=pb.getProductCategory() %></td>
                       <td class="action"><a href="buy?pcode=<%=pb.getProductCode()%>" class="edit">buy</a></td>
                    </tr>
                    <% } %>
                 </tbody>
            </table>
        </div>
        <%
               } 
           }
         %>
         <footer>
           <p>Contact us  ?  <a>achyutakumarnayak123@gmail.com</a> visit Again </p>
       </footer>
</body>
</html>