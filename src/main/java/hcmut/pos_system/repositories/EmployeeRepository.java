package hcmut.pos_system.repositories;

import hcmut.pos_system.DTO.EmployeeDTO;
import hcmut.pos_system.models.Employee;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface EmployeeRepository extends JpaRepository<Employee, Long> {
    // @Query("SELECT e FROM Employee e")
    // List<Employee> findAllEmployees();
    // use attribute is method in entity, not is attribute of table in db
    @Query("SELECT e.lastName, e.middleName, e.firstName FROM Employee e")
    List<Object> findEmployeeNames();

    @Query("SELECT e.employeeId, e.lastName, e.middleName, e.firstName, e.CCCD, e.phoneNumber, e.email, e.salary, s.employeeId AS supervisorId, b.branchId " +
            "FROM Employee e " +
            "LEFT JOIN Employee s ON e.supervisor.employeeId = s.employeeId " +
            "INNER JOIN Branch b ON e.branch.branchId = b.branchId")
    List<Object[]> findEmployeesWithSupervisorAndBranchId();
} 