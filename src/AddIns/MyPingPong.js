"use strict"

var timerObject;

function initializeControlAddIn(id) {
    var controlAddIn = document.getElementById(id);

    controlAddIn.innerHTML =
		'<div id="my-ping-pong">' +
		'</div>';
    pageLoaded();

	Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('ControlAddInReady', null);
}

function pageLoaded() {
}

function StartTimer(milliSeconds) {
    if (milliSeconds == 0 || milliSeconds == null) {
        Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('PingPongError', ['No timer interval set.']);
        return;
    }

    timerObject = window.setInterval(ExecuteTimer, milliSeconds);
}


function StopTimer() {
    clearInterval(timerObject);
}

function ExecuteTimer() {
    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('TimerElapsed', null);
}