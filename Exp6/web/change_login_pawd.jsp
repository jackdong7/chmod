<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2017/12/17
  Time: 11:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>重置密码</title>
    <link rel="stylesheet" href="_css/My_daohang.css"/>
    <link rel="stylesheet" href="_css/login.css"/>
</head>
<body>
<div class="head">
    <ul>
        <div class="dropdown">
            <a href="#" class="dropbtn">学生信息管理</a>
            <div class="dropdown-content">
                <a href="stu_info_write.jsp">录入信息</a>
                <a href="stu_info_change.jsp">修改信息</a>
                <a href="stu_info_look.jsp">预览信息</a>
            </div>
        </div>
        <div class="dropdown">
            <a href="#" class="dropbtn">登录信息管理</a>
            <div class="dropdown-content">
                <a href="login_moreinfo.jsp">登录详情</a>
                <a href="change_login_pawd.jsp">重置登录密码</a>
            </div>
        </div>

        <div class="dropdown">
            <a href="#" class="dropbtn">课程管理</a>
            <div class="dropdown-content">
                <a href="my_course.jsp">已选课程</a>
                <a href="choose_course.jsp">新增选课</a>
            </div>
        </div>
        <a href="Login.jsp" style="text-decoration: solid;color: green ;float:right">注销</a>
    </ul>
</div>
<jsp:useBean id="read" class="myPackage.FirstBeen" scope="page"/>
<%
    String Num=(String) session.getAttribute("num");
    String sql1="select * from login_info where login_id='"+Num+"'";
    ResultSet rs=read.getRs(sql1);
    if(rs.next()){
        %>
<div class="page">
    <div class="loginwarrp">
        <div class="logo">注册</div>
        <div class="login_form">
            <form method="post">
                <ul class="login-item" style="background-color: white">
                    <span>账号:</span>
                    <input type="text" name="ID" class="login_input"  readonly="yes" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px " value=<%=rs.getString(1)%> >
                </ul>
                <ul class="login-item" style="background-color: white">
                    <span>输入密码:</span>
                    <input type="password" name="Password" id="Password" class="login_input" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px ">
                </ul>
                <ul class="login-item" style="background-color: white">
                    <span>再次输入:</span>
                    <input type="password" name="R_Password" id="R_Password" class="login_input" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px ">
                </ul>
                <ul class="login-item" style="background-color: white">
                    <span>身份:</span>
                    <input type="text" name="Identity" class="login_input" readonly="yes" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px " value=<%=rs.getString(3)%>>
                </ul>
                <ul class="login-sub" style="background-color: white">
                        <input type="submit" name="Submit"  value="确认修改" />
                </ul>

            </form>
        </div>
    </div>
</div>
        <%
    }
    rs.close();
%>
</body>

</html>
