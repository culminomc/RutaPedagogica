function toggleMenu() {
    const menu = document.getElementById("mobile-menu");
    menu.classList.toggle("hidden");
}

let slideIndex = 0;
function showSlide(index) {
    const slides = document.querySelectorAll(".slide");
    const dots = document.querySelectorAll(".slide-dot");
    if (!slides.length) return;
    slideIndex = (index + slides.length) % slides.length;
    slides.forEach((slide, i) => slide.classList.toggle("active", i === slideIndex));
    dots.forEach((dot, i) => {
        dot.classList.toggle("bg-white", i === slideIndex);
        dot.classList.toggle("bg-white/40", i !== slideIndex);
    });
    const caption = document.getElementById("slide-caption");
    if (caption) caption.textContent = slides[slideIndex].dataset.title || "";
}
function nextSlide() { showSlide(slideIndex + 1); }
function prevSlide() { showSlide(slideIndex - 1); }

function filterSchools() {
    const query = (document.getElementById("school-search").value || "").toLowerCase();
    const city = document.getElementById("city-filter").dataset.city || "all";
    document.querySelectorAll(".school-card").forEach((card) => {
        const matchesCity = city === "all" || card.dataset.city === city;
        const matchesQuery = !query || card.dataset.search.includes(query);
        card.classList.toggle("hidden", !(matchesCity && matchesQuery));
    });
    document.querySelectorAll(".city-block").forEach((block) => {
        const visible = block.querySelectorAll(".school-card:not(.hidden)").length;
        block.classList.toggle("hidden", visible === 0);
    });
}
function setCity(city, button) {
    document.getElementById("city-filter").dataset.city = city;
    document.querySelectorAll(".city-tab").forEach((tab) => {
        tab.classList.remove("bg-tdf-dark", "text-white");
        tab.classList.add("bg-white", "text-tdf-dark");
    });
    button.classList.add("bg-neutral-900", "text-white");
    button.classList.remove("bg-white", "text-tdf-dark");
    filterSchools();
}

function filterResources(level, button) {
    document.querySelectorAll(".resource-card").forEach((card) => {
        card.classList.toggle("hidden", level !== "all" && card.dataset.level !== level);
    });
    document.querySelectorAll(".res-tab").forEach((tab) => {
        tab.classList.remove("bg-neutral-900", "text-white");
        tab.classList.add("bg-white", "text-neutral-700");
    });
    button.classList.add("bg-neutral-900", "text-white");
    button.classList.remove("bg-white", "text-neutral-700");
}

function openRoute(id) {
    document.querySelectorAll(".route-panel").forEach((panel) => panel.classList.add("hidden"));
    const panel = document.getElementById(id);
    if (panel) panel.classList.remove("hidden");
    const header = document.getElementById("route-modal-header");
    if (header && panel) header.dataset.theme = panel.dataset.theme;
    document.getElementById("route-modal").classList.add("open");
}
function openPitch() {
    document.getElementById("pitch-modal").classList.add("open");
}
function closeModal(id) {
    document.getElementById(id).classList.remove("open");
}

function copyEmail() {
    const email = document.getElementById("official-email").textContent.trim();
    navigator.clipboard.writeText(email);
}

document.addEventListener("DOMContentLoaded", () => {
    showSlide(0);
    setInterval(nextSlide, 6000);
});
