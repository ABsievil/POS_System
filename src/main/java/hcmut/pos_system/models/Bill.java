package hcmut.pos_system.models;

import java.time.LocalDate;
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
public class Bill {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private LocalDate date;

    @ManyToOne(cascade = CascadeType.REMOVE)
    @JoinColumn(name = "id_cashier", referencedColumnName = "id")
    private Cashier cashier;

    // support for Many To Many 
    @OneToMany(mappedBy = "bill", cascade = CascadeType.REMOVE)
    Set<BillAndProductBatch> billAndProductBatchs;
}
