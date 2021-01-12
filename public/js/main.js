const menu_left = document.querySelector('#menu_left');
const menu_right = document.querySelector('#menu_right');

menu_left.addEventListener('click', (e) => {
    let collapsed_menu = undefined;
    let collapsed_menu_icon = undefined;

    if (e.target.nodeName === 'I') {
        collapsed_menu = e.target.parentNode.parentNode.parentNode.parentNode;
    } else if (e.target.nodeName === 'SPAN') {
        collapsed_menu = e.target.parentNode.parentNode.parentNode;
    } else if (e.target.nodeName === 'A') {
        collapsed_menu = e.target.parentNode.parentNode;
    } else {
        return;
    }
    
    collapsed_menu_icon = collapsed_menu.querySelector('.menu_icon');
    console.log(collapsed_menu);
    if (collapsed_menu_icon) {
        collapsed_menu_icon = collapsed_menu_icon.querySelector('i')
        collapsed_menu.classList.toggle('active');
        collapsed_menu_icon.classList.toggle('fa-chevron-right');
        collapsed_menu_icon.classList.toggle('fa-chevron-down');
    }
      
});

menu_right.addEventListener('click', (e) => {
    let collapsed_menu = undefined;
    let collapsed_menu_icon = undefined;

    if (e.target.nodeName === 'I') {
        collapsed_menu = e.target.parentNode.parentNode.parentNode.parentNode;
    } else if (e.target.nodeName === 'SPAN') {
        collapsed_menu = e.target.parentNode.parentNode.parentNode;
    } else if (e.target.nodeName === 'A') {
        collapsed_menu = e.target.parentNode.parentNode;
    } else {
        return;
    }
    
    console.log(collapsed_menu);
    collapsed_menu_icon = collapsed_menu.querySelector('.menu_icon');

    if (collapsed_menu_icon) {
        collapsed_menu_icon = collapsed_menu_icon.querySelector('i')
        collapsed_menu.classList.toggle('active');
        collapsed_menu_icon.classList.toggle('fa-chevron-right');
        collapsed_menu_icon.classList.toggle('fa-chevron-down');
    }
})