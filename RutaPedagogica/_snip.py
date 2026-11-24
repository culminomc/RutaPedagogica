from pathlib import Path

raw = Path("_referencia_junta.html").read_text(encoding="utf-8", errors="replace")
i = raw.find("userHtml")
Path("_snip.txt").write_text(raw[i - 300 : i + 400], encoding="utf-8")
print("wrote", i)
