let shacogibiananisikims = false;
let cooldownTimer = null;

window.addEventListener('message', function(event) {
    if (event.data.type === 'sescal') {
        if (shacogibiananisikims) {
            return;
        }

        const sound1 = document.getElementById('nedenbukadarciddisin');
        const sound2 = document.getElementById('bakbirvarimbiryokum');
        const randomSound = Math.random() < 0.5 ? sound1 : sound2;
        randomSound.volume = 0.5;
        randomSound.play();
    }
    else if (event.data.type === 'beklemesuresibaslat') {
        beklemesuresibaslatOverlay(event.data.duration);
    }
});

function beklemesuresibaslatOverlay(seconds) {
    shacogibiananisikims = true;
    const overlay = document.getElementById('beklemesuresi');
    overlay.style.display = 'block';

    let remainingSeconds = seconds;
    overlay.textContent = remainingSeconds;

    cooldownTimer = setInterval(() => {
        remainingSeconds--;
        overlay.textContent = remainingSeconds;

        if (remainingSeconds <= 0) {
            clearInterval(cooldownTimer);
            overlay.style.display = 'none';
            shacogibiananisikims = false;
        }
    }, 1000);
}
