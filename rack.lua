local Rack = {}
Rack.__index = Rack

setmetatable(Rack, {
__call = function(cls,...)
    return cls:new(...)
  end,
})

function Rack:new()
  local r = {head={},tail={},__size=0,__total_weight=0}
  r.head.__next, r.tail.__prev = r.tail, r.head
  return setmetatable(r, self)
end

function Rack:add(elem,w)
  if elem then
    local node = {__prev = self.tail.__prev
                 ,value = elem
                 ,weight = w
                 ,__next = self.tail}
    node.__prev.__next = node
    self.tail.__prev = node
    self.__size = self.__size + 1
    self.__total_weight = self.__total_weight + w
  end
end

function Rack:pop()
  if (self.__size > 0) then
    local node = self.head
    local target = math.random(self.__total_weight)
    local running = 0
    while node
    do
      if (node.value and node.weight) then
        running = running + node.weight
        --print("is " .. running .. " more than " .. target)
        if (running >= target) then
          local retval = node.value
          self.__size = self.__size - 1
          self.__total_weight = self.__total_weight - node.weight
        
          if node.__prev then
            node.__prev.__next = node.__next
          end
          if node.__next then
            node.__next.__prev = node.__prev
          end
          node = nil
          return retval
        end
      end
    --print("getting next node..")
      node = node.__next
    end
  end
end



function Rack:dump()
  print("--dump--")
  local node = self.head
  while node
  do
    if (node.value) then
      print(node.value)
    end
    node = node.__next
  end
  print("--end--")
end

return Rack