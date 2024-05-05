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
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

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

    @GetMapping("/search/{employeeKey}")
    public ResponseEntity<ResponseObject> getEmployeesBybranchID(@PathVariable String employeeKey) {
        return  employeeService.FNC_getMatchedEmployees(employeeKey);
    }

    @PostMapping("/searchBody")
    public ResponseEntity<ResponseObject> searchEmployees(@RequestBody SearchRequest request) {
        return  employeeService.FNC_getMatchedEmployees(request.getValue());
    }

    @Data
    @Builder
    @NoArgsConstructor
    @AllArgsConstructor
    public static class SearchRequest {
        private String value;
    }

    @GetMapping("/{employeeID}")
    public ResponseEntity<ResponseObject> getEmployeesByEmployeeID(@PathVariable Integer employeeID) {
        return  employeeService.PROC_findEmployeeByEmployeeID(employeeID);
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
