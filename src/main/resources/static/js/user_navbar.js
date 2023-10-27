const btnUser_close = document.querySelector('.navbar_user-close');
const btnAvatar = document.querySelector('.header_option-user');
const navbarUser = document.querySelector('.navbar_user');
const e = document.querySelector(".search_option");
const searchNameBox = document.querySelector(".search-1");
const searchIntelligentBox = document.querySelector(".search-2");
const searchInput1 = searchNameBox.querySelector('.header_search-input');
const searchInput2 = searchIntelligentBox.querySelector('.header_search-input');
const searchBtn1 = searchNameBox.querySelector('.header_search-btn');
const searchBtn2 = searchIntelligentBox.querySelector('.header_search-btn');

e.onchange = function(){
    var value = e.value;
    if (value == 0){
        searchNameBox.classList.remove('header_navbar_item--disabled')
        searchIntelligentBox.classList.add('header_navbar_item--disabled')
    }else {
        searchIntelligentBox.classList.remove('header_navbar_item--disabled')
        searchNameBox.classList.add('header_navbar_item--disabled')
    }
}

btnAvatar.onclick = (e)=>{
    navbarUser.style.animation = `SlideInLeft ease .3s forwards`
}
btnUser_close.onclick = (e)=>{
    navbarUser.style.animation = `SlideOut linear .3s forwards`
}

searchBtn1.onclick = (e) => {
    window.location.replace("http://localhost:8080/search?keyword=" + searchInput1.value);
}

searchBtn2.onclick = (e) => {
    window.location.replace("http://localhost:8080/search-intelligent?keyword=" + searchInput2.value);
}