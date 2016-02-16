require "Framework.MessageCenter"

class("Test1")

function Test1:Awake()
  self.areaCode = 1
  self.btn1 = self.unityInstance.transforms[0]:GetComponent('Button')
  MessageCenter:GetInstance():JoinArea( self.areaCode, self)
end

function Test1:Start()
  self.btn1.onClick:AddListener(Click1)
  MessageCenter:GetInstance():SendMessage(1, 11, nil, Test1.Callback, self, "Test1 sended")
end

function Click1()
  MessageCenter:GetInstance():SendMessage(1, 11)
end


function Test1:OnMessage(head, content)
  
end

function Test1:Callback(backMsg)
  print(backMsg)
end

