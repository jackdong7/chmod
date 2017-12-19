<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2017/12/17
  Time: 18:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录详情</title>
    <link rel="stylesheet" href="_css/My_daohang.css"/>
    <link rel="stylesheet" href="_css/My_table.css"/>

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

    <table id="customers">
    <tr>
        <th>登录账户</th>
        <th>登录IP</th>
        <th>登录时间</th>
    </tr>
    <%
        String Num=(String)session.getAttribute("num");
        String sql="select * from login_in_info where login_id='"+Num+"' order by login_time desc";
        ResultSet rs=read.getRs(sql);
        while(rs.next()){
            %>
                <tr>
                    <td><%=rs.getString(1)%></td>
                    <td><%=rs.getString(2)%></td>
                    <td><%=rs.getString(3)%>></td>
                </tr>
            <%
        }
        rs.close();
    %>
    </table>
</body>
</html>
