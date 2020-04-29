let webSocket = new WebSocket("ws://localhost:8080/comment");
let commentRequest = new XMLHttpRequest();

webSocket.onmessage = function (ev) {
    writeResponse(ev.data);
};

let forms = document.getElementById("blog").getElementsByTagName("form");
for (let i = 0; i < forms.length; i++) {
    forms[i].addEventListener('submit', ev => {
        ev.preventDefault();
        let name = document.getElementById("username"+forms[i].id).value;
        let comment = document.getElementById("comment"+forms[i].id).value;
        let rating = document.getElementById("rating"+forms[i].id).value;

        let total = forms[i].id +"-" + name + ": " + comment + "\t\trating: " + rating;

        commentRequest.open("POST", "/Controller?action=PostComment");
        commentRequest.setRequestHeader("Content-Type", 'application/x-www-form-urlencoded');
        commentRequest.send(`name=${name}&comment=${comment}&rating=${rating}`);


        document.getElementById("comment"+forms[i].id).value = '';
        document.getElementById("rating"+forms[i].id).value = '';

        send(total);
    });
}

function send(text){
    webSocket.send(text);
}

function closeSocket(){
    webSocket.close();
}

function writeResponse(text){
    if (text === "Connection Established") {}
    let comment = text.split("-");
    document.getElementById("comments" + comment[0]).innerHTML += "<li>" + comment[1] + "</li>";
}