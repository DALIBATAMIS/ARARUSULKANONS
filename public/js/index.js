const get_news = (async () => {
    json = await $.get("/get_articles", (data, status) => {
        json = "{}";
    
        if (status != "success") {
            alert("Couldn't load articles.");
        }
    
        json = data;
        return json;
    });

    return JSON.parse(json);
})();

let global_index = 0;

const update_articles = (async (index) => {
    for (let i = index; i < index + 10; i++) {
        
    }
});

(async () => {
    console.log(await get_news)
})();
