VERSION = "1.0.0"

local micro = import("micro")
local config = import("micro/config")

function preinit()
	config.RegisterGlobalOption("clock", "custom", "")
end

function init()
	micro.SetStatusInfoFn("clock.custom")
	micro.SetStatusInfoFn("clock.time")
	micro.SetStatusInfoFn("clock.time24")
	micro.SetStatusInfoFn("clock.date")
	micro.SetStatusInfoFn("clock.dateUS")
	micro.SetStatusInfoFn("clock.dateReverse")
	micro.SetStatusInfoFn("clock.day")
	micro.SetStatusInfoFn("clock.month")
	micro.SetStatusInfoFn("clock.year")
	config.AddRuntimeFile("clock", config.RTHelp, "help/clock.md")
end

function custom()
	return os.date(config.GetGlobalOption("clock.custom"))
end

function time()
	return os.date("%I:%M %p")
end

function time24()
	return os.date("%H:%M")
end

function date()
	return os.date("%d/%m/%Y")
end

function dateUS()
	return os.date("%m/%d/%Y")
end

function dateReverse()
	return os.date("%Y/%m/%d")
end

function day()
	return string.sub(os.date("%A"),1,3)
end

function month()
	return os.date("%b")
end

function year()
	return os.date("%Y")
end