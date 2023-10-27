const surveyBox = document.querySelector('.survey_box')
var btnYes = surveyBox.querySelector('.button_send_survey')
var btnNo = surveyBox.querySelector('.button_no_satify')
const userSearch = document.querySelector('.user_search')

function sendRequest(label){
    var jsonData = {
        text: userSearch.innerText,
        label: label
    };

    fetch("http://localhost:5000/api/save-assess", {
        method: "POST",
        headers: {
            "Content-Type": "application/json; charset=utf-8"
        },
        body: JSON.stringify(jsonData)
    })
    .then(function(response) {
        if (response.ok) {
            return response.text(); 
        }
    })
    .then(function(data) {
        console.log(data);
    });
}


function showThanksBox(){
    while(surveyBox.firstChild){
        surveyBox.removeChild(surveyBox.firstChild)
    }
    surveyBox.innerHTML = `
        <div class="survey_text">
            Cảm ơn bạn đã đóng góp ý kiến cho chúng mình.
            Mong bạn có một trải nghiệm xem phim vui vẻ!!
        </div>
        <div class="survey_send">
            <i class="survey_icon fa-solid fa-face-smile-wink"></i>
            <i class="survey_icon fa-solid fa-face-kiss-beam"></i>
            <i class="survey_icon fa-solid fa-face-smile-beam"></i>
        </div>
    `
}
btnYes.onclick = (e)=>{
    sendRequest(parseInt(surveyBox.id, 10))
    showThanksBox()
}

btnNo.onclick = (e)=>{
    while(surveyBox.firstChild){
        surveyBox.removeChild(surveyBox.firstChild)
    }
    surveyBox.innerHTML = `
                <div class="survey_text">
                    Hiện tại tâm trạng của bạn như thế nào?
                </div>
                <div class="survey_send">
                    <button class="icon_button button_joy">
                        <i class="fa-regular fa-face-laugh-squint"></i></br>
                        <span class="icon_button-text">Vui vẻ</span>
                    </button>
                    <button class="icon_button button_love">
                        <i class="fa-regular fa-face-grin-hearts"></i></br>
                        <span class="icon_button-text">Yêu</span>
                    </button>
                    <button class="icon_button button_anger">
                        <i class="fa-regular fa-face-angry"></i></br>
                        <span class="icon_button-text">Giận dữ</span>
                    </button>
                    <button class="icon_button button_normal">
                        <i class="fa-regular fa-face-meh"></i></br>
                        <span class="icon_button-text">Bình thường</span>
                    </button>
                    <button class="icon_button button_fear">
                        <i class="fa-regular fa-face-flushed"></i></br>
                        <span class="icon_button-text">Sợ hãi</span>
                    </button>
                    <button class="icon_button button_sad">
                        <i class="fa-regular fa-face-sad-tear"></i></br>
                        <span class="icon_button-text">Buồn</span>
                    </button>
                </div>
    `

    var btnJoy = surveyBox.querySelector('.button_joy')
    var btnLove = surveyBox.querySelector('.button_love')
    var btnAnger = surveyBox.querySelector('.button_anger')
    var btnNormal = surveyBox.querySelector('.button_normal')
    var btnFear = surveyBox.querySelector('.button_fear')
    var btnSad = surveyBox.querySelector('.button_sad')

    btnJoy.onclick = (e)=>{
        sendRequest(1)
        showThanksBox()
    }
    btnLove.onclick = (e)=>{
        sendRequest(2)
        showThanksBox()
    }
    btnAnger.onclick = (e)=>{
        sendRequest(3)
        showThanksBox()
    }
    btnNormal.onclick = (e)=>{
        sendRequest(5)
        showThanksBox()
    }
    btnFear.onclick = (e)=>{
        sendRequest(4)
        showThanksBox()
    }
    btnSad.onclick = (e)=>{
        sendRequest(0)
        showThanksBox()
    }

}