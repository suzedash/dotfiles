local waywall = require("waywall")
local helpers = require("waywall.helpers")

local config = {
    input = {
        layout = "us",
	    variant = "colemak",
        repeat_rate = -1,
        repeat_delay = -1,

        remaps = {
            ["MB4"] = "F3",
        },

        sensitivity = 1.0,
        confine_pointer = false,
    },
    theme = {
        background_png = "/home/main/Desktop/minecraft/backgrounddarken.png",
    },
}

local make_image = function(path, dst)
local this = nil

return function(enable)
if enable and not this then
    this = waywall.image(path, {dst = dst})
    elseif this and not enable then
        this:close()
        this = nil
        end
        end
        end

        local make_mirror = function(options)
        local this = nil

        return function(enable)
        if enable and not this then
            this = waywall.mirror(options)
            elseif this and not enable then
                this:close()
                this = nil
                end
                end
                end

                local make_res = function(width, height, enable, disable)
                return function()
                local active_width, active_height = waywall.active_res()

                if active_width == width and active_height == height then
                    waywall.set_resolution(0, 0)
                    disable()
                    else
                        waywall.set_resolution(width, height)
                        enable()
                        end
                        end
                        end

                        -- Mirrors and resolution toggles
                        local mirrors = {
                            eye_measure = make_mirror({
                                src = {x = 162,     y = 7902,   w = 60,     h = 580},
                                dst = {x = 620,     y = 470,    w = 900,    h = 500},
                            }),
                            tall_pie = make_mirror({
                                src = {x = 35,       y = 15960,  w = 350,    h = 260},
                                dst = {x = 1925,     y = 765,    w = 320,    h = 260},
                            }),

                            f3_ccache = make_mirror({
                                src = {x = 101,     y = 55,     w = 27,      h = 9},
                                dst = {x = 1120,    y = 504,    w = 108,     h = 36},
                                color_key  = {
                                    input  = "#dddddd",
                                    output = "#ffffff",
                                },
                            }),
                            f3_ecount = make_mirror({
                                src = {x = 0,       y = 36,     w = 49,     h = 9},
                                dst = {x = 1120,    y = 540,    w = 196,    h = 36},
                                color_key  = {
                                    input  = "#dddddd",
                                    output = "#ffffff",
                                },
                            }),

                            tall_pie_entities = make_mirror({
                                src = {x = 227,     y = 15299,  w = 84,     h = 42},
                                dst = {x = 1120,    y = 650,    w = 504,    h = 252},
                                color_key  = {
                                    input  = "#e145c2",
                                    output = "#e145c2",
                                },
                            }),
                            tall_pie_blockentities = make_mirror({
                                src = {x = 227,     y = 15299,  w = 84,     h = 42},
                                dst = {x = 1120,    y = 650,    w = 504,    h = 252},
                                color_key  = {
                                    input  = "#e96d4d",
                                    output = "#e96d4d",
                                },
                            }),
                            tall_pie_unspec = make_mirror({
                                src = {x = 227,     y = 15299,  w = 84,    h = 42},
                                dst = {x = 1120,    y = 650,    w = 504,    h = 252},
                                color_key  = {
                                    input  = "#45cb65",
                                    output = "#45cb65",
                                },
                            }),

                            lowest_pie_entities = make_mirror({
                                src = {x = 2,     y = 860,  w = 84,     h = 42},
                                dst = {x = 1120,    y = 650,    w = 504,    h = 252},
                                color_key  = {
                                    input  = "#e145c2",
                                    output = "#e145c2",
                                },
                            }),
                            lowest_pie_blockentities = make_mirror({
                                src = {x = 2,     y = 860,  w = 84,     h = 42},
                                dst = {x = 1120,    y = 650,    w = 504,    h = 252},
                                color_key  = {
                                    input  = "#e96d4d",
                                    output = "#e96d4d",
                                },
                            }),
                            lowest_pie_unspec = make_mirror({
                                src = {x = 2,     y = 860,  w = 84,    h = 42},
                                dst = {x = 1120,    y = 650,    w = 504,    h = 252},
                                color_key  = {
                                    input  = "#45cb65",
                                    output = "#45cb65",
                                },
                            }),

                            thin_pie_entities = make_mirror({
                                src = {x = 147,     y = 859,    w = 84,     h = 42},
                                dst = {x = 1120,    y = 650,    w = 504,    h = 252},
                                color_key = {
                                    input  = "#e145c2",
                                    output = "#e145c2",
                                },
                            }),
                            thin_pie_blockentities = make_mirror({
                                src = {x = 147,     y = 859,    w = 84,     h = 42},
                                dst = {x = 1120,    y = 650,    w = 504,    h = 252},
                                color_key = {
                                    input  = "#e96d4d",
                                    output = "#e96d4d",
                                },
                            }),
                            thin_pie_unspec = make_mirror({
                                src = {x = 147,     y = 859,    w = 84,     h = 42},
                                dst = {x = 1120,    y = 650,    w = 504,    h = 252},
                                color_key = {
                                    input  = "#45cb65",
                                    output = "#45cb65",
                                },
                            }),
                        }

                        local images = {
                            overlay = make_image(
                                "/home/main/Desktop/minecraft/measuringoverlay.png",
                                {x = 620,     y = 470,    w = 900,    h = 500}
                            )
                        }

                        local show_mirrors = function(eye, f3, tall, thin, lowest)
                        images.overlay(eye)
                        mirrors.eye_measure(eye)
                        mirrors.tall_pie(eye)

                        mirrors.f3_ccache(f3)
                        mirrors.f3_ecount(f3)

                        mirrors.tall_pie_entities(tall)
                        mirrors.tall_pie_blockentities(tall)
                        mirrors.tall_pie_unspec(tall)

                        mirrors.thin_pie_entities(thin)
                        mirrors.thin_pie_blockentities(thin)
                        mirrors.thin_pie_unspec(thin)

                        mirrors.lowest_pie_entities(lowest)
                        mirrors.lowest_pie_blockentities(lowest)
                        mirrors.lowest_pie_unspec(lowest)
                        end

                        local thin_enable = function()
                        waywall.set_sensitivity(0)
                        show_mirrors(false, true, false, true, false)
                        end

                        local thin_disable = function()
                        show_mirrors(false, false, false, false, false)
                        end

                        local tall_enable = function()
                        waywall.set_sensitivity(0.33)
                        show_mirrors(true, true, true, false, false)
                        end

                        local tall_disable = function()
                        waywall.set_sensitivity(0)
                        show_mirrors(false, false, false, false, false)
                        end

                        local wide_enable = function()
                        waywall.set_sensitivity(0)
                        show_mirrors(false, false, false, false, false)
                        end

                        local wide_disable = function()
                        -- nothing
                        end

                        local lowest_enable = function()
                        waywall.set_sensitivity(0)
                        show_mirrors(false, false, false, false, true)
                        end

                        local lowest_disable = function()
                        -- nothing
                        end

                        local thinnest_disable = function()
                        -- nothing
                        end

                        local semithin_enable = function()
                        waywall.set_sensitivity(0)
                        show_mirrors(false, false, false, false, false)
                        end

                        local semithin_disable = function()
                        -- nothing
                        end

                        local resolutions = {
                            thin            = make_res(350, 1440, thin_enable, thin_disable),
                            tall            = make_res(384, 16384, tall_enable, tall_disable),
                            wide            = make_res(3440, 400, wide_enable, wide_disable),
                            semithin        = make_res(350, 1080, semithin_enable, semithin_disable),
                            lowest        = make_res(96, 1080, lowest_enable, lowest_disable),
                        }

                        local exec_ninb = function()
                        waywall.exec("java -jar /home/main/Desktop/minecraft/Ninjabrain-Bot-1.5.1.jar")
                        end

                        config.actions = {
                            ["*-Backspace"]              = resolutions.thin,
                            ["*-Tab"]              = resolutions.tall,
                            ["*-Ctrl-Backspace"]          = resolutions.wide,
                            ["*-Ctrl-U"]          = resolutions.semithin,
                            ["*-Ctrl-M"]          = resolutions.lowest,

                            ["*-Ctrl-J"]         = waywall.toggle_fullscreen,
                            ["*-Ctrl-H"]         = helpers.toggle_floating,
                            ["*-Ctrl-K"]         = exec_ninb,
                        }

                        return config

