package hcmut.pos_system.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {
    
    @RequestMapping("/")
    public String welcome(){
        return "index";
    }

    @RequestMapping("/login")
    public String login(){
        return "login";
    }
}
