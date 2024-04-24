package hcmut.pos_system.model;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.DiscriminatorValue;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Inheritance;
import jakarta.persistence.InheritanceType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
/* Use only for disjoin constraints */
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorValue("EMPLOYEE")
public class Emloyee {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String lastName;
    private String middleName;
    private String firstName;

    @Column(unique = true)
    private String CCCD;
    private String phoneNumber;
    private String email;
    private String salary;

    @ManyToOne(cascade = CascadeType.REMOVE)
    @JoinColumn(name = "id_supervisor", referencedColumnName = "id")
    private Emloyee employee; 

    @ManyToOne(cascade = CascadeType.REMOVE)
    private Long id_branch;
}
