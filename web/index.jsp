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
                <input type="text" id="statusInput"><br/>
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
                <input type="text" id="friendName"><br/>
                <button id="friendsubmit" type="submit">Add Friend</button>
            </form>
        </div>

    </c:when>
    <c:otherwise>
        <div>
            <b>Login</b>
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
        </div>
    </c:otherwise>
</c:choose>
    <article id="blog">
        <b>Blog</b>
        <form id="1">
            <p>Was het een interessante projectweek?</p>
            <div>
                <b>Comments:</b>
                <ul id="comments1"></ul>
            </div>
            <input type="text" id="username1" value="${user.getFirstName()}">
            <input type="text" id="comment1">
            <input type="number" min="0" max="10" id="rating1">
            <button type="submit">Add comment</button>
        </form>
        <form id="2">
            <p>Wat ga je vandaag doen?</p>
            <div>
                <b>Comments:</b>
                <ul id="comments2"></ul>
            </div>
            <input type="text" id="username2" value="${user.getFirstName()}">
            <input type="text" id="comment2">
            <input type="number" min="0" max="10" id="rating2">
            <button type="submit">Add comment</button>
        </form>
        <form id="3">
            <p>Welke muziek ben je nu aan het luisteren</p>
            <div>
                <b>Comments:</b>
                <ul id="comments3"></ul>
            </div>
            <input type="text" id="username3" value="${user.getFirstName()}">
            <input type="text" id="comment3">
            <input type="number" min="0" max="10" id="rating3">
            <button type="submit">Add comment</button>
        </form>
        <form id="4">
            <p>Welke dag is het vandaag?</p>
            <div>
                <b>Comments:</b>
                <ul id="comments4"></ul>
            </div>
            <input type="text" id="username4" value="${user.getFirstName()}">
            <input type="text" id="comment4">
            <input type="number" min="0" max="10" id="rating4">
            <button type="submit">Add comment</button>
        </form>
        <form id="5">
            <p>2+2*2=?</p>
            <div>
                <b>Comments:</b>
                <ul id="comments5"></ul>
            </div>
            <input type="text" id="username5" value="${user.getFirstName()}">
            <input type="text" id="comment5">
            <input type="number" min="0" max="10" id="rating5">
            <button type="submit">Add comment</button>
        </form>
    </article>
</main>

<jsp:include page="footer.jsp">
    <jsp:param name="title" value="Home"/>
</jsp:include>

<script src="js/main.js"></script>
<script src="js/blog.js"></script>
</body>
</html>
