// Send GET request to backend API
fetch('http://localhost:8090/api/v1/ProductLot/getAllProductLot')
 .then(response => response.json())
 .then(data => {
    const productBody = document.getElementById('productBody');
    const productLots = data.data;

    // Clear the table body before inserting new data
    productBody.innerHTML = '';

    productLots.forEach(productLot => {
      const row = document.createElement('tr');

      // Create table cells for each column
      row.innerHTML = `
        <td>${productLot.productLotID}</td>
        <td>${productLot.productTypeID}</td>
        <td>${productLot.quantityInLot}</td>
        <td>${productLot.expireDate}</td>
      `;

      productBody.appendChild(row);
    });
  })
 .catch(error => console.error('Error:', error));