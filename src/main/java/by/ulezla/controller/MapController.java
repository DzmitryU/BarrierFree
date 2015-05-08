package by.ulezla.controller;

import by.ulezla.entity.Category;
import by.ulezla.entity.Element;
import by.ulezla.entity.Organization;
import by.ulezla.service.CategoryService;
import by.ulezla.utils.Json.JsonConfig;
import org.hibernate.Hibernate;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;
import java.util.List;

@Controller
public class MapController extends AbstractController {

    CategoryService categoryService = new CategoryService();

    @Transactional
    @RequestMapping(value = {"/map", "/"}, method = RequestMethod.GET)
    public String showMap(Model model, Principal principal,
                          @RequestParam(value = "category", required = false) Integer categoryId,
                          @RequestParam(value = "elements", required = false) List<Integer> elementId) {
        setRequirements(model, principal);

        List<Organization> organizations;
        if (categoryId != null) {
           organizations = organizationDAO.filterOrganizations(categoryDAO.getCategory(categoryId),
                                                               elementDAO.getElements(elementId));
        } else {
            organizations = organizationDAO.getEntitys(Organization.class);
        }
        List<Category> categories = categoryDAO.getCategories();
        List<Category> categoryTree = categoryDAO.getCategoryTree();
        List<Element> elements = elementDAO.getElements();
        Hibernate.initialize(organizations);
        Hibernate.initialize(categories);

        model.addAttribute("organizations", organizations);
        model.addAttribute("elements", elements);
        model.addAttribute("categories", categories);

        try {
            model.addAttribute("category_tree",
                    JsonConfig.getObjectMapperInstance().writeValueAsString(
                            categoryService.buildHTreeListFromCategories(categoryTree)));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "map";
    }
}
