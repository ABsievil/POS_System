package hcmut.pos_system.model;

import java.time.LocalDate;

import jakarta.persistence.DiscriminatorValue;
import jakarta.persistence.Entity;
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
    @OneToOne
    @JoinColumn(name = "id_employee")
    private Emloyee emloyee;

    private String degree; //bằng cấp

    private LocalDate dateOfManagement;
}
