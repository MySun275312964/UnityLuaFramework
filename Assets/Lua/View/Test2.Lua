require "Framework.MessageCenter"

class("Test2")

function Test2:Awake()
  self.areaCode = 1
  MessageCenter:GetInstance():JoinArea(self.areaCode, self)
  self.text = self.unityInstance.transforms[0]:GetComponent("Text")
end

function Test2:Start()
  self.text.text = "0"
end

function Test2:OnMessage(head, content, callBack)
  if head == 11 then 
    self.transform.gameObject:SetActive(not(self.unityInstance.isActiveAndEnabled)) 
    return
  end 
end
