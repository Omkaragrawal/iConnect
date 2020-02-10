"use strict";
let req1 = async () => {
    console.time('request start: ');
    try {
        let abc = await fetch("/interests");
        console.log(abc);
        console.timeEnd('request start: ');
        console.time('to json: ');
        const send = await abc.json();
        console.timeEnd('to json: ');
        return send;
    } catch (error) {
        console.log(error);
        console.timeEnd('request start: ');

    }
};

// const getData = async() => {
//     console.time('request made: ');
    
//     const reply = await req1();
//     console.log(await reply);
//     console.timeEnd('request made: ');

//     let string = `<select name="interests" id="interests" multiple class="validate" required aria-placeholder="Select Interest">`;
//     let string1 = `<select name="interests" id="interestsM" multiple class="validate" required aria-placeholder="Select Interest">`;
//     for (let i = 0; i < reply.length; i++){
//         console.log("in for loop");
//         let option = `<option value="${reply[i].id}">${reply[i].name}</option>`;
//          string += option;
//          string1 += option;
//     }
//     string += "</select>";
//     string1 += "</select>";
//     document.getElementById("insertSelect").innerHTML = string;
//     document.getElementById("insertSelect1").innerHTML = string1;
//     console.log(document.getElementById("insertSelect"));
//     console.log(document.getElementById("insertSelect1"));
//     document.getElementById("insertSelect").hidden = false;
//     document.getElementById("insertSelect1").hidden = false;

// };