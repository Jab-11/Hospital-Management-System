<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Discharge Patient</title>
    <style>
        body {
            text-align: center;
            font-family: Arial, sans-serif;
            transform: scale(0.95);
        }

        #add input {
            padding: 15px 10px;
            margin: 5px;
            width: 80%;
            font-size: 16px;
            border-radius: 5px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        #add {
            margin: 0 auto;
            max-width: 600px;
        }

        h2 {
            margin-top: 25px;
        }

        table {
            margin: 0 auto;
            border-collapse: collapse;
            width: 90%;
            
        }

        tr {
        	width: 100%;
            display: flex;
            justify-content: center;
            gap: 0px;
        }

        td {
            padding: 5px 0;
            width: 100%;
            text-align: center;
        }
		td input{
			width: 100%;
		}
       

        .button-container {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        button {
            padding: 15px 10px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            display: block;
            width: 72%;
            margin: 0 auto;
            color: white;
            background-color: #007bff;
            cursor: pointer;
        }

        input[type="submit"] {
            background-color: green;
            color: white;
            width: 68%;
            margin: 0 auto;
            cursor: pointer;
        }

    </style>
</head>
<body>
    <h2>Discharge Patient</h2>
    <form id="add" method="POST" action="Discharge">
        <table>
            <tbody id="medicineTable">
            
                <tr>
                    <td colspan="2"><input type="text" name="pid" placeholder="Patient ID (Ex. P0001)"></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="number" name="days" placeholder="Days Admitted (0 if OPD)"></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="number" step="0.01" name="daycost" placeholder="Price per day"></td>
                </tr>
                <tr>
                    <td style="width: 50%;"><input type="text" name="mid0" style="position: relative; left: 25px;" placeholder="MID"></td>
                    <td style="width: 50%;"><input type="number" name="quant0" min="0" style="position: relative; right: 25px;" placeholder="Quantity"></td>
                </tr> 
            </tbody>
        </table>
        <button type="button" onclick="addMed()">Add</button>
       	<input type="submit" value="GET RECEIPT">
    </form>
    <script type="text/javascript">
        let i = 1;
        function addMed() {
            let newRow = "<tr><td style=\"width: 50%;\"><input type=\"text\" name=\"mid" + i + "\" style=\"position: relative; left: 25px;\" placeholder=\"MID\"></td><td style=\"width: 50%;\"><input type=\"number\" name=\"quant" + i + "\" min=\"0\" style=\"position: relative; right: 25px;\" placeholder=\"Quantity\"></td></tr>";
            i++;
            document.getElementById("medicineTable").innerHTML += newRow;
        }
    </script>
</body>
</html>
