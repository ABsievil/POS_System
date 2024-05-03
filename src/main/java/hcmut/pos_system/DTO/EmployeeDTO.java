package hcmut.pos_system.DTO;

import java.math.BigDecimal;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class EmployeeDTO {
     private Integer employeeId;
    private String lastName;
    private String middleName;
    private String firstName;
    private String CCCD;
    private String phoneNumber;
    private String email;
    private BigDecimal salary;
    private Integer supervisorId;
    private Integer branchId;
}
