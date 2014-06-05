//function for tab switching
function cameratab1(tab) {
	document.getElementById('tab1').style.display = 'none';
	document.getElementById('tab2').style.display = 'none';
	document.getElementById('tab3').style.display = 'none';
	document.getElementById('li_tab1').setAttribute("class", "");
	document.getElementById('li_tab2').setAttribute("class", "");
	document.getElementById('li_tab3').setAttribute("class", "");
	document.getElementById(tab).style.display = 'block';
	document.getElementById('li_'+tab).setAttribute("class", "active");
}

function cameratab2(tab) {
	document.getElementById('tab4').style.display = 'none';
	document.getElementById('tab5').style.display = 'none';
	document.getElementById('tab6').style.display = 'none';
	document.getElementById('li_tab4').setAttribute("class", "");
	document.getElementById('li_tab5').setAttribute("class", "");
	document.getElementById('li_tab6').setAttribute("class", "");
	document.getElementById(tab).style.display = 'block';
	document.getElementById('li_'+tab).setAttribute("class", "active");
}

function armtab(tab) {
	document.getElementById('tab7').style.display = 'none';
	document.getElementById('li_tab7').setAttribute("class", "");
	document.getElementById(tab).style.display = 'block';
	document.getElementById('li_'+tab).setAttribute("class", "active");
}

function drivetab(tab) {
	document.getElementById('tab8').style.display = 'none';
	document.getElementById('li_tab8').setAttribute("class", "");
	document.getElementById(tab).style.display = 'block';
	document.getElementById('li_'+tab).setAttribute("class", "active");
}

function lifttab(tab) {
	document.getElementById('tab9').style.display = 'none';
	document.getElementById('li_tab9').setAttribute("class", "");
	document.getElementById(tab).style.display = 'block';
	document.getElementById('li_'+tab).setAttribute("class", "active");
}

function pumptab(tab) {
	document.getElementById('tab10').style.display = 'none';
	document.getElementById('li_tab10').setAttribute("class", "");
	document.getElementById(tab).style.display = 'block';
	document.getElementById('li_'+tab).setAttribute("class", "active");
}

function rangetab(tab) {
	document.getElementById('tab11').style.display = 'none';
	document.getElementById('li_tab11').setAttribute("class", "");
	document.getElementById(tab).style.display = 'block';
	document.getElementById('li_'+tab).setAttribute("class", "active");
}

//function for cam rendering
$(document).ready(function(){
            if ("WebSocket" in window) {
                cam1 = new WebSocket("ws://10.201.24.53:5000/camera1");
                cam1.onmessage = function (msg) {
                    $("#cam1").attr('src', 'data:image/jpg;base64,' + msg.data);
		    $("#cam4").attr('src', 'data:image/jpg;base64,' + msg.data);
                };
                cam1.onerror = function(e) {
                    console.log(e);
                }
		cam2 = new WebSocket("ws://10.201.24.53:5002/camera2");
                cam2.onmessage = function (msg) {
                    $("#cam2").attr('src', 'data:image/jpg;base64,' + msg.data);
	            $("#cam5").attr('src', 'data:image/jpg;base64,' + msg.data);
                };
                cam2.onerror = function(e) {
                    console.log(e);
                }
		cam3 = new WebSocket("ws://10.201.24.53:5004/camera3");
                cam3.onmessage = function (msg) {
                    $("#cam3").attr('src', 'data:image/jpg;base64,' + msg.data);
		    $("#cam6").attr('src', 'data:image/jpg;base64,' + msg.data);
                };
                cam1.onerror = function(e) {
                    console.log(e);
                }
            } else {
                alert("WebSocket not supported");
            }
        });
