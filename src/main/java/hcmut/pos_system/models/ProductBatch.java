package hcmut.pos_system.models;

import jakarta.persistence.CascadeType;
import jakarta.persistence.DiscriminatorValue;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.IdClass;
import jakarta.persistence.Inheritance;
import jakarta.persistence.InheritanceType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
// @DiscriminatorValue("PRODUCTBATCH")
@IdClass(ProductBatchId.class)
public class ProductBatch {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Id
    @ManyToOne(cascade = CascadeType.REMOVE)
    @JoinColumn(name = "id_productType", referencedColumnName = "") //you must write this
    private ProductType productType;

    private Long currentPrice;

    private Long stockQuantity;
    
    @ManyToOne(cascade = CascadeType.REMOVE)
    @JoinColumn(name = "id_bill", referencedColumnName = "id")
    private Bill bill;

    private Long quantityOnBill;
}
