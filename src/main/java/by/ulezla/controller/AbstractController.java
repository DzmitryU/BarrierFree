package by.ulezla.controller;

import by.ulezla.dao.BaseDAO;
import by.ulezla.dao.OrganizationDAO;
import by.ulezla.dao.UserDAO;
import by.ulezla.entity.User;
import by.ulezla.utils.view.MenuItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import java.security.Principal;
import java.util.ArrayList;

public abstract class AbstractController {

    @Autowired
    BaseDAO baseDAO;

    @Autowired
    UserDAO userDAO;

    @Autowired
    OrganizationDAO organizationDAO;

    public void setRequirements(Model model, Principal principal) {

        generateUserInfo(model, principal);
        model.addAttribute("menuItems", generateMenuItems(principal));
        model.addAttribute("appName", "bfree");
    }

    private void generateUserInfo(Model model, Principal principal) {
        if (principal != null) {
            User user = userDAO.getUserFromEmail(principal.getName());
            model.addAttribute("user", true);
            model.addAttribute("guest", false);
            model.addAttribute("userName", user.getFirstname() + " " + user.getLastname());
        }  else {
            model.addAttribute("guest", true);
            model.addAttribute("user", false);
        }
    }

    private ArrayList<MenuItem> generateMenuItems(Principal principal) {
        ArrayList<MenuItem> menuItems = new ArrayList<>();
        menuItems.add(new MenuItem("info", "Информирование"));
        menuItems.add(new MenuItem("map", "Поиск / Карта"));
        menuItems.add(new MenuItem("info", "Полезные ссылки"));
        if (principal != null) {
            menuItems.add(new MenuItem("profile", "Личный кабинет"));
        } else {
            menuItems.add(new MenuItem("registration", "Регистрация"));
            menuItems.add(new MenuItem("login", "Вход"));
        }
        return  menuItems;
    }
}
