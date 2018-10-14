function copyToClipboard(textID, e) {
    e.preventDefault();
    var textObj = document.getElementById(textID);
    var range = document.createRange();
    range.selectNode(textObj);
    window.getSelection().addRange(range);
    try {
        var successful = document.execCommand('copy');
        var msg = successful ? 'successful' : 'unsuccessful';
        console.log('Copy email command was ' + msg);
    } catch (err) {
        console.log('Oops, unable to copy');
    }
    window.getSelection().removeAllRanges();
}