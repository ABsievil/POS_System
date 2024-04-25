package hcmut.pos_system.models;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class BillAndProductBatchId implements Serializable {
    private Bill bill;

    private ProductBatch productBatch;
}
