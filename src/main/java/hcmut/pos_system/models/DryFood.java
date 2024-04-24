package hcmut.pos_system.models;

import java.time.LocalDate;

import jakarta.persistence.CascadeType;
import jakarta.persistence.DiscriminatorValue;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.IdClass;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@Builder
@NoArgsConstructor
@AllArgsConstructor
@IdClass(DryFoodId.class)
// @DiscriminatorValue("DRYFOOD")
public class DryFood {
    @Id
    @OneToOne(cascade = CascadeType.REMOVE)
    @JoinColumn(name = "id_productBatch", referencedColumnName = "id")
    private ProductBatch productBatch1;

    @Id
    @OneToOne(cascade = CascadeType.REMOVE)
    @JoinColumn(name = "id_productType", referencedColumnName = "id_productType")
    private ProductBatch productBatch2;

    private LocalDate describe;
    private LocalDate expiredDate;
    
}
