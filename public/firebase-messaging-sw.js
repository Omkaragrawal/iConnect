importScripts('https://www.gstatic.com/firebasejs/7.8.2/firebase-app.js');
importScripts('https://www.gstatic.com/firebasejs/7.8.2/firebase-messaging.js');
const firebaseConfig = {
    apiKey: "AIzaSyDJTFxpV35chn-wNsULDT8GP1jXiUL30Xk",
    authDomain: "apsit-a721d.firebaseapp.com",
    databaseURL: "https://apsit-a721d.firebaseio.com",
    projectId: "apsit-a721d",
    storageBucket: "apsit-a721d.appspot.com",
    messagingSenderId: "1060830937463",
    appId: "1:1060830937463:web:8c6900a7682e20b20aa172",
    measurementId: "G-E8PSCT0EQL"
};

// Initialize Firebase
firebase.initializeApp(firebaseConfig);

firebase.messaging();