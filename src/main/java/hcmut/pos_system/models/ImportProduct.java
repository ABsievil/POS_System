package hcmut.pos_system.models;

import java.util.Collection;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.IdClass;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.OneToMany;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Entity
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@IdClass(ImportProductId.class)
public class ImportProduct {
    // @Id
    // @OneToMany(cascade = CascadeType.REMOVE)
    // @EqualsAndHashCode.Exclude // không sử dụng trường này trong equals và hashcode
    // @ToString.Exclude // Không sử dụng trong toString()
    // @JoinColumn(name = "id_productType", referencedColumnName = "id")
    // private Collection<ProductType> productType;

    // @Id
    // @OneToMany(cascade = CascadeType.REMOVE)
    // @EqualsAndHashCode.Exclude // không sử dụng trường này trong equals và hashcode
    // @ToString.Exclude // Không sử dụng trong toString()
    // @JoinColumn(name = "id_branch", referencedColumnName = "id")
    // private Collection<Branch> branch;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
}
