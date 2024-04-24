package hcmut.pos_system.models;

import java.time.LocalDate;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.IdClass;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToMany;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@IdClass(ImportBatchId.class)
public class ImportBatch {
    @Id
    @ManyToMany(cascade = CascadeType.REMOVE)
    @JoinColumn(name = "id_branch", referencedColumnName = "id")
    private Branch branch;

    @Id
    @ManyToMany(cascade = CascadeType.REMOVE)
    @JoinColumn(name = "id_productType", referencedColumnName = "id")
    private ProductType productType;

    @Id
    private Long productQuantity;

    @Id
    private LocalDate date;

}
