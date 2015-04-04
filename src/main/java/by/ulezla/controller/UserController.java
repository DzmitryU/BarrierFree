package by.ulezla.controller;

import by.ulezla.exception.RegistrationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.security.Principal;

@Controller
public class UserController extends AbstractController {

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String register(Model model, Principal principal) {
        setRequirements(model, principal);
        return "register";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registerDo(String email, String firstname, String lastname, String password1, String password2, Model model, Principal principal) {
        boolean allOk = false;
        setRequirements(model, principal);
        String resultMessage;
        String password;
        if (password1.contains(password2)) {
            password = password2;
            try {
                resultMessage = userDAO.registerUser(email, firstname, lastname, password);
                allOk = true;
            } catch (RegistrationException e) {
                resultMessage = e.getMessage();
                allOk = false;
            }
        }  else {
            resultMessage = "Введённые пароли не совпадают";
        }
        model.addAttribute("result", resultMessage);
        if (allOk) {
            return "result";
        } else {
            model.addAttribute("Email", email);
            model.addAttribute("firstname", firstname);
            model.addAttribute("lastname", lastname);
            return "register";
        }

    }
}
