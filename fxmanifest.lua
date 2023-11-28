fx_version 'adamant'
games { 'gta5' }

author 'Ding'
description 'QBCore/Standalone Laptop Resource'
version '1.0.0'

ui_page "html/ui.html"

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
    "config.lua",
    "client.lua",
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    "server.lua",
}

files {
    "html/ui.html",
    "html/app.js",
    "html/style.css",
}