<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2017/12/17
  Time: 18:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>我的课程</title>
    <link rel="stylesheet" href="_css/My_daohang.css"/>
    <link rel="stylesheet" href="_css/My_Button.css"/>
    <style>
        #customers
        {
            position:absolute;
            top:6%;
            font-family:"Trebuchet MS", Arial, Helvetica, sans-serif;
            width:100%;
            border-collapse:collapse;

        }
        #customers td, #customers th
        {
            font-size:1em;
            border:1px solid #98bf21;
            padding:3px 7px 2px 7px;
            text-align: center;
        }
        #customers th
        {
            text-align: center;
            font-size:1.1em;
            padding-top:5px;
            padding-bottom:4px;
            background-color:#A7C942;
            color:#ffffff;
        }
        #customers tr.alt td
        {
            color:#000000;
            background-color:#EAF2D3;
        }
    </style>
</head>
<body>
<script >
    window.onload=function(){

        var arr=document.getElementsByTagName('button');
        if(arr!=null){
            for(var i = 0;i<arr.length;i++){
                arr[i].onclick = function(){
                    var message=this.id;
                    window.location.href='deal_delete.jsp?str2='+encodeURI(encodeURI(message));

                }
            }
        }
    }

</script>
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
        <th>课程编号</th>
        <th>课程名称</th>
        <th>上课时间</th>
        <th>上课地点</th>
        <th>课程学分</th>
        <th>任课教师</th>
        <th>是否退课</th>>
    </tr>
    <%
        String Num=(String)session.getAttribute("num");
        String sql="select course_info.c_id,course_info.c_name,course_info.c_time,course_info.c_area,course_info.c_score,course_info.c_teacher from choose_info,course_info where choose_info.stu_id='"+Num+"' and course_info.c_id=choose_info.c_id";
        ResultSet rs=read.getRs(sql);
        while(rs.next()){
    %>
    <tr>
        <td><%=rs.getString(1)%></td>
        <td><%=rs.getString(2)%></td>
        <td><%=rs.getString(3)%></td>
        <td><%=rs.getString(4)%></td>
        <td><%=rs.getString(5)%></td>
        <td><%=rs.getString(6)%></td>
        <td><Button type="button"  class="button" style="vertical-align: middle" id=<%=rs.getString(1)%> ><span>退选</span></Button></td>
    </tr>
    <%
        }
        rs.close();
    %>
</table>
</body>
</html>
