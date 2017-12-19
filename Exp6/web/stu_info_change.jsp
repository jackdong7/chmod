<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2017/12/17
  Time: 10:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>信息变更</title>
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
        <div class="logo">信息修改</div>
        <div class="login_form">
            <form method="post">
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
                    <input type="text" name="Tel" class="login_input" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px ">
                </ul>
                <ul class="login-item" style="background-color: white">
                    <span>班级:</span>
                    <select name="Grade" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px "><option value="大学一年级">大学一年级</option><option value="大学二年级">大学二年级</option>
                        <option value="大学三年级">大学三年级</option><option value="大学四年级">大学四年级</option></select>
                    <select name="Profession" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px "><option value="计算机科学与技术">计算机科学与技术</option><option value="软件工程">软件工程</option>
                    </select>
                    <select name="Class_num" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px "><option value="1班">1班</option><option value="2班">2班</option></select>
                </ul>
                <ul class="login-item" style="background-color: white">
                    <span>家庭住址:</span>
                    <input type="text" name="Area" class="login_input" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px ">
                </ul>
                <ul class="login-sub" style="background-color: white">
                    <input type="submit" name="Submit" value="确认修改" />
                </ul>
            </form>
        </div>
    </div>
</div>
        <%
    }
    rs.close();
%>
<jsp:useBean id="write" class="myPackage.FirstBeen"/>
<%
    request.setCharacterEncoding("UTF-8");
    String new_tel=request.getParameter("Tel");
    String new_class_num=request.getParameter("Grade")+" "+request.getParameter("Profession")+" "+request.getParameter("Class_num");
    String new_area=request.getParameter("Area");
    if(new_tel!=null&&new_class_num!=null&&new_area!=null){
        String tel_standard="\\d{11}";   //正则表达式验证手机号是否符合要求
        if(new_tel.matches(tel_standard)){
            String sql2="update stu_info set stu_tel='"+new_tel+"',stu_classno='"+new_class_num+"',stu_area='"+new_area+"' where stu_id='"+Num+"'";
            write.write_in(sql2);
            %>
            <script>
                alert('信息录入成功');
            </script>
            <%
                response.sendRedirect("stu_info_look.jsp");
            %>
        <%
            }else{
        %>
        <script>
            alert('手机号输入有误');
        </script>
        <%
            }
        }
    %>


</body>
</html>
