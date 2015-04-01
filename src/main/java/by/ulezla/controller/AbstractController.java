package by.ulezla.controller;

import by.ulezla.utils.view.MenuItem;
import org.springframework.ui.Model;

import java.security.Principal;
import java.util.ArrayList;

public abstract class AbstractController {
    public void setRequirements(Model model, Principal principal) {
        ArrayList<MenuItem> menuItems = new ArrayList<>();
        menuItems.add(new MenuItem("info", "Информирование"));
        menuItems.add(new MenuItem("map", "Поиск / Карта"));
        menuItems.add(new MenuItem("info", "Полезные ссылки"));
        if (principal != null) {
            menuItems.add(new MenuItem("profile", "Личный кабинет"));
        } else {
            menuItems.add(new MenuItem("register", "Регистрация / Вход"));
        }

        model.addAttribute("menuItems", menuItems);
    }
}
