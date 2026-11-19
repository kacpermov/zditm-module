# Unoffical ZDiTM Module
##                  for luau

This module uses ZDiTM's free developer api.

# Usage:

## Initiate
```lua
local zditm_module = require("./zditm")

local zditm_api = zditm_module.new()
```

## Change User Agent
by default the user agent for this module is "gitlab.com/kacpermov/zditm-module (kacper@kacper.mov)", you can change it by adding this:
```lua
zditm_api.UserAgent="Example"
```

## Stops
Documentation: https://www.zditm.szczecin.pl/en/zditm/for-developers/api-stops

```lua
local stop=zditm_api:getStops()
```

## Vehicles
Documentation: https://www.zditm.szczecin.pl/en/zditm/for-developers/api-vehicles

```lua
local vehicles=zditm_api:getVehicles()
```

## Lines
Documentation: https://www.zditm.szczecin.pl/en/zditm/for-developers/api-lines

```lua
local lines=zditm_api:getLines()
```

## Line Trajectories
Documentation: https://www.zditm.szczecin.pl/en/zditm/for-developers/api-line-trajectories

```lua
local lineId = 0

local trajectories=zditm_api:getLineTrajectories(lineId)
```

## Departure Board
Documentation: https://www.zditm.szczecin.pl/en/zditm/for-developers/api-departure-boards

```lua
local stopNumber = 0

local departureBoard=zditm_api:getDepartureBoard(stopNumber)
```

## Timetable Change Descriptions
Documentation: https://www.zditm.szczecin.pl/en/zditm/for-developers/api-timetable-change-descriptions

```lua
local timetable=zditm:getTimetableChangeDescriptions()
```

## Ticket Offices
Documentation: https://www.zditm.szczecin.pl/en/zditm/for-developers/api-ticket-offices

```lua
local ticketOffices=zditm:getTicketOffices()
```

## Stationary Ticket Machines
Documentation: https://www.zditm.szczecin.pl/en/zditm/for-developers/api-stationary-ticket-machines

```lua
local ticketOffices=zditm:getStationaryTicketMachines()
```