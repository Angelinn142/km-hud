window.addEventListener('message', function(event) {
    if (event.data.action === "updateMoney") {
        document.getElementById('cash').innerHTML = '$' + event.data.cash;
        document.getElementById('bank').innerHTML = '$' + event.data.bank;
    } else if (event.data.action === "updateJob") {
        document.getElementById('job').innerHTML = event.data.job;
        document.getElementById('grade').innerHTML = event.data.grade;
    } else if (event.data.action === "showHud") {
        document.getElementById('hud').style.display = 'block'; // Mostrar HUD
    } else if (event.data.action === "hideHud") {
        document.getElementById('hud').style.display = 'none';  // Ocultar HUD
    }
});
