require "Framework.MessageCenter"

class("Test2")

function Test2:Awake(csInstance)
  self.unityInstance = csInstance
  self.areaCode = 2
  MessageCenter:GetInstance():JoinArea(self.areaCode, self)
end

function Test2:OnMessage(head, content)
  print("Test2Message")
end
