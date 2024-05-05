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
        <td>${employee.employeeID}</td>
        <td>${employee.lastName} ${employee.middleName} ${employee.firstName}</td>
        <td>${employee.cccd}</td>
        <td>${employee.phoneNo}</td>
        <td>${employee.email}</td>
        <td>${employee.supervisorID}</td>
        <td>${employee.salary}</td>
        <td>${employee.branchID}</td>
        <td><button onclick="location.href='/employeeList/updateInfor/${employee.employeeID}'">Chỉnh Sửa</button></td>
      `;

      employeeBody.appendChild(row);
    });
  })
 .catch(error => console.error('Error:', error));
 

 
 function searchEmployees() {
    // prevent default behavior of submit
    //event.preventDefault();
    const employeeBody = document.getElementById('employeeBody');
    
    // delete all current child
    while (employeeBody.firstChild) {
      employeeBody.removeChild(employeeBody.firstChild);
    }


    const employeeKey = document.getElementById('searchBox').value;

    if(employeeKey) {
      fetch(`http://localhost:8090/api/v1/Employee/searchBody`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({ value: employeeKey })
      })
      .then(response => response.json())
      .then(data => {
        // update searched employee list by updateTableContent func
        updateTableContent(data.data);
      })
      .catch(error => console.error('Error:', error));
      
      function updateTableContent(employees) {
        const employeeBody = document.getElementById('employeeBody');
        // delete all current child
        while (employeeBody.firstChild) {
          employeeBody.removeChild(employeeBody.firstChild);
        }
      
        employees.forEach(employee => {
          // Tạo hàng bảng mới và thêm nội dung
          const row = document.createElement('tr');
          row.innerHTML = `
            <td>${employee.employeeID}</td>
            <td>${employee.lastName} ${employee.middleName} ${employee.firstName}</td>
            <td>${employee.cccd}</td>
            <td>${employee.phoneNo}</td>
            <td>${employee.email}</td>
            <td>${employee.supervisorID}</td>
            <td>${employee.salary}</td>
            <td>${employee.branchID}</td>
            <td><button onclick="location.href='/employeeList/updateInfor/${employee.employeeID}'">Chỉnh Sửa</button></td>
          `;
      
          employeeBody.appendChild(row);
        });
      }
    }
};
