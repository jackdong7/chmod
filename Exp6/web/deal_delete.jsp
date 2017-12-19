<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2017/12/18
  Time: 15:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:useBean id="write" class="myPackage.FirstBeen" scope="page"/>
<%
    String Id=(String)session.getAttribute("num");
    request.setCharacterEncoding("UTF-8");
    String delete_course=request.getParameter("str2");
    String delete_courses=java.net.URLDecoder.decode(delete_course, "UTF-8");
    String sql="delete from choose_info where c_id='"+delete_courses+"' and stu_id='"+Id+"'";
    write.write_in(sql);
    response.sendRedirect("my_course.jsp");
    %>
    </body>
</html>
