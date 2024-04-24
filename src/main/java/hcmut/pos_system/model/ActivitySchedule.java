package hcmut.pos_system.model;

import java.time.LocalDate;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.IdClass;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@IdClass(ActivityScheduleId.class)
public class ActivitySchedule {
    @Id
    @ManyToOne(cascade = CascadeType.REMOVE)
    @JoinColumn(name = "id_branch", referencedColumnName = "id")
    private Branch branch;

    @Id
    private LocalDate saleDateInWeek;

    @Id
    private LocalDate startTime;
    @Id
    private LocalDate endTime;
}
