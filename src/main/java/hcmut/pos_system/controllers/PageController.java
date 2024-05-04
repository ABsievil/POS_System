package hcmut.pos_system.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {
    
    @RequestMapping(value = {"/", "home"})
    public String welcome(){
        return "homePage";
    }

    @RequestMapping("/login")
    public String login(){
        return "login";
    }

    @RequestMapping("/userProfile")
    public String userProfile(){
        return "userProfile";
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
    @RequestMapping("/supplier")
    public class supplier{
        @GetMapping("")
        public String getSuppliers(){
            return "supplier";
        }   

        @PostMapping("")
        public void postSuppliers(){

        }
    }

    @Controller
    @RequestMapping("/product")
    public class product{
        @GetMapping("")
        public String getProducts(){
            return "product";
        }   

        @PostMapping("")
        public void postProducts(){

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
