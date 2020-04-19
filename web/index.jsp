<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<jsp:include page="head.jsp">
    <jsp:param name="title" value="Home"/>
</jsp:include>
<body id="body">
<jsp:include page="header.jsp">
    <jsp:param name="title" value="Home"/>
</jsp:include>
<main>
    <c:if test="${errors.size()>0 }">
        <div class="danger">
            <ul>
                <c:forEach var="error" items="${errors }">
                    <li>${error }</li>
                </c:forEach>
            </ul>
        </div>
    </c:if> <c:choose>
    <c:when test="${user!=null}">

        <div>
            <b>Welcome </b>
            <b id="currentuser">${user.getFirstName()}</b>
            <p id="status">Online</p>
            <form method="post" action="Controller?action=LogOut">
                <input type="submit" id="logoutbutton" value="Log Out">
            </form>
        </div>
        <div>
            <b>Change Status</b>
            <form id="statusForm">
                <input type="text" id="statusInput">
                <button type="submit">Change Status</button>
            </form>
        </div>
        <div>
            <b>Your friends</b>
            <table id="friends">
                <tr>
                    <th>Name</th>
                    <th>Status</th>
                </tr>
            </table>
        </div>

        <div>
            <b>Add a friend</b>
            <form id="addFriend">

                <input type="text" id="friendName">
                <button id="friendsubmit" type="submit">Add Friend</button>
            </form>
        </div>

    </c:when>
    <c:otherwise>
        <form method="post" action="Controller?action=LogIn">
            <p>
                <label for="email">Your email </label>
                <input type="text" id="email" name="email" value="jan@ucll.be">
            </p>
            <p>
                <label for="password">Your password</label>
                <input type="password" id="password" name="password" value="t">
            </p>
            <p>
                <input type="submit" id="loginbutton" value="Log in">
            </p>
        </form>
    </c:otherwise>
</c:choose></main>

<jsp:include page="footer.jsp">
    <jsp:param name="title" value="Home"/>
</jsp:include>

<script src="js/main.js"></script>
</body>
</html>
