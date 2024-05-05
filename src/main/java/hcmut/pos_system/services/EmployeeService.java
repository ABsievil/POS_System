package hcmut.pos_system.services;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
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

@Service
public class EmployeeService {
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

    public ResponseEntity<ResponseObject> PROC_findEmployeeByEmployeeID(Integer employeeID){
        try {
            List<EmployeeDTO> employees = jdbcTemplate.query(
            "EXEC dbo.FindEmployeeByEmployeeID @EmployeeID =?", new EmployeeRowMapper(), employeeID);

            return ResponseEntity.status(HttpStatus.OK)
                    .body(new ResponseObject("OK", "Query to find Employee By employeeID successfully", employees));
        } catch(DataAccessException e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(new ResponseObject("ERROR" + ", " + e.getMessage().toString(), "Error finding Employee By employeeID", null));
        }
    }

    public ResponseEntity<ResponseObject> FNC_getMatchedEmployees(String employeeKey){
        try {
            List<EmployeeDTO> employees = jdbcTemplate.query(
            "SELECT * FROM dbo.GetMatchedEmployees(?)", new EmployeeRowMapper(), employeeKey);

            return ResponseEntity.status(HttpStatus.OK)
                    .body(new ResponseObject("OK", "Query to search Employee By employeeKey successfully", employees));
        } catch(DataAccessException e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(new ResponseObject("ERROR" + ", " + e.getMessage().toString(), "Error searching Employee By employeeKey", null));
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
            String errorMessage = null;
            for (String error : ERROR_MESSAGES_insertEmp) {
                if (e.getMessage().contains(error)) {
                    errorMessage = error;
                    break;
                }
            }
        
            if (errorMessage != null) {
                return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                        .body(new ResponseObject("FAILED", errorMessage, newEmployee));
            } else {
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                        .body(new ResponseObject("ERROR " + e.getMessage().toString(), "Error inserting Employee failed", newEmployee));
            }
        }
    }

    private static final List<String> ERROR_MESSAGES_insertEmp = Arrays.asList(
    "Nhân viên đã tồn tại",
    "Chi nhánh không tồn tại",
    "Nhân viên giám sát không tồn tại",
    "Căn cước công dân không hợp lệ",
    "Email không hợp lệ",
    "Số điện thoại không hợp lệ",
    "Lương nhân viên phải thấp hơn lương quản lí"
    );

    public ResponseEntity<ResponseObject> PROC_updateEmp(EmployeeDTO emp){
        try {
            // update salary
            jdbcTemplate.update("EXEC dbo.updatesalary @manv =?, @luongnv =?",  
            emp.getEmployeeID(), emp.getSalary());
            
            //update branch
            jdbcTemplate.update("EXEC dbo.updatebranch @manv =?, @machinhanh =?",  
            emp.getEmployeeID(), emp.getBranchID());

            //update email
            jdbcTemplate.update("EXEC dbo.updateEmail @manv =?, @email =?",  
            emp.getEmployeeID(), emp.getEmail());

            //update cccd
            jdbcTemplate.update("EXEC dbo.updateCCCD @manv =?, @cccd =?",  
            emp.getEmployeeID(), emp.getCCCD());

            //update PhoneNo
            jdbcTemplate.update("EXEC dbo.updatePhoneno @manv =?, @sdt =?",  
            emp.getEmployeeID(), emp.getPhoneNo());

            //update supervisorID
            jdbcTemplate.update("EXEC dbo.updateSupervisor @manv =?, @manguoigiamsat =?",  
            emp.getEmployeeID(), emp.getSupervisorID());

            //update Lname, Mname, Fname
            jdbcTemplate.update("EXEC dbo.updateName @manv =?, @ho =?, @tenlot =?, @ten =?",  
            emp.getEmployeeID(), emp.getLastName(), emp.getMiddleName(), emp.getFirstName());

            return ResponseEntity.status(HttpStatus.OK)
                    .body(new ResponseObject("OK", "Query to update Employee successfully", null));

        } catch (DataAccessException e) {
            String errorMessage = null;
            for (String error : ERROR_MESSAGES_updateEmp) {
                if (e.getMessage().contains(error)) {
                    errorMessage = error;
                    break;
                }
            }
        
            if (errorMessage != null) {
                return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                        .body(new ResponseObject("FAILED", errorMessage, emp));
            } else {
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                        .body(new ResponseObject("ERROR " + e.getMessage().toString(), "Error updating Employee failed", emp));
            }
        }
    }

    private static final List<String> ERROR_MESSAGES_updateEmp = Arrays.asList(
    "Nhân viên không tồn tại",
    "Lương nhân viên phải thấp hơn quản lí của họ",
    "Chi nhánh không tồn tại",
    "Email không hợp lệ",
    "Căn cước công dân không hợp lệ",
    "Số điện thoại không hợp lệ",
    "Nhân viên giám sát không tồn tại",
    "Nhân viên không thể là người giám sát chính bản thân mình"
    );

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
