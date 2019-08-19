<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.fasterxml.jackson.databind.node.ArrayNode,java.util.List,masui_java.StaticList"%>
<%@ page import="java.util.*" %>
<!doctype html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>ログイン画面</title>
<link href="<%=request.getContextPath()%>/tei_css/login.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/tei_css/default.css" rel="stylesheet" type="text/css">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link href='http://fonts.googleapis.com/css?family=Raleway:400,200' rel='stylesheet' type='text/css'>

</head>
<body>


<br>

<header>

<!-- ヘッダーはじまり -->
<div align="center">
<a href="<%=request.getContextPath() %>/"><img src="<%=request.getContextPath() %>/img/investagram.png" width="240px"></a>
</div>

</header>

<div class="container">
	<div class="row login_box">
	    <div class="col-md-12 col-xs-12" align="center">
            <div class="line"><h3>12 : 30 AM</h3></div>
            <div class="outter"><img src="http://lorempixel.com/output/people-q-c-100-100-1.jpg" class="image-circle"/></div>
            <h1>Hi Guest</h1>

	    </div>


        <div class="col-md-12 col-xs-12 login_control">
         <form action="<%=request.getContextPath()%>/login" method="POST">
                <div class="control">
                    <div class="label">User_id</div>
                    <input type="text" class="form-control" name="user_id" placeholder="User_id" required="required"/>
                </div>

                <div class="control">
                     <div class="label">Password</div>
                    <input type="password" class="form-control" name="password" placeholder="Password" required="required"/>
                </div>
                <div align="center">
                     <button type="submit" class="btn btn-orange">LOGIN</button>
                </div>
        </form>

        </div>



    </div>
</div>
<div align="center" >
	<%String word;
	if (!(request.getAttribute("errorMessage")==null)){
		word = (String)request.getAttribute("errorMessage");}
	else{
		word = "";
		}
	%>
	<font color="red"><%=word%></font>

</div>
</body>
</html>