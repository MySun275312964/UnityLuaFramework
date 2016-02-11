# PrueLuaFrameworkForUnity
2016/2/11 预览测试版更新

使用方法：运行根目录下Test场景

说明：  
1 框架基于jarjin/SimpleFramework_UGUI进行部分修改（地址https://github.com/jarjin/SimpleFramework_UGUI/）  

2 先阶段修改的部分文件主要有  
  CS：  
    LuaScriptMgr.cs  
    LuaBehaviour.cs  
  Lua：  
    System/class.lua  
    增加Framework/MessageCenter.lua（为了解耦的lua单例类）和Framework/LuaClassSimple.lua（基础标准lua类写法）  

3 快速入门：封装出Lua类的概念。部分实现继承，多态性，和封装3大特性。主要请看一下3个文件  
  MessageCenter.lua     
  LuaClassSimple.lua  
  LuaBehaviour.cs  
    
4 下版本计划（3天内）：增加UI的使用范例  
    
5 今后版本更新预定路线：  
    写个纯lua小游戏范例-->>精简原CS层框架删除无用文件-->>在cs层封装方便用Lua写游戏的wrap文件-->>完整实现Update，OnDisable等函数并优化效率-->>  尽量使框架简洁，模块话等等  
  
    
  
