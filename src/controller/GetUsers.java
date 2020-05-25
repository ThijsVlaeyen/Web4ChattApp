package controller;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import domain.Person;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class GetUsers extends RequestHandler {
@Override
public void handleRequest(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
   try {
      List<Person> persons = this.getPersonService().getPersons();
      response.setContentType("text/json");
      response.setHeader("Access-Control-Allow-Origin", "*");
      response.getWriter().write(String.valueOf(this.toJson(persons)));

   } catch (IOException e) {
      e.printStackTrace();
   }
}

private String toJson(List<Person> list){

   Gson gson = new Gson();
   JsonArray array = new JsonArray();
   int i = 0;
   for (Person u : list) {
      JsonObject user = new JsonObject();
      user.addProperty("id", ++i);
      user.addProperty("voornaam",u.getFirstName());
      user.addProperty("achternaam",u.getLastName());
      user.addProperty("email",u.getUserId());
      user.addProperty("status",u.getStatus());
      user.addProperty("wachtwoord",u.getPassword());
      user.addProperty("adres",u.getAddress());
      user.addProperty("geslacht",u.getSex());
      array.add(user);
   }
   return gson.toJson(array);

}
}
