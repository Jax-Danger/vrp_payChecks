local PayChecks = class("PayChecks", vRP.Extension)
local cfg = module("vrp_payChecks", "config/cfg")

function PayChecks:__construct()
  vRP.Extension.__construct(self)
  print('^2[Paychecks]^7 is now loaded. Current paycheck frequency is set to '..cfg.frequency..' minute(s).')
end

function PayChecks:payDay()
  print('It\'s payday!')

  local user = vRP.users_by_source[source]
  if user == nil then return end
  local job = user:getGroupByType('job')

  -- Loops through jobs in config, matches, then pays the player the job's paycheck.
  for _,v in pairs(cfg.jobs) do
    if job == v.name then
      local amount = v.paycheck
      if cfg.useBank then
        user:giveBank(amount)
        user:save()
        if cfg.debug then
          print('paychecks went through')
        end
        vRP.EXT.Base.remote._notify('^2You just got paid',)
        return true
      else
        user:giveWallet(amount)
        user:save()
        if cfg.debug then
          print('paychecks went through')
        end
        vRP.EXT.Base.remote._notify('^2You just got paid',)
        return true
      end
    end
  end
end

PayChecks.tunnel = {}
PayChecks.tunnel.payDay = PayChecks.payDay
vRP:registerExtension(PayChecks)
