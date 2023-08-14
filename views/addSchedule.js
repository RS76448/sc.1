<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Running Schedule</title>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
</head>
<body>
    <h1>Enter Running Schedule</h1>
    <form id="scheduleForm">
        <label for="week">Week:</label>
        <input type="number" name="week" id="week" required><br><br>
        
        <label for="5_days">5 Days:</label>
        <input type="number" name="5_days" id="5_days"><br><br>
        
        <label for="4_days">4 Days:</label>
        <input type="number" name="4_days" id="4_days"><br><br>
        
        <label for="3_days">3 Days:</label>
        <input type="number" name="3_days" id="3_days"><br><br>
        
        <label for="2_days">2 Days:</label>
        <input type="number" name="2_days" id="2_days"><br><br>
        
        <label for="long_workout">Long Workout:</label>
        <input type="number" name="long_workout" step="0.01" id="long_workout"><br><br>
        
        <label for="medium_workout_1">Medium Workout 1:</label>
        <input type="number" name="medium_workout_1" step="0.01" id="medium_workout_1"><br><br>
        
        <label for="medium_workout_2">Medium Workout 2:</label>
        <input type="number" name="medium_workout_2" step="0.01" id="medium_workout_2"><br><br>
        
        <label for="short_workout_1">Short Workout 1:</label>
        <input type="number" name="short_workout_1" step="0.01" id="short_workout_1"><br><br>
        
        <label for="short_workout_2">Short Workout 2:</label>
        <input type="number" name="short_workout_2" step="0.01" id="short_workout_2"><br><br>
        
        <input type="submit" value="Submit">
    </form>

    <!-- Table to display the running schedule -->
    <table id="jsonTable">
        <!-- Columns are defined in JavaScript -->
    </table>

    <!-- Include the generatereport function and other JavaScript here -->

</body>
</html>
