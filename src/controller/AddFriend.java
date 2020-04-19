package controller;

import com.google.gson.JsonObject;
import domain.Person;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class AddFriend extends RequestHandler {
    @Override
    public void handleRequest(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Person user = (Person) request.getSession().getAttribute("user");
        if (user != null){
            Person friend = getPersonService().getPersonByName(request.getParameter("name"));
            user.addFriend(friend);
        }
    }

    private Object toJson(List<Person> list){
        JsonObject json = new JsonObject();
        for (Person u:list){
            JsonObject user = new JsonObject();
            user.addProperty("name",u.getFirstName());
            user.addProperty("statusname",u.getStatus());
            json.add(u.getFirstName(),user);
        }
        return json.toString();
    }
}
