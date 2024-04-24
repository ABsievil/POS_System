package hcmut.pos_system.model;

import java.time.LocalDate;

import jakarta.persistence.CascadeType;
import jakarta.persistence.DiscriminatorValue;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

// @Builder
@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@DiscriminatorValue("MANAGER") // use only for disjoin constraints
public class Manager extends Emloyee {
    @Id
    @OneToOne(cascade = CascadeType.REMOVE)
    @JoinColumn(name = "id_employee", referencedColumnName = "id")
    private Emloyee emloyee;

    private String degree; //bằng cấp

    private LocalDate dateOfManagement;
}
