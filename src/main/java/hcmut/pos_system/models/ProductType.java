package hcmut.pos_system.models;

import java.util.Set;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ProductType {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    private int inventoryNumber;

    @ManyToOne(cascade = CascadeType.REMOVE)
    @JoinColumn(name = "id_supplier", referencedColumnName = "id")
    private Supplier supplier;

    private Long price;

    // support for Many To Many 
    @OneToMany(mappedBy = "productType", cascade = CascadeType.REMOVE)
    private Set<ImportProduct> importProducts;
}
