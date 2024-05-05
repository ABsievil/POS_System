// Send GET request to backend API
const employeeID = document.getElementById('employeeID').textContent;

fetch(`http://localhost:8090/api/v1/Employee/${employeeID}`)
.then(response => response.json())
.then(data => {
  const employeeBody = document.getElementById('employeeBody');
  const employees = data.data;

  // Clear the table body before inserting new data
  employeeBody.innerHTML = '';

  employees.forEach(employee => {
    const row = document.createElement('tr');

    // Create table cells for each column
    row.innerHTML = `
      <td>${employee.employeeID}</td>
      <td>${employee.lastName} ${employee.middleName} ${employee.firstName}</td>
      <td>${employee.cccd}</td>
      <td>${employee.phoneNo}</td>
      <td>${employee.email}</td>
      <td>${employee.supervisorID}</td>
      <td>${employee.salary}</td>
      <td>${employee.branchID}</td>
      <td><button>Xóa</button></td>
    `;
    employeeBody.appendChild(row);

    const Lname = document.getElementById("Lname");
    const Mname = document.getElementById("Mname");
    const Fname = document.getElementById("Fname");
    const empID = document.getElementById("empID");
    const supID = document.getElementById("supID");
    const BrID = document.getElementById("brID");
    const mycccd = document.getElementById("mycccd");
    const mysdt = document.getElementById("mysdt");
    const myemail = document.getElementById("myemail");
    const mysalary = document.getElementById("mysalary");
    Lname.value = employee.lastName;
    Mname.value = employee.middleName;
    Fname.value = employee.firstName;
    empID.value = employee.employeeID;
    supID.value = employee.supervisorID;
    BrID.value = employee.branchID;
    mycccd.value = employee.cccd;
    mysdt.value = employee.phoneNo;
    myemail.value = employee.email;
    mysalary.value = employee.salary;
    
  });
 })
.catch(error => console.error('Error:', error));