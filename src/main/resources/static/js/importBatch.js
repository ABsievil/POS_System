// Send GET request to backend API
fetch('http://localhost:8090/api/v1/ImportProductBatch/getAllProductBatch')
 .then(response => response.json())
 .then(data => {
    const importBatchBody = document.getElementById('importBatchBody');
    const importBatchs = data.data;

    // Clear the table body before inserting new data
    importBatchBody.innerHTML = '';

    importBatchs.forEach(importBatch => {
      const row = document.createElement('tr');

      // Create table cells for each column
      row.innerHTML = `
        <td>${importBatch.branchID}</td>
        <td>${importBatch.batchDate}</td>
        <td>${importBatch.productTypeName}</td>
        <td>${importBatch.totalQuantity}</td>
        <td>${importBatch.total}</td>
      `;

      importBatchBody.appendChild(row);
    });
  })
 .catch(error => console.error('Error:', error));