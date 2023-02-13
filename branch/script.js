const screenshotBtn = document.getElementById('screenshot-btn');
const contentDiv = document.getElementById('content');

screenshotBtn.addEventListener('click', () => {
  html2canvas(contentDiv, {useCORS: true})
    .then(canvas => {
      const link = document.createElement('a');
      link.download = 'screenshot.png';
      link.href = canvas.toDataURL();
      link.click();
    });
});