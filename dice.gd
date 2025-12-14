extends Node

# 주사위 표기법 파서/롤러: "2d6+3", "d20+5", "1d8-1"
func roll(dice_notation: String) -> Dictionary:
    var s := dice_notation.strip_edges()
    var pattern = RegEx.new()
    if pattern.compile(r"^(\d*)d(\d+)([+-]\d+)?$") != OK:
        return {"ok": false, "error": "regex compile failed"}
    var m = pattern.search(s)
    if m == null:
        return {"ok": false, "error": "invalid notation"}
    var n = m.get_string(1)
    var sides = int(m.get_string(2))
    var mod = m.get_string(3)
    var count = 1
    if n != "":
        count = int(n)
    var total = 0
    var rolls = []
    for i in range(count):
        var r = randi() % sides + 1
        rolls.append(r)
        total += r
    var modifier = 0
    if mod != "":
        modifier = int(mod)
    total += modifier
    return {"ok": true, "total": total, "rolls": rolls, "modifier": modifier}
