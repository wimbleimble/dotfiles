local status_ok, db = pcall(require, "dashboard")
local home = os.getenv("HOME")

if not status_ok then
    return
end

db.custom_header = {
    ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
    ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
    ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
    ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
    ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
    ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
}

db.header_pad = 15

db.custom_center = {
    {
        desc = "Find File         ",
        action = "Telescope find_files",
        shortcut = "leader f f"
    },
    {
        desc = "Grep              ",
        action = "Telescope live_grep",
        shortcut = "leader f s"
    },
    {
        desc = "View Todos        ",
        action = "TodoTelescope",
        shortcut = "leader f t"
    },
    {
        desc = "Find Notes        ",
        action = "ZkNotes",
        shortcut = "leader z f"
    }
}

