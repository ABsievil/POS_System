package hcmut.pos_system.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


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
    @RequestMapping("/employeeList")
    public class employeeList{
        @GetMapping("")
        public String getDisplay(){
            return "employeeList";
        }   
        @GetMapping("/updateInfor/{employeeID}")
        public String getUpdate(@PathVariable Integer employeeID, Model model){
            model.addAttribute("employeeID", employeeID);
            return "updateInfor";
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
    @RequestMapping("/importBatch")
    public class importBatch{
        @GetMapping("")
        public String getImportBatch(){
            return "importBatch";
        }   

        @PostMapping("")
        public void postImportBatch(){

        }
    }

    @Controller
    @RequestMapping("/productBill")
    public class productBill{
        @GetMapping("")
        public String getProductBill(){
            return "productBill";
        }   

        @RequestMapping(value = "/totalPrice", method = RequestMethod.GET)
        public String getMethodName() {
            return "totalPrice";
        }
    }

    @Controller
    @RequestMapping("/productLot")
    public class productLot{
        @GetMapping("")
        public String getProducts(){
            return "productLot";
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
