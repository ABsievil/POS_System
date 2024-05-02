package hcmut.pos_system.repositories;

import hcmut.pos_system.models.Employee;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface EmployeeRepository extends JpaRepository<Employee, Long> {
    // @Query("SELECT e FROM Employee e")
    // List<Employee> findAllEmployees();
    
} 