package hcmut.pos_system.models;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.IdClass;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinColumns;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToOne;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@IdClass(BillAndProductBatchId.class)
public class BillAndProductBatch {
    @Id
    @ManyToOne(cascade = CascadeType.REMOVE)
    @JoinColumn(name = "id_bill", referencedColumnName = "id")
    private Bill bill;

    @Id
    @ManyToOne
    @JoinColumns({
        @JoinColumn(name = "id_productBatch", referencedColumnName = "id"),
        @JoinColumn(name = "id_productType", referencedColumnName = "id_productType")
    })
    private ProductBatch productBatch;

    private Long quantityEachType;

    private Long currentPrice;
}
