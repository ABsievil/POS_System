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
public class FindEmployeeDTO {
    private String Name;

    private String PhoneNo;

    private BigDecimal Salary;
}
