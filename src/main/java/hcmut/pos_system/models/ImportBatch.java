package hcmut.pos_system.models;

import java.time.LocalDate;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.IdClass;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToMany;
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
@IdClass(ImportBatchId.class)
public class ImportBatch {
    // đợt nhập lấy 2 khóa ngoại từ bảng ImportProduct chứ k phải từ nguồn sinh ra của 2 khóa ngoại
    @Id
    @ManyToOne(cascade = CascadeType.REMOVE)
    @JoinColumn(name = "id_branch", referencedColumnName = "id")
    private Branch branch;

    @Id
    @ManyToOne(cascade = CascadeType.REMOVE)
    @JoinColumn(name = "id_productType", referencedColumnName = "id")
    private ProductType productType;

    @Id
    private Long productQuantity;

    @Id
    private LocalDate date;

}
