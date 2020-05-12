let xhr = new XMLHttpRequest();
let timeoutid;
getFriends();
getMessages();

document.getElementById('statusForm').addEventListener('submit', (e) => {
    e.preventDefault();
    const status = document.getElementById('statusInput').value;
    document.getElementById('status').innerText = status;
    xhr.open("POST", "Controller?action=SetStatus", true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xhr.send(`status=${status}`);
    document.getElementById('statusInput').value = '';
});


// Addfriend & GetFriend functions - AJAX Part 2 //

document.getElementById("addFriend").addEventListener('submit', (e => {
    e.preventDefault();
    xhr.open("POST", "Controller?action=AddFriend", true);
    xhr.setRequestHeader("Content-Type", 'application/x-www-form-urlencoded');
    xhr.send(`name=${document.getElementById("friendName").value}`);
    document.getElementById("friendName").value = '';
}));

function getFriends() {
    xhr.open("GET", "Controller?action=GetFriends", true);
    xhr.onreadystatechange = showFriends;
    xhr.send(null);
}

function showFriends() {
    if (xhr.status === 200){
        if (xhr.readyState === 4){
            clearTable();
            let text = JSON.parse(xhr.responseText);
            let table = document.getElementById('friends');
            for (let person in text){
                let tr = document.createElement('tr');
                let tdname = document.createElement('td');
                tdname.innerText = text[person].name;
                let tdstatus = document.createElement('td');
                tdstatus.innerText = text[person].statusname;
                let tdform = document.createElement('td');

                let form = document.createElement("form");
                form.id = "chatform";
                form.method = "POST";
                let chatbtn = document.createElement("input");
                chatbtn.type = "button";
                chatbtn.value = "Chat now";
                chatbtn.onclick = function () {
                    document.getElementById("chatRecipient").innerHTML = tdname.innerText;
                    openForm();
                };

                form.appendChild(chatbtn);
                tdform.appendChild(form);
                tr.appendChild(tdname);
                tr.appendChild(tdstatus);
                tr.appendChild(tdform);
                tr.className = 'friendlist';
                table.appendChild(tr);
            }
            timeoutid = setTimeout(getFriends,1000);
        }
    }
}

function clearTable(){
    let friends = document.querySelectorAll('.friendlist');
    let table = document.getElementById('friends');
    for (let i=0;i<friends.length;i++){
        table.removeChild(friends[i]);
    }
}

let $currentUser = document.getElementById("currentuser").innerText;
let $recipient;
let $message = $('#chatbox');
$('#showAndHideFriends').click(function () {
    let button = $('#showAndHideFriends');
    if(button.text() === "Show friends"){
        $('#friends').css('display', 'block');
        button.text("Hide friends");
    } else {
        $('#friends').css('display', 'none');
        button.text("Show friends");
    }
});

function getMessages() {
    $.ajax({
        type: "GET",
        url: "Controller?action=GetMessages",
        async: true,
        success: function (text) {
            getData(text);
        },
        error: function () {
            console.log("error in get");
        }
    });
}

function getData(text) {
        let response = JSON.parse(text);
        let $senderIdStuff = $currentUser.toLowerCase() + "@ucll.be";
        $message.empty();
        for (let message in response) {
            if ($recipient != null){
                if ((response[message].recipientId === $senderIdStuff || $senderIdStuff === response[message].senderId) && (response[message].recipientId === $recipient.toLowerCase()+"@ucll.be" || response[message].senderId === $recipient.toLowerCase()+"@ucll.be")) {
                    $message.append(response[message].sender + ": "+ response[message].message+"<br/>");
                }
            }
        }
        setTimeout(getMessages, 1000);
}

function openForm() {
    $('#chatdiv').css('display', 'block');
    $recipient = $('#chatRecipient').html();
    $('#chatsubmit').unbind();
    $('#chatsubmit').click(sendMessage);
    //document.getElementById("chatsubmit").addEventListener("onclick", sendMessage);
}
function sendMessage() {
    let $text = $('#msg').val();
    $.ajax({
        type: "POST",
        url: "Controller?action=Message",
        data: {"message": $text, "recipient": $recipient.toLowerCase()+"@ucll.be"},
        async: true,
        dataType: "json",
        success: function () {
            console.log("success in send");
            $('#chatbox').append($currentUser + ": " + $text+"<br/>");
            document.getElementById("msg").value = "";
        },
        error: function () {
            console.log("error in send");
        }
    });
}
function closeForm() {
    $('#chatdiv').css('display', 'none');
}

