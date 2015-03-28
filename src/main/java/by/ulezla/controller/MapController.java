package by.ulezla.controller;

import by.ulezla.dao.BaseDAO;
import by.ulezla.entity.Organization;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
public class MapController {


    @Autowired
    BaseDAO baseDAO;

    @RequestMapping(value = "/map", method = RequestMethod.GET)
    public String showMap(Model model) {
        List<Organization> organizations = baseDAO.getEntitys(Organization.class);
        model.addAttribute("points", organizations);
        model.addAttribute("appName", "bfree");
        return "map";
    }
}
