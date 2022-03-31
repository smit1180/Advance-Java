var xhr;
var userfield;
var statusfield;
function init() {

    userfield = document.getElementById("userid");
    statusfield = document.getElementById("status");

}

function doCheking() {

    var url = "checkuserid?userid=" + escape(userfield.value);
    xhr = createXHRObject();
    xhr.open("GET", url, true);
    xhr.onreadystatechange = callback;
    xhr.send(null);
}

function createXHRObject() {

    var xhrObject;
    try {
        xhrObject = new XMLHttpRequest();
    } catch (e) {
        try {
            xhrObject = new ActiveXObject("Msxml2.XMLHTTP");
        } catch (e) {
            try {
                xhrObject = new ActiveXObject("Microsoft.XMLHTTP");
            } catch (e) {
                alert("Something Went Wrong");
                return false;
            }
        }
    }
    return xhr;
}
function callback() {
    if (xhr.readyState == 4)
    {

        if (xhr.status == 200) {
            setMessage(xhr.responseXML);
        }

    }


}
function setMessage(responseXML) {

    var statusELement = responseXML.getElemnatsByTagName("status")[0];
    var status = statusELement.childNodes[0].nodeValue;

    if (status === "NotAvailable") {

        statusfield.innerHTML = "<font color =red> this User is already in use</font>";
    } else {

        statusfield.innerHTML = "<font color =green> you can use this id</font>";
    }


}