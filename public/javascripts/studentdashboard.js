



(async () => {
    let data = await axios.get("http://numbersapi.com/7",{
        responseType:"json"
    });

    // console.log(data);
})();

function example(data){
    const string = `<div class="col s12 m6">
    <div class="card horizontal">
        <div class="card-stacked">
            <div class="card-content">
                <div class="row">
                    <div class="col s4">
                        <img src="$(image_link)" alt="" class="circle" width="50%">
                    </div>
                    <div class="col s8">
                        <p>$(intro)</p>
                    </div>
                </div>
            </div>
            <div class="card-action">
                <div class="container">
                    <div class="left">
                        <a href="/profiles/$(id)">View Profile</a>
                    </div>
                    <div class="right">
                        <a href="/profiles/$(id)">Chat</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>`
}
