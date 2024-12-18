local cfg = {}

cfg.jobs = {
  { name = 'police', paycheck = 1525 } -- name is the job group name, paycheck is the amount received.
}
cfg.frequency = 15 -- paychecks received in minutes

cfg.useBank = true -- use bank or cash account for paychecks

cfg.debug = false -- this spams the console with paycheck time left in minutes. Don't enable unless paychecks aren't working.
return cfg
