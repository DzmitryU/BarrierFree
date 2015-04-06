package by.ulezla.controller;

import by.ulezla.entity.User;
import by.ulezla.exception.RegistrationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.security.Principal;

@Controller
public class UserController extends AbstractController {

    @RequestMapping(value = "/registration", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
    public String register(Model model, Principal principal) {
        setRequirements(model, principal);
        return "register";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
    public String registerDo(String email, String firstname, String lastname, String password1, String password2,
                             Model model, Principal principal) {
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

    @RequestMapping(value = "/login", produces = "text/plain;charset=UTF-8")
    public String login(Model model, Principal principal) {
        setRequirements(model, principal);
        return "login";
    }

    @RequestMapping(value = "/loginerror", produces = "text/plain;charset=UTF-8")
    public String loginerror(Model model, Principal principal) {
        setRequirements(model, principal);
        model.addAttribute("result", "Логин или пароль не верны");
        return "login";
    }

    @RequestMapping(value = "/sendrestorepassword", produces = "text/plain;charset=UTF-8")
    public String sendrestorepassword(Model model, Principal principal, String email) {
        String result = userDAO.sendRestorePasswordLink(email);
        setRequirements(model, principal);
        model.addAttribute("result", result);
        return "result";
    }

    @RequestMapping(value = "/setnewpassword", produces = "text/plain;charset=UTF-8")
    public String setnewpassword(Model model, Principal principal) {
        if (principal != null) {
            setRequirements(model, principal);
            // Задаётся пароль из личного кабинета
            model.addAttribute("changePassword", true);
            return "changePassword";
        } else {
                setRequirements(model, principal);
                model.addAttribute("result", "Ссылка испорчена или устарела!.");
                return "result";
            }
    }

    @RequestMapping(value = "/updatepassword", produces = "text/plain;charset=UTF-8")
    public String updatepassword(Model model, Principal principal, String email,
                                 String password_new1, String password_new2, String password_old) {
        String result = "";
        if (password_new1.contentEquals(password_new2)) {
            if (principal != null) {
                result = userDAO.updatePassword(principal.getName(), password_old, password_new1);
            }
        } else {
            result = "Введённые пароли не совпадают";
        }

        setRequirements(model, principal);
        model.addAttribute("result", result);
        return "result";
    }

    @RequestMapping(value = "/profile", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
    public String profile(Model model, Principal principal) {
        setRequirements(model, principal);
        String result = "result";
        if (principal != null) {
            User user = userDAO.getUserFromEmail(principal.getName());
            model.addAttribute("appUser", user);
            result = "profile";
        } else {
            model.addAttribute("result", "Доступ запрещен.");
        }
        return  result;
    }
}
