let xhr = new XMLHttpRequest();
let timeoutid;

getFriends();

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

                tr.appendChild(tdname);
                tr.appendChild(tdstatus);
                tr.appendChild(tdform);
                tr.className = 'friendlist';
                table.appendChild(tr);
            }
            timeoutid = setTimeout(getFriends,750);
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

