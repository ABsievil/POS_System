// package hcmut.pos_system.databases;

// import org.slf4j.Logger;
// import org.slf4j.LoggerFactory;
// import org.springframework.boot.CommandLineRunner;
// import org.springframework.context.annotation.Bean;
// import org.springframework.context.annotation.Configuration;

// import hcmut.pos_system.models.ActivitySchedule;
// import hcmut.pos_system.models.Appliance;
// import hcmut.pos_system.models.Bill;
// import hcmut.pos_system.models.Branch;
// import hcmut.pos_system.models.Cashier;
// import hcmut.pos_system.models.Discount;
// import hcmut.pos_system.models.DryFood;
// import hcmut.pos_system.models.Employee;
// import hcmut.pos_system.models.FreshFood;
// import hcmut.pos_system.models.ImportBatch;
// import hcmut.pos_system.models.ImportProduct;
// import hcmut.pos_system.models.Manager;
// import hcmut.pos_system.models.ProductBatch;
// import hcmut.pos_system.models.ProductType;
// import hcmut.pos_system.models.Shift;
// import hcmut.pos_system.models.Supplier;

// @Configuration
// public class Database {
//     private static final Logger logger = LoggerFactory.getLogger(Database.class);

//     @Bean
//     CommandLineRunner initDatabase(
//         ActivitySchedule activitySchedule,
//         Appliance appliance,
//         Bill bill,
//         Branch branch,
//         Cashier cashier,
//         Discount discount,
//         DryFood dryFood,
//         Employee employee,
//         FreshFood freshFood,
//         ImportBatch importBatch,
//         ImportProduct importProduct,
//         Manager manager,
//         ProductBatch productBatch,
//         ProductType productType,
//         Shift shift,
//         Supplier supplier
//     ){
//         return new CommandLineRunner() {
//             @Override
//             public void run(String... args) throws Exception {
//             }
//         };
//     }
// }
