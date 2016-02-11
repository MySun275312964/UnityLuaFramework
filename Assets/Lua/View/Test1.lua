require "Framework.MessageCenter"

class("Test1")

function Test1:Awake(csInstance)
  self.unityInstance = csInstance
  self.areaCode = 1
  MessageCenter:GetInstance():JoinArea( self.areaCode, self)
end

function Test1:Start()
  MessageCenter:GetInstance():SendMessage(2)
end

function Test1:OnMessage(head, content)
  print("Test1Message")
end
