<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Temporary Dashboard</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="style/style.css">
    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body class="bg-light">

<div class="container my-5">
    <h1 class="mb-4">Temporary Dashboard</h1>
    
    <!-- Stats Row -->
    <div class="row text-center">
        <div class="col-md-4 mb-3">
            <div class="card shadow rounded-3">
                <div class="card-body">
                    <h5 class="card-title">Users</h5>
                    <p class="display-6">1,245</p>
                </div>
            </div>
        </div>
        
        <div class="col-md-4 mb-3">
            <div class="card shadow rounded-3">
                <div class="card-body">
                    <h5 class="card-title">Sales</h5>
                    <p class="display-6">₱45,600</p>
                </div>
            </div>
        </div>
        
        <div class="col-md-4 mb-3">
            <div class="card shadow rounded-3">
                <div class="card-body">
                    <h5 class="card-title">Orders</h5>
                    <p class="display-6">320</p>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Chart Section -->
    <div class="card shadow rounded-3 mt-4">
        <div class="card-body">
            <h5 class="card-title">Monthly Performance</h5>
            <canvas id="myChart" height="100"></canvas>
        </div>
    </div>
    
    <!-- Export Button -->
    <div class="text-end mt-3">
        <a href="#" class="btn btn-primary rounded-pill shadow">Export Report</a>
    </div>
</div>

<script>
    const ctx = document.getElementById('myChart');
    new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ['Jan', 'Feb', 'Mar', 'Apr'],
            datasets: [{
                label: 'Performance',
                data: [40, 55, 30, 75],
                backgroundColor: '#3b82f6',
                borderRadius: 8
            }]
        },
        options: {
            responsive: true,
            plugins: { legend: { display: false } }
        }
    });
</script>

</body>
</html>
