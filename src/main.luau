--!nonstrict
-- Lune runtime only, sadly

local net = require("@lune/net")
local serde = require("@lune/serde")

local apiBase="https://zditm.szczecin.pl/api/v2/"

function sendRequest_decode(config:net.FetchParams)
    local s, request = pcall(function()return net.request(config)end)

    if not s then return {data={}} end

    local s, json = pcall(function()return serde.decode("json",request.body) end)

    if not s then return {data={}} end

    return json
end

local zditm = {}
zditm.__index = zditm

function zditm.new()
    local m = setmetatable({},zditm.__index)

    m.UserAgent = "gitlab.com/kacpermov/zditm-module (kacper@kacper.mov)"

    return m
end


function zditm:getStops()
    local net_config: net.FetchParams = {
        url=apiBase.."stops",
        method="GET",
        headers={
            ["User-Agent"]=self.UserAgent
        }
    }

    local json = sendRequest_decode(net_config)

    return json.data
end

function zditm:getVehicles()
    local net_config: net.FetchParams = {
        url=apiBase.."vehicles?format=json",
        method="GET",
        headers={
            ["User-Agent"]=self.UserAgent
        }
    }

    local json = sendRequest_decode(net_config)

    return json.data
end

function zditm:getLines()
    local net_config: net.FetchParams = {
        url=apiBase.."lines",
        method="GET",
        headers={
            ["User-Agent"]=self.UserAgent
        }
    }

    local json = sendRequest_decode(net_config)

    return json.data
end

function zditm:getLineTrajectories(lineId)
    local net_config: net.FetchParams = {
        url=apiBase.."trajectories/"..lineId.."?format=json",
        method="GET",
        headers={
            ["User-Agent"]=self.UserAgent
        }
    }

    local json = sendRequest_decode(net_config)

    return json.data
end

function zditm:getDepatureBoard(stopNumber)
    local net_config: net.FetchParams = {
        url=apiBase.."departure-boards/"..stopNumber.."?format=json",
        method="GET",
        headers={
            ["User-Agent"]=self.UserAgent
        }
    }

    local json = sendRequest_decode(net_config)

    return json.data
end

function zditm:getTimetableChangeDescriptions()
    local net_config: net.FetchParams = {
        url=apiBase.."timetable-change-descriptions",
        method="GET",
        headers={
            ["User-Agent"]=self.UserAgent
        }
    }

    local json = sendRequest_decode(net_config)

    return json.data
end

function zditm:getTicketOffices()
    local net_config: net.FetchParams = {
        url=apiBase.."ticket-offices",
        method="GET",
        headers={
            ["User-Agent"]=self.UserAgent
        }
    }

    local json = sendRequest_decode(net_config)

    return json.data
end

function zditm:getStationaryTicketMachines()
    local net_config: net.FetchParams = {
        url=apiBase.."ticket-machines",
        method="GET",
        headers={
            ["User-Agent"]=self.UserAgent
        }
    }

    local json = sendRequest_decode(net_config)

    return json.data
end


return zditm