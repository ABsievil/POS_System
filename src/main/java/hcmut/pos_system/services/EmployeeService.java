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
import hcmut.pos_system.DTO.EmployeeRowMapper;
import hcmut.pos_system.models.Employee;
import hcmut.pos_system.models.ResponseObject;
import hcmut.pos_system.repositories.EmployeeRepository;

@Service
public class EmployeeService {
    @Autowired
    private EmployeeRepository employeeRepository;

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // Tìm tất cả Nhân viên y tế
    public ResponseEntity<ResponseObject> PROC_getAllEmployee() {
        try {
            List<EmployeeDTO> employees = jdbcTemplate.query("EXEC dbo.EmployeeInfor", new EmployeeRowMapper());
            return ResponseEntity.status(HttpStatus.OK)
                    .body(new ResponseObject("OK", "Query to find All Employee successfully", employees));

        } catch (DataAccessException e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(new ResponseObject("ERROR" + ", " + e.getMessage().toString(), "Error get All Employee failed", null));
        }
    }

    public ResponseEntity<ResponseObject> PROC_findEmployeesByBranchID(Integer branchID){
        try {
            List<EmployeeDTO> employees = jdbcTemplate.query(
            "EXEC dbo.FindEmployee @BranchID =?", new EmployeeRowMapper(), branchID);

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
                    .body(new ResponseObject("ERROR" + ", " + e.getMessage().toString(), "Error finding Employee By BranchID", branchID));
            }
        }
    }

    public ResponseEntity<ResponseObject> PROC_insertEmp(EmployeeDTO newEmployee){
        try {
            jdbcTemplate.update("EXEC dbo.insertemp @manv =?, @ho =?, @tenlot =?, @ten =?, @cccd =?, @sdt =?, @email =?, @luongnv =?, @nguoigiamsat =?, @machinhanh =?",  
            newEmployee.getEmployeeID(), 
            newEmployee.getLastName(), 
            newEmployee.getMiddleName(), 
            newEmployee.getFirstName(), 
            newEmployee.getCCCD(), 
            newEmployee.getPhoneNo(), 
            newEmployee.getEmail(), 
            newEmployee.getSalary(), 
            newEmployee.getSupervisorID(), 
            newEmployee.getBranchID());

            return ResponseEntity.status(HttpStatus.OK)
                    .body(new ResponseObject("OK", "Query to insert Employee successfully", null));

        } catch (DataAccessException e) {
            if (e.getMessage().contains("Nhân viên đã tồn tại") ||
                e.getMessage().contains("Chi nhánh không tồn tại") ||
                e.getMessage().contains("Căn cước công dân không hợp lệ") ||
                e.getMessage().contains("Số điện thoại không hợp lệ") ||
                e.getMessage().contains("Lương nhân viên phải thấp hơn lương quản lí")) {
                return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body(new ResponseObject("ERROR", e.getMessage(), null));
            } else {
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(new ResponseObject("ERROR" + ", " + e.getMessage().toString(), "Error inserting Employee failed", null));
            }
        }
    }

    public ResponseEntity<ResponseObject> PROC_deleteEmployeeById(Integer manv){
        try {
            String procedureCall = "{ call deleteemployee(?) }";
            jdbcTemplate.update(procedureCall, manv);

            return ResponseEntity.status(HttpStatus.OK)
                    .body(new ResponseObject("OK", "Query to delete Employee by Id successfully", null));
        } catch (DataAccessException e) {
            if (e.getMessage().contains("Nhân viên đã tồn tại") ||
                e.getMessage().contains("Chi nhánh không tồn tại") ||
                e.getMessage().contains("Căn cước công dân không hợp lệ") ||
                e.getMessage().contains("Số điện thoại không hợp lệ") ||
                e.getMessage().contains("Lương nhân viên phải thấp hơn lương quản lí")) {
                return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body(new ResponseObject("ERROR", e.getMessage(), null));
            } else {
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(new ResponseObject("ERROR" + ", " + e.getMessage().toString(), "Error inserting Employee failed", null));
            }
        }
    }



}
