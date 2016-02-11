require "Framework.MessageCenter"

class("LuaClassSimple")

function LuaClassSimple:Awake(csInstance)
  self.unityInstance = csInstance
  self.areaCode = 1
  MessageCenter:GetInstance():JoinArea(1, self)
end

function LuaClassSimple:Start()
  
end

function LuaClassSimple:OnDestory()
  MessageCenter:GetInstance():LeaveArea(1, self)
end
