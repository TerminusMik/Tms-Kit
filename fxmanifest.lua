fx_version "adamant"

game "gta5"


description 'Shop pour acheter des kit de réparation en RageUI V2'



client_scripts {
    'src/RMenu.lua',
    'src/menu/RageUI.lua',
    'src/menu/Menu.lua',
    'src/menu/MenuController.lua',
    'src/components/*.lua',
    'src/menu/elements/*.lua',
    'src/menu/items/*.lua',
    'src/menu/panels/*.lua',
    'src/menu/windows/*.lua',

    "client.lua",

}


server_scripts{
    "@mysql-async/lib/MySQL.lua",
    "server.lua",
}