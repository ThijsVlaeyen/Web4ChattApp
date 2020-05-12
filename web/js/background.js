document.getElementById('backgroundForm').addEventListener('submit', (ev => {
    ev.preventDefault();
    let color = document.getElementById("colorChooser").value;
    $.post({
        url: "Controller?action=Background",
        data: {"color": color},
        async: true,
        success : function (text) {
            document.body.style.backgroundColor = text.color;
        }
    })
}));