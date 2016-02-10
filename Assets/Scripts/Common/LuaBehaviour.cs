using System;
using LuaInterface;
using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System;
using UnityEngine.UI;
using SimpleFramework.Manager;

namespace SimpleFramework
{
    public class LuaBehaviour : View
    {
        //模块文件的相对于LuaPath的路径
        public string modulePath;
        //对应的Lua实例的名字
        public string luaClassName;
        //对应的Lua实例的Table
        public object luaInstance;

        protected static bool initialize = false;

        private void Awake()
        {
            LoadLuaFile();
            var result = CallLuaMethod("New");
            if (result != null && result.Length > 0)
            {
                luaInstance = result[0];
            }
            CallLuaMethod("Awake", this);
        }

        private void Start()
        {
            CallLuaMethod("Start");
        }

        private void OnDestory()
        {
            Util.ClearMemory();
            CallLuaMethod("OnDestory");
        }

        protected void LoadLuaFile()
        {
            LuaScriptMgr.Instance.DoFile(modulePath);
        }

        protected object[] CallLuaMethod(string funcName, params object[] args)
        {
            ArrayList luaParams;
            if (luaInstance != null)
            {
                luaParams = new ArrayList { luaInstance };
            }
            else
            {
                luaParams = new ArrayList();
            }
            luaParams.AddRange(args);
            return LuaScriptMgr.Instance.CallLuaFunction(luaClassName + "." + funcName, luaParams.ToArray());
        }

        protected object[] CallMethod(string func, params object[] args)
        {
            if (!initialize) return null;
            return Util.CallMethod(name, func, args);
        }
    }

}
