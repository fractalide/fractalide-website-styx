function copyToClipboard(textID, e) {
    e.preventDefault();
    var textObj = document.getElementById(textID);
    var range = document.createRange();
    range.selectNode(textObj);
    window.getSelection().addRange(range);
    try {
        document.execCommand('copy');
    } catch (err) {}
    window.getSelection().removeAllRanges();
}