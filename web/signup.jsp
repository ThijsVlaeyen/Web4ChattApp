<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: JojoS
  Date: 5/05/2020
  Time: 14:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<jsp:include page="head.jsp">
    <jsp:param name="title" value="Sign up"/>
</jsp:include>
<body id="body">
<jsp:include page="header.jsp">
    <jsp:param name="title" value="Sign up"/>
</jsp:include>
<c:if test="${errors.size()>0 }">
    <div class="danger">
        <ul>
            <c:forEach var="error" items="${errors }">
                <li>${error }</li>
            </c:forEach>
        </ul>
    </div>
</c:if>


<form action="Controller?action=Signup" method="post" style="margin-left: 25%;">

    <label for="firstname">First name:</label><br>
    <input type="text" id="firstname" name="firstname" ><br>

    <label for="lastname">Last name:</label><br>
    <input type="text" id="lastname" name="lastname" ><br>

    <label for="email">Email:</label><br>
    <input type="email" id="email" name="email" ><br>

    <label for="address">Address:</label><br>
    <input type="text" id="address" name="address" ><br>

    <label for="age">Age:</label><br>
    <input type="number" id="age" name="age" ><br>

    <label for="sex">Sex:</label><br>
    <select name="sex" id="sex">
        <option value="male">Male</option>
        <option value="female">Female</option>
    </select>


    <label for="pass" >Password:</label><br>
    <input type="password" id="pass" name="pass" ><br>

    <label for="repass">Repeat password:</label><br>
    <input type="password" id="repass" name="repass" ><br>



    <input type="submit" value="Signup">

</form>
</body>
</html>
