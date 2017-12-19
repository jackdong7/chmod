<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2017/12/18
  Time: 16:03
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
    String chose=request.getParameter("str");

    String choses=java.net.URLDecoder.decode(chose, "UTF-8");

    String sql="insert into choose_info values('"+choses+"','"+Id+"')";
    write.write_in(sql);

    response.sendRedirect("choose_course.jsp");

%>
</body>
</html>
