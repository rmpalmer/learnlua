local rack = require("rack")

math.randomseed(os.time())

code_rack = rack()

code_rack:add("Alfred",1)
code_rack:add("Bob",30)
code_rack:add("Charles",5)
code_rack:add("Doug",7)
code_rack:add("Evan",17)
code_rack:add("Fred",23)
code_rack:add("George",21)
code_rack:add("Harvey",2)
code_rack:add("Ivan",11)
code_rack:add("Jack",20)
code_rack:add("Kevin",12)
code_rack:add("Lou",29)

code_rack:dump()

who = code_rack:pop()
while who
do
  print("next lucky winner is " .. who)
  who = code_rack:pop()
end
