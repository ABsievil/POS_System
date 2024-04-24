package hcmut.pos_system.models;

import java.time.LocalDate;

import jakarta.persistence.CascadeType;
import jakarta.persistence.DiscriminatorValue;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.IdClass;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinColumns;
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
// @DiscriminatorValue("DRYFOOD")
public class DryFood {
    @Id
    @OneToOne
    @JoinColumns({
        @JoinColumn(name = "id_productBatch", referencedColumnName = "id"),
        @JoinColumn(name = "id_productType", referencedColumnName = "id_productType")
    })
    private ProductBatch productBatch;

    private LocalDate describe;
    private LocalDate expiredDate;
    
}
