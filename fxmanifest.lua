fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Apex Studios - fivem.apx-studios.com'
name 'apx_core'
version '0.0.1'
description 'Core Resource'

shared_scripts { '@ox_lib/init.lua', 'locale/*.lua', 'config/*.lua' }

client_scripts { 'client/main.lua', 'client/functions.lua' }

server_scripts { '@oxmysql/lib/MySQL.lua', 'server/main.lua', 'server/functions.lua' }

ui_page 'html/index.html'

files { 'html/index.html', 'html/assets/**/*.css', 'html/assets/**/*.js' }

escrow_ignore { 'html/index.html', 'html/assets/**/*.css', 'html/assets/**/*.js', 'config/*.lua' }

dependency 'ox_lib'