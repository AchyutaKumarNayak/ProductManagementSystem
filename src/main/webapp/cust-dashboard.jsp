<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="in.achyuta.bean.CustomerBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
   header a{
        text-decoration: none;
        color: white;
        font-size: 15px;
        font-weight: bold;
       }
     header{
		    font-size: 30px;
		    padding: 15px;
		    font-family: Arial;
		    font-weight: bold;
		    height: auto;
		    width: auto;
		    color: whitesmoke;
		    background-color: rgb(69, 69, 164);
		    margin-bottom: 5%;
		    text-shadow: 2px 2px 5px brown;
		    display: flex;
		    justify-content: space-between;
      }
   section{
     display: flex;
     justify-content: center;
     text-align: center;
     font-family: Arial;
   }
   .main div{
     padding: 25px;
   }
   .main a{
        border: 1px solid blanchedalmond;
	    box-shadow: 1px 1px 5px black;
	    text-decoration: none;
	    padding: 10px;
	    border-radius: 10px;
	    /* border-bottom: 2px solid green; */
	    width: 300px;
	    font-weight: bold;
	    color: cornflowerblue;
	    display: inline-block;
	    
   }
   .main{
    font-family: Arial;
    border: 1px solid gray;
    box-shadow: 2px 2px 10px black;
    padding: 15px;
    
   }
   h1{
     font-size: 40px;
     font-weight: bold;
     color: blue;
     text-shadow: 2px 2px 3px gray;
   }
   footer{
           margin-top: 5%;
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
            <div>
               <a href="customer-login.html">Go Back</a>
            </div>
      </header>
		<%
		
		    CustomerBean bean=(CustomerBean)session.getAttribute("cbean");
		if(bean!=null){
		%>
	<section>
		<div class="main">
			     <div>
			          <h1>Welcome : <%=bean.getFirstName() %></h1>
			     </div>
			    
			    <div>
			        <a href="custViewAll">View All Product</a>
			    </div>
			    <div>
			        <a href="custLogout">LogOut</a>
			    </div>
		 </div>
	 </section>
		<%
			} else{
		%>
		<section>
		      <div>
		          <h1>Session Expired.....</h1>
		      </div>
		     <div>
			    <a href="customer-login.html">Login Again</a>
			</div>
		</section>
			
		<%
			}
		%>
		 <footer>
           <p>Contact us  ?  <a>achyutakumarnayak123@gmail.com</a> visit Again </p>
       </footer>
</body>
</html>