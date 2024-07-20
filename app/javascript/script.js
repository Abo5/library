// script.js

const darkModeToggle = document.getElementById('dark-mode-switch');
const body = document.body;
const header = document.querySelector('header');

darkModeToggle.addEventListener('change', () => {
    body.classList.toggle('light-mode');
    header.classList.toggle('light-mode');
});

// Smooth Scrolling
const navLinks = document.querySelectorAll('.nav-links a');

navLinks.forEach(link => {
    link.addEventListener('click', e => {
        e.preventDefault();
        const target = document.querySelector(link.getAttribute('href'));
        target.scrollIntoView({
            behavior: 'smooth'
        });
    });
});

// Book Carousel
const bookCarousel = document.querySelector('.book-carousel');
let isDown = false;
let startX;
let scrollLeft;

bookCarousel.addEventListener('mousedown', e => {
    isDown = true;
    startX = e.pageX - bookCarousel.offsetLeft;
    scrollLeft = bookCarousel.scrollLeft;
});

bookCarousel.addEventListener('mouseleave', () => {
    isDown = false;
});

bookCarousel.addEventListener('mouseup', () => {
    isDown = false;
});

bookCarousel.addEventListener('mousemove', e => {
    if (!isDown) return;
    e.preventDefault();
    const x = e.pageX - bookCarousel.offsetLeft;
    const walk = (x - startX) * 2;
    bookCarousel.scrollLeft = scrollLeft - walk;
});