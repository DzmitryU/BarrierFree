package by.ulezla.controller;

import by.ulezla.entity.Category;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.security.Principal;
import java.util.List;

@Controller
public class MapController extends AbstractController {

//    @Transactional
//    @RequestMapping(value = "/map", method = RequestMethod.GET)
//    public String showMap(Model model, Principal principal) {
//        setRequirements(model, principal);
//
//        List<Organization> organizations = organizationDAO.getEntitys(Organization.class);
//        List<Category> categories = categoryDAO.getCategoryTree();
//        //Hibernate.initialize(organizations);
//        Hibernate.initialize(categories);
//        //model.addAttribute("organizations", organizations);
//        try {
//            model.addAttribute("categories", mapper.writeValueAsString(categories));
//        } catch (JsonProcessingException e) {
//            e.printStackTrace();
//        }
//        return "map";
//    }

    @Transactional
    @RequestMapping(value = "/map", method = RequestMethod.GET)
    public @ResponseBody
    List<Category> showMap(Model model, Principal principal) {
        //setRequirements(model, principal);

        //List<Organization> organizations = organizationDAO.getEntitys(Organization.class);
        List<Category> categories = categoryDAO.getCategoryTree();
        //Hibernate.initialize(organizations);
        //model.addAttribute("organizations", organizations);
//        try {
//            model.addAttribute("categories", mapper.writeValueAsString(categories));
//        } catch (JsonProcessingException e) {
//            e.printStackTrace();
//        }
        for (Category category : categories) {
            category.toString();
        }
        return categories;
    }
}
