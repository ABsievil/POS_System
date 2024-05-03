package hcmut.pos_system.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import hcmut.pos_system.models.Employee;
import hcmut.pos_system.models.ResponseObject;
import hcmut.pos_system.repositories.EmployeeRepository;

@Service
public class EmployeeService {
    @Autowired
    private EmployeeRepository employeeRepository;

    // Tìm tất cả Nhân viên y tế
    public ResponseEntity<ResponseObject> getAllEmployee() {
        List<Object[]> employeeList = employeeRepository.findEmployeesWithSupervisorAndBranchId();
        return ResponseEntity.status(HttpStatus.OK)
                .body(new ResponseObject("OK", "Query employee successfully", employeeList));
    }

}
