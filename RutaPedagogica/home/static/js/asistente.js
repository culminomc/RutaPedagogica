(function () {
    if (document.getElementById("rp-asistente")) return;

    const csrf = (document.querySelector("[name=csrfmiddlewaretoken]") || {}).value
        || (document.cookie.match(/csrftoken=([^;]+)/) || [])[1]
        || "";
    const root = document.createElement("div");
    root.innerHTML = `
        <button type="button" class="rp-asistente-toggle" id="rp-asistente-toggle" aria-expanded="false" title="Asistente del panel">✦</button>
        <section class="rp-asistente" id="rp-asistente" aria-label="Asistente de administración">
            <header class="rp-asistente-head">
                <p><strong>Asistente del panel</strong><span>Te guío para gestionar el sitio</span></p>
                <button type="button" id="rp-asistente-close" aria-label="Cerrar">×</button>
            </header>
            <div class="rp-asistente-log" id="rp-asistente-log"></div>
            <div class="rp-a-chips" id="rp-asistente-chips"></div>
            <form class="rp-asistente-form" id="rp-asistente-form">
                <label title="Adjuntar imagen, documento o video">📎<input type="file" id="rp-asistente-file" accept="image/*,video/*,.pdf,.doc,.docx,.ppt,.pptx,.zip"></label>
                <input type="text" id="rp-asistente-input" placeholder="Escribí lo que necesitás…" autocomplete="off">
                <button type="submit">Enviar</button>
            </form>
        </section>
    `;
    document.body.appendChild(root);

    const panel = document.getElementById("rp-asistente");
    const toggle = document.getElementById("rp-asistente-toggle");
    const log = document.getElementById("rp-asistente-log");
    const chips = document.getElementById("rp-asistente-chips");
    const form = document.getElementById("rp-asistente-form");
    const input = document.getElementById("rp-asistente-input");
    const file = document.getElementById("rp-asistente-file");

    function abrir() {
        panel.classList.add("is-open");
        toggle.setAttribute("aria-expanded", "true");
        if (!log.dataset.ready) {
            log.dataset.ready = "1";
            enviar("hola");
        }
        input.focus();
    }
    function cerrar() {
        panel.classList.remove("is-open");
        toggle.setAttribute("aria-expanded", "false");
    }
    toggle.addEventListener("click", function () {
        if (panel.classList.contains("is-open")) cerrar();
        else abrir();
    });
    document.getElementById("rp-asistente-close").addEventListener("click", cerrar);

    function pintar(rol, data) {
        const div = document.createElement("div");
        div.className = "rp-a-msg rp-a-msg--" + rol;
        if (typeof data === "string") {
            div.textContent = data;
        } else {
            div.textContent = data.texto || "";
            if (data.pasos && data.pasos.length) {
                const ol = document.createElement("ol");
                data.pasos.forEach(function (p) {
                    const li = document.createElement("li");
                    li.textContent = p;
                    ol.appendChild(li);
                });
                div.appendChild(ol);
            }
            if (data.enlaces && data.enlaces.length) {
                const p = document.createElement("p");
                data.enlaces.forEach(function (e, i) {
                    if (i) p.appendChild(document.createTextNode(" · "));
                    const a = document.createElement("a");
                    a.href = e.url;
                    a.textContent = e.label;
                    p.appendChild(a);
                });
                div.appendChild(p);
            }
        }
        log.appendChild(div);
        log.scrollTop = log.scrollHeight;
        chips.innerHTML = "";
        (data.chips || []).forEach(function (c) {
            const b = document.createElement("button");
            b.type = "button";
            b.textContent = c;
            b.addEventListener("click", function () { enviar(c); });
            chips.appendChild(b);
        });
    }

    function enviar(texto, archivo) {
        if (texto) pintar("user", texto);
        const headers = { "X-CSRFToken": csrf };
        let body;
        if (archivo) {
            body = new FormData();
            body.append("archivo", archivo);
            body.append("mensaje", texto || archivo.name);
        } else {
            headers["Content-Type"] = "application/json";
            body = JSON.stringify({ mensaje: texto });
        }
        fetch("/admin/asistente/chat/", { method: "POST", headers: headers, body: body, credentials: "same-origin" })
            .then(function (r) { return r.json(); })
            .then(function (data) { pintar("bot", data); })
            .catch(function () { pintar("bot", "No pude completar el pedido. Probá de nuevo."); });
    }

    form.addEventListener("submit", function (ev) {
        ev.preventDefault();
        const texto = input.value.trim();
        const adjunto = file.files[0];
        if (!texto && !adjunto) return;
        input.value = "";
        file.value = "";
        enviar(texto, adjunto);
    });
    input.addEventListener("keydown", function (ev) {
        if (ev.key !== "Enter") return;
        ev.preventDefault();
        ev.stopPropagation();
        form.requestSubmit();
    }, true);

    window.rpAbrirAsistente = abrir;
    document.addEventListener("click", function (ev) {
        const link = ev.target.closest("a");
        if (!link || (link.getAttribute("href") || "").indexOf("rp-asistente") === -1) return;
        ev.preventDefault();
        abrir();
    });
})();
