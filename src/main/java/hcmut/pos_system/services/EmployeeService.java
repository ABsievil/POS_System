package hcmut.pos_system.services;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import hcmut.pos_system.DTO.EmployeeDTO;
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
        
        List<EmployeeDTO> employeeDTOList = new ArrayList<>();
        for (Object[] row : employeeList) {
            EmployeeDTO employeeDTO = new EmployeeDTO();
            employeeDTO.setEmployeeId((Integer) row[0]);
            employeeDTO.setLastName((String) row[1]);
            employeeDTO.setMiddleName((String) row[2]);
            employeeDTO.setFirstName((String) row[3]);
            employeeDTO.setCCCD((String) row[4]);
            employeeDTO.setPhoneNumber((String) row[5]);
            employeeDTO.setEmail((String) row[6]);
            employeeDTO.setSalary((BigDecimal) row[7]);
            employeeDTO.setSupervisorId((Integer) row[8]);
            employeeDTO.setBranchId((Integer) row[9]);
            employeeDTOList.add(employeeDTO);
        }
        return ResponseEntity.status(HttpStatus.OK)
                .body(new ResponseObject("OK", "Query employee successfully", employeeDTOList));
    }

}
