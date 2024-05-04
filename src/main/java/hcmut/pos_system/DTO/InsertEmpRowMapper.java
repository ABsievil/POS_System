package hcmut.pos_system.DTO;

import java.math.BigDecimal;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;


public class InsertEmpRowMapper implements RowMapper<InsertEmpDTO> {
    @Override
    public InsertEmpDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
        InsertEmpDTO employee = new InsertEmpDTO();
        employee.setManv(rs.getInt("manv"));
        employee.setHo(rs.getString("ho"));
        employee.setTenlot(rs.getString("tenlot"));
        employee.setTen(rs.getString("ten"));
        employee.setCccd(rs.getString("cccd"));
        employee.setSdt(rs.getString("sdt"));
        employee.setEmail(rs.getString("email"));
        employee.setLuongnv(rs.getBigDecimal("luongnv"));
        employee.setNguoigiamsat(rs.getInt("nguoigiamsat"));
        employee.setMachinhanh(rs.getInt("machinhanh"));
        return employee;
    }
}
