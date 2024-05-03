package hcmut.pos_system.services;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import hcmut.pos_system.DTO.EmployeeDTO;
import hcmut.pos_system.DTO.FindEmployeeDTO;
import hcmut.pos_system.DTO.FindEmployeeRowMapper;
import hcmut.pos_system.models.Employee;
import hcmut.pos_system.models.ResponseObject;
import hcmut.pos_system.repositories.EmployeeRepository;

@Service
public class EmployeeService {
    @Autowired
    private EmployeeRepository employeeRepository;

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public ResponseEntity<ResponseObject> PROC_findEmployeesByBranchID(Integer branchID){
        try {
            List<FindEmployeeDTO> employees = jdbcTemplate.query(
            "EXEC dbo.FindEmployee @BranchID =?", new FindEmployeeRowMapper(), branchID);

            return ResponseEntity.status(HttpStatus.OK)
                    .body(new ResponseObject("OK", "Query to find Employee By BranchID successfully", employees));

        } catch (DataAccessException e) {
            // Catch the exception raised by the RAISERROR statement
            if (e.getMessage().contains("Không tìm thấy chi nhánh có ID") ||
                    e.getMessage().contains("Không tìm thấy nhân viên nào thỏa mãn")) {
                return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body(new ResponseObject("ERROR", e.getMessage(), null));
            } else {
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(new ResponseObject("ERROR" + ", " + e.getMessage().toString(), "Error finding Employee By BranchID", null));
            }
        }
    }

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
