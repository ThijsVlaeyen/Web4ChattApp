package controller;

import domain.DomainException;
import domain.Person;
import domain.PersonService;
import domain.Role;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class Signup extends RequestHandler {
    @Override
    public void handleRequest(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        List<String> errors = new ArrayList<String>();

        String email = request.getParameter("email");
        if (email == null || email.isEmpty()) {
            errors.add("No email given");
        }
        String passHash = request.getParameter("pass");
        if (passHash == null || passHash.isEmpty()) {
            errors.add("No password given");
        }
        String passTest = request.getParameter("repass");
        if (passTest == null || passTest.isEmpty()) {
            errors.add("Fill in the second password");
        }
        String address = request.getParameter("address");
        if (address == null || address.isEmpty()) {
            errors.add("No address given");
        }
        String sex = request.getParameter("sex");
        if (sex == null || sex.isEmpty()) {
            errors.add("No sex given");
        }
        String firstname = request.getParameter("firstname");
        if (firstname == null || firstname.isEmpty()) {
            errors.add("No firstname given");
        }
        String lastname = request.getParameter("lastname");
        if (lastname == null || lastname.isEmpty()) {
            errors.add("No lastname given");
        }
        System.out.println(errors);
        if (errors.size() == 0) {
            if (passTest.equals(passHash)) {
                try {
                    Person person = new Person(email, passHash, firstname, lastname, Role.LID, address, sex);
                    getPersonService().addPerson(person);


                } catch (DomainException d) {
                    errors.add(d.getMessage());
                }
            } else {
                errors.add("Passwords dont match");
            }

            if (errors.size() > 0) {
                request.setAttribute("errors", errors);
            }

            request.getRequestDispatcher("index.jsp").forward(request,response);
        }







    }
}
