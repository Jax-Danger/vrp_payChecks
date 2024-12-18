fx_version 'cerulean'
games { 'gta5' }
version '1.0'
lua54 'yes'

shared_scripts {
  '@ox_lib/init.lua',
}

server_script {
  "@vrp/lib/utils.lua",
  "vrp/vrp_s.lua"
}

client_scripts {
  "@vrp/lib/utils.lua",
  'paycheck.lua'
}

files {
  "config/cfg.lua"
}
