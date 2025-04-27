 <%@page import="in.achyuta.bean.CustomerBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
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
       
        h1{
          font-size: 40px;
		     font-weight: bold;
		     color: blue;
		     text-shadow: 2px 2px 3px gray;
        }
       
        .value div{
            display:flex;
            padding: 10px;
            justify-content:flex-start;
        }
        .value span{
           margin-right: 20px;
        }
        .value{
         padding: 10px;
         }
        a{
        text-decoration: none;
        margin-bottom: 20px;
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
        	  
       %>
       <section>
          <div>
		        <div>
		          <h1>Welcome :<%=cb.getFirstName() %></h1>
		           
		             <div class="main">
		                   <div>
		                        <h2>Product Bill</h2>
		                   </div>
		                   <div class="value">
			                   <div>
			                      <span>Name</span>
			                      <span>: <%=(String)request.getAttribute("pname")%></span>
			                   </div>
			                   <div>
			                     <span>Price</span>
			                     <span>: <%=(Double)request.getAttribute("pprice")%></span>
			                   </div>       
			                   <div>
			                       <span>Required Quantity</span>
			                       <span>: <%=(Integer)request.getAttribute("rqty") %></span>
			                   </div>
			                   <div>
			                       <span>Total Billing </span>
			                       <span>: <%=(Double)request.getAttribute("total") %></span>
			                   </div>
		                   </div>
		                    <div>
		                           <span>
		                               <a href="finalBuy?pcode=<%=(String)request.getAttribute("pcode") %>&qty=<%=(Integer)request.getAttribute("rqty") %>" class="button">Payment</a>
		                           </span> 
		                           <span>
		                                <a href="buy?pcode=<%=(String)request.getAttribute("pcode") %>" class="button">Back</a>
		                           </span>
		                    </div>
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

</body>
</html>