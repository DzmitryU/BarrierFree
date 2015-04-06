package by.ulezla.controller;

import by.ulezla.dao.BaseDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.security.Principal;

@Controller
public class TestController extends AbstractController {


    @Autowired
    BaseDAO baseDAO;

    /**
     * Main Page. List events.
     *
     * @param model
     * @param principal
     * @return Main page
     */
    @Transactional
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public @ResponseBody String getMain(Model model, Principal principal) {
        setRequirements(model, principal);
        return "map";
    }

    @RequestMapping(value = "/hello", method = RequestMethod.GET)
    public @ResponseBody String get1() {
        return "Hello";
    }

    @RequestMapping(value = "/sha512", method = RequestMethod.GET)
    public String getsha512(Model model) {
        model.addAttribute("result","OLOLO123     " +System.currentTimeMillis());
        model.addAttribute("appName", "bfree");
        return "result";
    }
}
