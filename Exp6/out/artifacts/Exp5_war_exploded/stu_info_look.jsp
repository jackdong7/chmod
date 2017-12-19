<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2017/12/17
  Time: 9:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>信息浏览[学生]</title>
<link rel="stylesheet" href="_css/My_daohang.css"/>
    <link rel="stylesheet" href="_css/login.css"/>


</head>
<body bgcolor="#faebd7">
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
    String Num=(String)session.getAttribute("num");
    String sql="select * from stu_info where stu_id='"+Num+"'";
    ResultSet rs=read.getRs(sql);
    if(rs.next()){
        %>
<div class="page">
    <div class="loginwarrp">
        <div class="logo">学生信息</div>
        <div class="login_form">
            <form method="post" id="Login">
                <ul class="login-item" style="background-color: white">
                    <span>学号:</span>
                    <input type="text" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px " readonly="true" value=<%=rs.getString(1)%>>
                </ul>
                <ul class="login-item" style="background-color: white">
                    <span>姓名:</span>
                    <input type="text" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px "  readonly="true" value=<%=rs.getString(2)%>>
                </ul>
                <ul class="login-item" style="background-color: white">
                    <span>性别:</span>
                    <input type="text" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px " readonly="true" value=<%=rs.getString(3)%>>
                </ul>

                <ul class="login-item" style="background-color: white">
                    <span>电话:</span>
                    <input type="text" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px " readonly="true" value=<%=rs.getString(4)%>>
                </ul>
                <ul class="login-item" style="background-color: white">
                    <span>班级:</span>
                    <input type="text" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px " readonly="true" value=<%=rs.getString(5)%>>
                </ul>
                <ul class="login-item" style="background-color: white">
                    <span>家庭住址:</span>
                    <input type="text" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px "  readonly="true" value=<%=rs.getString(6)%>>
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
