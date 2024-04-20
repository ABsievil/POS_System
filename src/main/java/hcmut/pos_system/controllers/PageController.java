package hcmut.pos_system.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {
    
    @RequestMapping(value = {"/", "index"})
    public String welcome(){
        return "index";
    }

    @RequestMapping("/login")
    public String login(){
        return "login";
    }

    @Controller
    @RequestMapping("/update")
    public class update{
        @GetMapping("")
        public String getUpdate(){
            return "updateData";
        }   

        @PostMapping("")
        public void postUpdate(){

        }
    }

    @Controller
    @RequestMapping("/display")
    public class display{
        @GetMapping("")
        public String getDisplay(){
            return "displayData";
        }   

        @PostMapping("")
        public void postDisplay(){

        }
    }

    @Controller
    @RequestMapping("/callfunc")
    public class callfunc{
        @GetMapping("")
        public String getCallFunc(){
            return "callFunc";
        }   

        @PostMapping("")
        public void postCallFunc(){

        }
    }

}
