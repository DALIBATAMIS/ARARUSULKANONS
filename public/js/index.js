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

const url_encode = ((url) => {
    return encodeURIComponent(url).replaceAll("%20", "+");
});

const get_link_preview = (async (url) => {
    json = await $.get(`/link_preview/${url_encode(url)}`, (data, status) => {
        json = "{}";
    
        if (status != "success") {
            alert("Couldn't get link preview");
        }
    
        json = data;
        return json;
    });

    return JSON.parse(json);
});

const append_to_articles = ((url, image_url, name, desc) => {
    console.log("Hello, World");

    let html = `
    <div class="news-post">
            <a class="news-url" href="${url}">
                <div class="news-image">
                    <img src="${image_url}">
                </div>
                <div class="news-text-box">
                <p class="news-text-title">${name}</p>
                <p class="news-text-descr">${desc}</p>
            </div>
        </a>
    </div>

    <div class="flex-break"></div>
    `
    
    $(".news-posts").append($(html))
})

const update_articles = (async (index) => {
    let articles = (await get_news).articles

    for (let i = index; i < index + 10; i++) {
        let article = articles[i];
        let url = article.url.slice(10);

        let preview = await get_link_preview(url);

        let title = preview.title;

        console.log(preview);

        if (title == "" || title.error != undefined) continue;

        let desc  = preview.description;
        let image = preview.image;

        append_to_articles(url, image, title, desc);
    }
});

let global_index = 0;

(async () => {
    await get_news;
    update_articles(global_index);

    global_index += 10;

    window.onscroll = ((ev) => {
        console.log(window.innerHeight + window.scrollY);
        if (Math.ceil(window.innerHeight + window.scrollY) >= document.body.offsetHeight && global_index != 70) {
            update_articles(global_index);
            global_index += 10;
        }
    });
    // console.log(await get_news)
})();
