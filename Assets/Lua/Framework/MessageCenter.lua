require "System.Global"

class("MessageCenter")

function MessageCenter:GetInstance()
  if self.instance == nil then
    self.instance = self:New()
    self.areaGroups = {}
  end   
  return self.instance
end

function MessageCenter:JoinArea(areaCode, luaTable)
  for k,v in pairs(self.areaGroups) do
    if k == areaCode and table.contains(self.areaGroups[k], luaTable) == false then 
     
      table.insert(self.areaGroups[k], luaTable) 
      return
    end 
  end 
  self.areaGroups[areaCode] = {}
  table.insert(self.areaGroups[areaCode], luaTable) 
end

function MessageCenter:LeaveArea(areaCode, luaTable)
  for k,v in pairs(self.areaGroups) do
    if k == areaCode then 
      RemoveTableItem(self.areaGroups[k], luaTable) 
      return
    end 
  end 
end

function MessageCenter:SendMessage(areaCode, head, content, callbackFunc, sender, ...)
  for k1,v1 in pairs(self.areaGroups) do
    if k1 == areaCode then
      --print(#self.areaGroups[k1])
      for k2,v2 in pairs(self.areaGroups[k1]) do
        if v2.OnMessage ~= nil then
          v2:OnMessage(head, content, callbackFunc, sender, ...)
        end
      end
      return
    end
  end
end

function MessageCenter:ClearArea(areaCode)
  if self.areaGroups[areaCode] ~= nil then
    self.areaGroups[areaCode] = nil
  end
end

function MessageCenter:ClearAllArea()
  self.areaGroups = {}
end