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
public class InsertEmpDTO {
    private Integer manv;
    private String ho; 
    private String tenlot;
    private String ten;
    private String cccd;
    private String sdt;
    private String email;
    private BigDecimal luongnv;
    private Integer nguoigiamsat;
    private Integer machinhanh;
}
