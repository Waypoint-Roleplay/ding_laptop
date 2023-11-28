Laptop = {}

$(document).on('keydown', function() {
    switch(Event.keyCode) {
        case 27:
            Laptop.Close();
            break;

    }
});

$(document).ready(function(){
    window.addEventListener('message', function(event){
        var action = event.data.action;
        switch(action) {
            case "openLaptop":
                Laptop.Open(event.data);
                break;
            case "closeLaptop":
                Laptop.Close();
                break;
        }
    });
});

Laptop.Open = function(data) {
    $(".laptop").fadeIn(1000);
    const backgroundImage = data.item.info.backgroundImage || 'https://i.imgur.com/fkKbdqc.png';
    $(".laptop").css('background-image', `url(${backgroundImage})`);
}

Laptop.Close = function(data) {
    $(".laptop").fadeOut(500);
    $.post('http://ding_laptop/closeLaptop');
}

$(document).on('click', '#closelaptop', function(e) {
    e.preventDefault();
    Laptop.Close();
});

window.onload = function(e) {
    $(".laptop").hide();
    $(".iframe").hide();
}

$(document).on('click', '#experience-app-button', async function(e) {
    e.preventDefault();
    $(".app-icons").hide();
    $(".experience-app").show();

    const experienceData = await fetchExperienceAppData();
    renderExperienceApp(JSON.parse(experienceData));
})

$(document).on('click', '.window-close-button', function(e) {
    e.preventDefault();
    $(".experience-app").hide();
    $(".settings-app").hide();
    $(".files-explorer").hide();
    $(".drone-controller").hide();
    $(".app-icons").show();
    $(".change-background").hide();
})

$(document).on('click', '#racing-app-button', async function(e) {
    e.preventDefault();
    Laptop.Close();
    $.post('http://ding_laptop/openRacingApp')
})

$(document).on('click', '#boosting-app-button', async function(e) {
    e.preventDefault();
    Laptop.Close();
    $.post('http://ding_laptop/openBoostingApp');
})

$(document).on('click', '#settings-button', function(e) {
    e.preventDefault();
    $(".settings-app").show();
    $(".files-explorer").hide();
})

$(document).on('click', '#background-image-button', function(e) {
    e.preventDefault();
    $(".change-background").show();
})

$(document).on('click', '.decline-button', function(e) {
    e.preventDefault();
    $(".change-background").hide();
})

$(document).on('click', '.confirm-button', function(e){
    e.preventDefault();
    let backgroundImage = 'https://i.imgur.com/fkKbdqc.png'

    const inputText = $('.input-box').val()
    if (inputText !== '') {
        backgroundImage = inputText
    }
    $.post('https://ding_laptop/SaveLaptopBackground', JSON.stringify({
        background: backgroundImage,
    }))

    $(".laptop").css('background-image', `url(${backgroundImage})`)
    $(".change-background").hide();
    $(".settings-app").hide();
});

$(document).on('click', '#files-button', function(e) {
    e.preventDefault();
    $(".files-explorer").show();
    $(".settings-app").hide();
})

/* $(document).on('click', '#drone-icon', function(e) { -- disabled cause I never found a drone resource I liked, feel free to disable this and add yours in!
    e.preventDefault();
    $(".files-explorer").hide();
    $(".drone-controller").show();
}) */

const fetchExperienceAppData = async () => {
    const postRequest = $.post('http://ding_laptop/fetchExperienceAppData', JSON.stringify({}));

    // This will return when the post request is done and the response is received
    return postRequest.done()
}

const renderExperienceApp = (data) => {
    const jobRep = data.jobrep;
    const craftingRep = data.craftingrep;
    const drugRep = data.drugrep;

    // Job Rep
    const jobRepItems = `
        <li>TAXI ${jobRep.taxi}</li>
        <li>VINEYARD ${jobRep.vineyard}</li>
        <li>HOTDOG ${jobRep.hotdog}</li>
        <li>BUS ${jobRep.bus}</li>
        <li>TRUCKER ${jobRep.trucker}</li>
        <li>GARBAGE ${jobRep.garbage}</li>
        <li>TOW ${jobRep.tow}</li>
    `;

    $('#job-experience-list').html(jobRepItems)

    // Crafting Rep
    const craftingRepItems = `
    <li>ITEM ${craftingRep.craftingrep}</li>
    <li>WEAPONS ${craftingRep.weaponcraftingrep}</li>
    <li>ATTACHMENTS ${craftingRep.attachmentcraftingrep}</li>
    `;

    $('#crafting-experience-list').html(craftingRepItems)

    // Drug Rep
    const drugRepItems = `
    <li>WEED ${drugRep.weed}</li>
    <li>COKE ${drugRep.coke}</li>
    <li>METH ${drugRep.meth}</li>
    <li>DEALER ${drugRep.dealerrep}</li>
    `;
    $('#drug-experience-list').html(drugRepItems)
}