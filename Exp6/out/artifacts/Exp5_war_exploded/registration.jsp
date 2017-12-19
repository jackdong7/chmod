<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2017/10/12
  Time: 10:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
<html>
<head>
    <title>注册</title>
    <link rel="stylesheet" href="_css/login.css"/>
    <link rel="stylesheet" href="_css/My_Button.css"/>
    <link rel="stylesheet" href="assets/css/reset.css"/>
    <link rel="stylesheet" href="assets/css/supersized.css"/>
    <script src="_js/login.js" type="text/javascript"></script>
    <script src="_js/jquery.min.js" type="text/javascript"></script>
    <script src="_js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript">
        var time=5;
        function returnUrlByTime() {
            window.setTimeout('returnUrlByTime()',1000);
            document.getElementById("layer").innerHTML =time;
            time=time-1;
        }
    </script>
</head>
<body onload="returnUrlByTime()">
<div class="page">
    <div class="loginwarrp">
        <div class="logo">注册</div>
        <div class="login_form">
            <form method="post">
                <ul class="login-item">
                    <span>账号:</span>
                    <input type="text" name="ID" class="login_input">
                </ul>
                <ul class="login-item">
                    <span>密码:</span>
                    <input type="password" name="Password" class="login_input">
                </ul>
                <ul class="login-item">

                    <span>身份:</span>

                    <input type="radio" name="Identity" value="学生">学生

                    <input type="radio" name="Identity" value="教师">教师
                </ul>
                <ul>
                    <li class="login-sub">
                        <input type="submit" name="Submit" value="注册" />
                </ul>

                </form>
            </div>
    </div>
</div>
<jsp:useBean id="read" class="myPackage.FirstBeen" scope="page"/>
<jsp:useBean id="write" class="myPackage.FirstBeen" scope="page"/>

<%
    request.setCharacterEncoding("UTF-8");
    String tableName="login_info";
    String id=request.getParameter("ID");
    String password=request.getParameter("Password");
    String identity=request.getParameter("Identity");
    if(id!=null&&password!=null&&identity!=null){
        String sql="select * from login_info where login_id='"+id+"'";
        ResultSet rs=read.getRs(sql);
        if(!rs.next()){
            String sql2="INSERT into "+tableName+"(login_id,login_pswd,login_identity)"+" values('"+id+"','"+password+"','"+identity+"')";
            write.write_in(sql2);
            %>
            <font color="white"><h1 align="center" >注册成功<span id="layer">2</span>秒后返回登录页</h1></font>
            <%
            response.setHeader("Refresh","2;URL=Login.jsp");
        }else{
            %>
                <script>
                    alert("用户名已存在");
                </script>
            <%
        }
        rs.close();

    }
    %>
                <script type="text/javascript">
                window.onload = function() {
                var config = {
                vx : 4,
                vy : 4,
                height : 2,
                width : 2,
                count : 100,
                color : "121, 162, 185",
                stroke : "100, 200, 180",
                dist : 6000,
                e_dist : 20000,
                max_conn : 10
                }
                CanvasParticle(config);
                }
                </script>
                <script type="text/javascript" src="_js/canvas-particle.js"></script>



</body>
</html>
