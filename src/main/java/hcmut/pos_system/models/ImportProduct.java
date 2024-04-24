package hcmut.pos_system.models;

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
@IdClass(ImportProductId.class)
public class ImportProduct {
    @Id
    @ManyToMany(cascade = CascadeType.REMOVE)
    @JoinColumn(name = "id_productType", referencedColumnName = "id")
    private ProductType productType;

    @Id
    @ManyToMany(cascade = CascadeType.REMOVE)
    @JoinColumn(name = "id_branch", referencedColumnName = "id")
    private Branch branch;
}
