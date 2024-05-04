package hcmut.pos_system.controllers;

import org.hibernate.mapping.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import hcmut.pos_system.DTO.EmployeeDTO;
import hcmut.pos_system.models.Employee;
import hcmut.pos_system.models.ResponseObject;
import hcmut.pos_system.services.EmployeeService;

@RestController
@RequestMapping("/api/v1/Employee")
public class EmployeeController {
    @Autowired
    private EmployeeService employeeService;

     // Tìm tất cả employee
     // chưa dùng
    @GetMapping("/getAllEmployee")
    public ResponseEntity<ResponseObject> getAllEmployee() {
        return employeeService.PROC_getAllEmployee();
    }

    @GetMapping("/branch/{branchID}")
    public ResponseEntity<ResponseObject> getEmployeesBybranchID(@PathVariable Integer branchID) {
        return  employeeService.PROC_findEmployeesByBranchID(branchID);
    }

    @PostMapping("/insertEmployee")
    public ResponseEntity<ResponseObject> insertEmployee(@RequestBody EmployeeDTO newEmployee) {
        return employeeService.PROC_insertEmp(newEmployee);
    }

    @GetMapping("/deleteById/{employeeId}")
    public ResponseEntity<ResponseObject> deleteEmployeeById(@PathVariable Integer employeeId) {
        return employeeService.PROC_deleteEmployeeById(employeeId);
    }
}
