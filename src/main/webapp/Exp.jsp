<%-- 
    Document   : VehicleForm
    Created on : 5 Jul 2023, 4:28:42 am
    Author     : MUHAMMAD FAUZUL AZIM BIN IMRAN HAYAT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Vehicle Form</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
</head>
<body>
    <jsp:include flush="true" page="header.jsp" />
    <div class="container">
        <h1>Vehicle Form</h1>
        <form action="vehicle/add" method="post" enctype="multipart/form-data">
            <div class="mb-3">
                <label for="vehicleType" class="form-label">Vehicle Type</label>
                <select class="form-control" id="vehicleType" name="vehicleType" required>
                    <option value="Motorcycle">Motorcycle</option>
                    <option value="Lorry">Lorry</option>
                    <option value="Van">Van</option>
                </select>
            </div>
            <div class="mb-3">
                <label for="roadTaxExp" class="form-label">Road Tax Expiry Date</label>
                <input type="text" class="form-control" pattern="\d{2}/\d{2}/\d{2}" id="roadTaxExp" name="RoadTaxExp" required>
            </div>
            <div class="mb-3">
                <label for="picture" class="form-label">Picture</label>
                <input type="file" class="form-control" id="picture" name="Picture"  required>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>
</body>
</html>