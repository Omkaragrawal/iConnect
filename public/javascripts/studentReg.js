'use strict'
// const login = document.getElementById("login_btn");
// login.onclick = function() {
//     var request = new XMLHttpRequest();
//     var userrname = document.getElementById("username").value;
//     var password = document.getElementById("password").value;
//     request.onreadystatechange = function() {
//         if (request.readyState === XMLHttpRequest.DONE) {
//             if (request.status === 200) {
//                 var obj = JSON.parse(request.responseText);
//                 document.getElementById("display").innerHTML = '<h1> user id =' + obj.email + `<h2>
//                 <br>
//                 <h1> password = ` + obj.pass;
//                 alert("Successfull LOGIN");
//             }
//             if (request.status === 403) {
//                 display.innerText = JSON.stringify(request.responseText);
//                 alert(JSON.stringify(request.responseText));
//             }
//         }
//     }
//     request.open("POST", "/login", true);
//     request.setRequestHeader('Content-Type', 'application/json');
//     request.send(JSON.stringify({ module: 1, username: userrname, password: password, querry: "nothing" }));
// };

// const checkForm = (event) => {
//     document.getElementById('name').value = DOMPurify.sanitize(document.getElementById('name').value);
// }

// document.getElementById('name').addEventListener("focusout", (event) => {
//     console.log(event.srcElement);
//     event.srcElement.value = DOMPurify.sanitize(event.srcElement.value);

// });

// document.getElementById('mobile').addEventListener("focusout", (event) => {
//     console.log(event.srcElement);
//     event.srcElement.value = DOMPurify.sanitize(event.srcElement.value);

// });

// document.getElementById('email').addEventListener("focusout", (event) => {
//     console.log(event.srcElement);
//     event.srcElement.value = DOMPurify.sanitize(event.srcElement.value);

// });

document.forms[0].addEventListener('submit', (event) => {
    console.log(event)
    for(input of document.forms[0]) {
      console.log(input);
    }
    return false;
  });