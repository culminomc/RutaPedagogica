from pathlib import Path

raw = Path("_referencia_junta.html").read_text(encoding="utf-8", errors="replace")
idx = raw.find("/html")
print("idx", idx)
chunk = raw[idx - 80 : idx + 120]
print(chunk)
print("---codes---")
print(" ".join(hex(ord(c)) for c in raw[idx - 20 : idx + 40]))
