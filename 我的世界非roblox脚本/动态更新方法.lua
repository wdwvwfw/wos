gg.searchNumber("当前生命值", gg.TYPE_FLOAT)
gg.refineNumber("精确数值")
new_offset = gg.getResults(1)[1].address - base_address
