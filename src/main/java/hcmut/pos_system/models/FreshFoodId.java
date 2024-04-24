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
public class FreshFoodId implements Serializable {
    private ProductBatch productBatch1;

    // private ProductBatch productBatch2;
}
