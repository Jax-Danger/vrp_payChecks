--##########    VRP Main    ##########--
-- init vRP client context
Tunnel = module("vrp", "lib/Tunnel")
Proxy = module("vrp", "lib/Proxy")

local cvRP = module("vrp", "client/vRP")
vRP = cvRP()

local pvRP = {}
-- load script in vRP context
pvRP.loadScript = module
Proxy.addInterface("vRP", pvRP)

local PayChecks = class("PayChecks", vRP.Extension)            -- Class Name, Can be changed to anything (match with server class name to make things easier
local cfg = module("vrp_payChecks", "config/cfg")            -- Optional, Change vrp_PayChecks to match folder name


function PayChecks:__construct()                            -- Change PayChecks to match Class Name
  vRP.Extension.__construct(self)

  print('^2[Paychecks]^7 is now loaded. Current paycheck frequency is set to '..cfg.frequency..' minute(s).')

  CreateThread(function()
    local timer
    timer         = lib.timer(cfg.frequency * 60000, function()
      local paycheck = self.remote.payDay()
      if paycheck then
        print('It\'s payday!')
        timer:restart()
      end
    end, true)

    while cfg.debug do
      print(timer:getTimeLeft('m'))  -- 0.08 minutes
      --Wait(60000)
      Wait(500)
    end
  end)
end



vRP:registerExtension(PayChecks)
