package hcmut.pos_system.DTO;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class FindEmployeeRowMapper implements RowMapper<FindEmployeeDTO> {
    @Override
    public FindEmployeeDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
        FindEmployeeDTO employee = new FindEmployeeDTO();
        employee.setName(rs.getString("Name"));
        employee.setPhoneNo(rs.getString("PhoneNo"));
        employee.setSalary(rs.getBigDecimal("Salary"));
        return employee;
    }
}
