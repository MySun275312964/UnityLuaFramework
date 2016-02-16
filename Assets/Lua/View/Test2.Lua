require "Framework.MessageCenter"

class("Test2")

function Test2:Awake()
  self.areaCode = 1
  self.TestMsg = "This is Test2 msg"
  MessageCenter:GetInstance():JoinArea(self.areaCode, self)
  self.text = self.unityInstance.transforms[0]:GetComponent("Text")
end

function Test2:Start()
  self.text.text = "0"
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
