<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Page</title>
        <script
            src="https://code.jquery.com/jquery-2.2.4.min.js"
            integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
        <script type="text/javascript">
            function init() {
            useridField = document.getElementById("userid");
            statusField = document.getElementById("status");
            }
            function doChecking() {
            var serviceurl = "checkuserid?userid=" + escape(useridField.value);
            $.ajax({url: serviceurl, success: setMessaage});
            }
            function setMessaage(responseXML) {
            var statusElement = responseXML.getElementsByTagName("status")[0];
            var status = statusElement.childNodes[0].nodeValue;
            if (status == "NotAvailable") {
            statusField.innerHTML = "<font color=red>This User Id is already in use. Please choose some other User Id.</font>";
            } else {
                    statusField.innerHTML = "<font color=green>You can use this User ID.</font>";
            }
            }
        </script> 
    </head>
    <body onload="init()">
        <h1>Kindly Fill details:</h1>
        <form name="registrationForm" action="checkuserid">
            <table>
                <tr>
                    <td>User Id</td>
                    <td><input type="textfield" name="userid" id="userid" 
                               onchange="doChecking();"/></td>
                    <td><div id="status"></div></td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><input type="textfield" name="name"/></td>
                    <td></td>
                </tr>
                <tr>
                    <td>Semester</td>
                    <td><input type="textfield" name="name"/></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit"/></td>
                    <td></td>
                </tr>
            </table>
        </form>
    </body>
</html>
