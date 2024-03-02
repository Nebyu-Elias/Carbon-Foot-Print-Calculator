<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Calculator 1.aspx.cs" Inherits="WebApplication1.Calculator_1" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Carbon Emission Tracker</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid black;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }
    </style>
</head>
<body>

    <h1>Data Entry Page</h1>

    <!-- Transport Emissions Section -->
    <h2>Transport Emissions</h2>
    <form id="transportForm">
        <label for="vehicleType">Vehicle Type:</label>
        <select id="vehicleType" name="vehicleType">
            <option value="car">Car</option>
            <option value="truck">Truck</option>
            <option value="bus">Bus</option>
        </select><br>

        <label for="distance">Distance Travelled (in miles or kilometers):</label>
        <input type="text" id="distance" name="distance"><br>

        <label for="fuelType">Fuel Type:</label>
        <select id="fuelType" name="fuelType">
            <option value="gasoline">Gasoline</option>
            <option value="diesel">Diesel</option>
            <option value="petrol">Petrol</option>
            <option value="electric">Electric</option>
        </select><br>

        <label for="fuelEfficiency">Fuel Efficiency (Gallons per mile or kilometer):</label>
        <input type="text" id="fuelEfficiency" name="fuelEfficiency"><br>

        <button type="button" onclick="submitTransportData()">Submit</button>
    </form>

    <!-- Electricity Consumption Section -->
    <h2>Electricity Consumption</h2>
    <form id="electricityForm">
        <label for="energySource">Energy Source:</label>
        <select id="energySource" name="energySource">
            <option value="grid">Grid</option>
            <option value="solar">Solar</option>
            <option value="wind">Wind</option>
            <!-- Add more options as needed -->
        </select><br>

        <label for="electricityUsage">Electricity Usage (Kilowatt-Hours):</label>
        <input type="text" id="electricityUsage" name="electricityUsage"><br>

        <button type="button" onclick="submitElectricityData()">Submit</button>
    </form>

    <h1>Data History (Report) Page</h1>

    <!-- Transport Emissions History Table -->
    <h2>Transport Emissions History</h2>
    <table id="transportTable">
        <tr>
            <th>Vehicle Type</th>
            <th>Distance</th>
            <th>Fuel Type</th>
            <th>Fuel Efficiency</th>
            <th>Entry Date</th>
            <th>Carbon Footprint (kg CO2)</th>
        </tr>
        <!-- Data will be populated dynamically -->
    </table>

    <!-- Electricity Consumption History Table -->
    <h2>Electricity Consumption History</h2>
    <table id="electricityTable">
        <tr>
            <th>Energy Source</th>
            <th>Electricity Usage (Kilowatt-Hours)</th>
            <th>Entry Date</th>
            <th>Carbon Footprint (kg CO2)</th>
        </tr>
        <!-- Data will be populated dynamically -->
    </table>

    <script>
        function submitTransportData() {
            const vehicleType = document.getElementById("vehicleType").value;
            const distance = parseFloat(document.getElementById("distance").value);
            const fuelType = document.getElementById("fuelType").value;
            const fuelEfficiency = parseFloat(document.getElementById("fuelEfficiency").value);

            const carbonFootprint = calculateTransportCarbonFootprint(vehicleType, distance, fuelType, fuelEfficiency);

            addRowToTransportTable(vehicleType, distance, fuelType, fuelEfficiency, carbonFootprint);
        }

        function submitElectricityData() {
            const energySource = document.getElementById("energySource").value;
            const electricityUsage = parseFloat(document.getElementById("electricityUsage").value);

            const carbonFootprint = calculateElectricityCarbonFootprint(energySource, electricityUsage);

            addRowToElectricityTable(energySource, electricityUsage, carbonFootprint);
        }

        function calculateTransportCarbonFootprint(vehicleType, distance, fuelType, fuelEfficiency) {
            const emissionFactors = {
                'gasoline': 2.3,  // kg CO2 per liter
                'diesel': 2.7,
                'petrol': 2.1,
                'electric': 0.05  // kg CO2 per kilowatt-hour
            };

            const distanceInKm = (fuelType === 'electric') ? distance * 1.60934 : distance;
            const carbonFootprint = distanceInKm * fuelEfficiency * emissionFactors[fuelType];

            return carbonFootprint.toFixed(2);  // Round to two decimal places
        }

        function calculateElectricityCarbonFootprint(energySource, electricityUsage) {
            const emissionFactors = {
                'grid': 0.5,  // kg CO2 per kilowatt-hour
                'solar': 0.1,
                'wind': 0.2
                // Add more sources and corresponding factors as needed
            };

            const carbonFootprint = electricityUsage * emissionFactors[energySource];

            return carbonFootprint.toFixed(2);  // Round to two decimal places
        }

        function addRowToTransportTable(vehicleType, distance, fuelType, fuelEfficiency, carbonFootprint) {
            const entryDate = new Date().toLocaleDateString();

            const table = document.getElementById("transportTable");
            const row = table.insertRow(1);
            const cells = [vehicleType, distance, fuelType, fuelEfficiency, entryDate, carbonFootprint];

            for (let i = 0; i < cells.length; i++) {
                const cell = row.insertCell(i);
                cell.innerHTML = cells[i];
            }
        }

        function addRowToElectricityTable(energySource, electricityUsage, carbonFootprint) {
            const entryDate = new Date().toLocaleDateString();

            const table = document.getElementById("electricityTable");
            const row = table.insertRow(1);
            const cells = [energySource, electricityUsage, entryDate, carbonFootprint];

            for (let i = 0; i < cells.length; i++) {
                const cell = row.insertCell(i);
                cell.innerHTML = cells[i];
            }
        }
    </script>
    <p><a href="https://localhost:44321/Default" class="btn btn-primary btn-md">Home &raquo;</a></p>
</body>
</html>
