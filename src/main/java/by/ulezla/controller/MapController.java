package by.ulezla.controller;

import by.ulezla.entity.Category;
import by.ulezla.entity.Organization;
import by.ulezla.service.CategoryService;
import by.ulezla.utils.Json.JsonConfig;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.hibernate.Hibernate;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.security.Principal;
import java.util.List;

@Controller
public class MapController extends AbstractController {

    CategoryService categoryService = new CategoryService();

    @Transactional
    @RequestMapping(value = "/map", method = RequestMethod.GET)
    public String showMap(Model model, Principal principal) {
        setRequirements(model, principal);

        List<Organization> organizations = organizationDAO.getEntitys(Organization.class);
        List<Category> categories = categoryDAO.getCategoryTree();
        Hibernate.initialize(organizations);
        //Hibernate.initialize(categories);
        categoryService.initialize(categories);
        model.addAttribute("organizations", organizations);

        try {
            model.addAttribute("categories", JsonConfig.getObjectMapperInstance().writeValueAsString(categories));
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return "map";
    }
}
