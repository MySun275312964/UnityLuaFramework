require "Framework.MessageCenter"

class("Test2")

function Test2:Awake()
  self.areaCode = 1
  self.TestMsg = "This is Test2 msg"
  MessageCenter:GetInstance():JoinArea(self.areaCode, self)
end

function Test2:Start()
end

function Test2:OnMessage(head, content, callBackFunc, sender, ...)
  if head == 11 then 
    self.transform.gameObject:SetActive(not(self.unityInstance.isActiveAndEnabled)) 
    if callBackFunc ~= nil and ... ~= nil then
      local args = {...}
      print("send args[1] = "..args[1])
      callBackFunc(sender, self.TestMsg)
    end
    return
  end 
end
