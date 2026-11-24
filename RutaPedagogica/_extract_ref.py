from pathlib import Path

raw = Path("_referencia_junta.html").read_text(encoding="utf-8", errors="replace")
key = "\\x22userHtml\\x22:\\x22"
k = raw.find(key)
if k < 0:
    raise SystemExit("key missing")
i = k + len(key)
out = []
while i < len(raw):
    if raw[i] != "\\":
        out.append(raw[i])
        i += 1
        continue
    nxt = raw[i + 1 : i + 2]
    if nxt == "\\":
        out.append("\\")
        i += 2
        continue
    if nxt == "n":
        out.append("\n")
        i += 2
        continue
    if nxt == "t":
        out.append("\t")
        i += 2
        continue
    if nxt == "r":
        out.append("\r")
        i += 2
        continue
    if nxt == "/":
        out.append("/")
        i += 2
        continue
    if nxt == "x":
        hexpart = raw[i + 2 : i + 4]
        ch = chr(int(hexpart, 16))
        escaped = raw[i - 2 : i] == "\\\\"
        if ch == '"' and raw[i + 4 : i + 5] == "," and not escaped:
            break
        out.append(ch)
        i += 4
        continue
    if nxt == "u":
        out.append(chr(int(raw[i + 2 : i + 6], 16)))
        i += 6
        continue
    out.append(raw[i])
    i += 1

once = "".join(out)
print("first", len(once), "nl", once.count("\n"))
print(repr(once[:120]))
print("---tail---")
print(repr(once[-80:]))

html_chars = []
j = 0
while j < len(once):
    if once[j] == "\\" and j + 1 < len(once):
        n = once[j + 1]
        mapping = {"n": "\n", "t": "\t", "r": "\r", '"': '"', "\\": "\\", "/": "/"}
        if n in mapping:
            html_chars.append(mapping[n])
            j += 2
            continue
        if n == "u" and j + 6 <= len(once):
            html_chars.append(chr(int(once[j + 2 : j + 6], 16)))
            j += 6
            continue
    html_chars.append(once[j])
    j += 1

html = "".join(html_chars)
Path("_referencia_decoded.html").write_text(html, encoding="utf-8")
print("html", len(html), "lines", html.count("\n"))
print(html[:250])
print("---END---")
print(html[-200:])
