// Send GET request to backend API
fetch('http://localhost:8090/api/v1/Employee/getAllEmployee')
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
      <tr>
        <td>${employee.employeeID}</td>
        <td>${employee.lastName} ${employee.middleName} ${employee.firstName}</td>
        <td>${employee.cccd}</td>
        <td>${employee.phoneNo}</td>
        <td>${employee.email}</td>
        <td>${employee.supervisorID}</td>
        <td>${employee.salary}</td>
        <td>${employee.branchID}</td>
        <td><button onclick="location.href='/update'">Chỉnh Sửa</button></td>
      </tr>
      `;

      employeeBody.appendChild(row);
    });
  })
 .catch(error => console.error('Error:', error));