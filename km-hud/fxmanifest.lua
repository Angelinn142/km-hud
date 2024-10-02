fx_version 'cerulean'
game 'gta5'

author 'Kamuidll'
description 'HUD para mostrar el dinero y el trabajo, exclusivo para QBCore'

client_scripts {
    'client.lua',
}

server_scripts {
    '@qb-core/shared/locale.lua',
    'server.lua',
}

ui_page 'html/ui.html'

files {
    'html/ui.html',
    'html/style.css',
    'html/script.js',
}

dependencies {
    "qb-core"
}