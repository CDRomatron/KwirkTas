local currentRoomID
local moveleft
local moveright
local movedown
local moveup
local wait
local movement
local currentmove

local inverted

inverted = {24,30,37,38,41,44,47,52,53,54,56,59,64,66,69,71,72,73,74,75,76,80}

local function has_value (tab, val)
    for index, value in ipairs(tab) do
		console.writeline("Is value " .. value .. " == val " .. val .. "?")
        if value == val then
            return true
        end
    end

    return false
end

wait = function()
	while memory.readbyte(0x02E7) > 1 do
		console.writeline("value of 02E7 " .. memory.readbyte(0x02E7))
		emu.frameadvance();
	end
	
	emu.frameadvance()
	emu.frameadvance()
end

moveleft = function()
	console.writeline("Moving left")
	while memory.readbyte(0x02E7) > 1 do
		joypad.set({Left=1})
		emu.frameadvance()
	end
	joypad.set({Left=1})
	emu.frameadvance()
end

moveright = function()
	console.writeline("Moving right")
	while memory.readbyte(0x02E7) > 1 do
		joypad.set({Right=1})
		emu.frameadvance()
	end
	joypad.set({Right=1})
	emu.frameadvance()
end

moveup = function()
	console.writeline("Moving up")
	while memory.readbyte(0x02E7) > 1 do
		joypad.set({Up=1})
		emu.frameadvance()
	end
	joypad.set({Up=1})
	emu.frameadvance()
end

movedown = function()
	console.writeline("Moving down")
	while memory.readbyte(0x02E7) > 1 do
		joypad.set({Down=1})
		emu.frameadvance()
	end
	joypad.set({Down=1})
	emu.frameadvance()
end

movement = function(moves)
	console.writeline(moves)
	console.writeline(#moves)
	
	local s = moves
	local words = {}
	for w in (s .. ";"):gmatch("([^;]*);") do 
		table.insert(words, w) 
	end
	
	local count = 0
	
	for n, c in ipairs(words) do
		count = count + 1
		console.writeline("c: " .. c .. " " .. count)
		if c == "l" then
			moveleft()
		elseif c == "r"  then
			moveright()
		elseif c == "u" then
			moveup()
		elseif c == "d" then
			movedown()
		end
	end
end

console.writeline("Stating kwirkbot...")

while memory.readbyte(0x02BB) < 100 do

	while memory.readbyte(0x02E7) > 1 do
		console.writeline("Initial move")
		joypad.set({Left=1})
		emu.frameadvance()
	end
	
	joypad.set({Left=1})
	emu.frameadvance()
	
	currentRoomID = memory.readbyte(0x02BF)
	console.writeline("Starting room " .. currentRoomID)
	
	if has_value(inverted, memory.readbyte(0x02BB)) then
		if currentRoomID == 60 then
			movement("l;l;l;l;d;d;l;l;u;u;d;d;r;r;u;u;u;u;l;d;r;d;l;l;l;l;r;r;r;u;u;l;d;r;d;l;l;l;l;l;l;l;l;l;l;l;l;")
		elseif currentRoomID == 62 then
			movement("l;d;l;l;l;l;u;l;u;r;r;d;d;l;l;l;d;l;r;u;r;r;r;u;u;l;l;d;r;r;u;u;l;l;l;l;d;d;r;d;r;r;r;u;u;u;u;l;l;l;l;d;l;l;l;l;l;l;d;l;l;l;")
		elseif currentRoomID == 65 then
			movement("l;l;l;l;l;l;u;u;l;l;d;r;l;d;r;u;l;l;u;r;r;d;d;d;l;l;u;l;l;l;l;l;l;l;l;")
		elseif currentRoomID == 68 then
			movement("l;l;l;l;l;u;l;l;d;l;u;l;l;r;d;d;l;u;l;l;l;l;l;l;l;")
		elseif currentRoomID == 70 then 
			movement("l;u;u;l;l;l;d;d;d;d;d;l;l;u;u;r;r;u;u;l;d;u;u;l;l;l;l;l;d;d;d;l;l;l;l;u;u;u;l;l;l;")
		elseif currentRoomID == 71 then
			movement("l;d;d;d;l;l;l;u;u;u;u;l;l;d;d;r;d;d;l;l;l;u;u;r;u;u;l;l;l;d;d;d;d;l;l;l;l;u;u;u;l;l;l;")
		elseif currentRoomID == 75 then
			movement("l;d;d;d;l;l;l;l;l;l;l;l;u;u;r;r;r;u;d;r;d;d;l;l;l;l;u;u;r;u;l;u;l;l;l;l;d;d;l;l;l;")
		elseif currentRoomID == 76 then
			movement("l;d;l;l;l;l;l;u;l;d;r;d;d;l;l;l;u;u;l;l;l;l;l;u;l;l;l;")
		elseif currentRoomID == 79 then
			movement("l;d;l;l;l;l;u;u;l;l;l;r;r;r;d;d;d;d;l;u;l;l;l;d;l;u;u;l;l;l;l;u;l;l;l;")
		elseif currentRoomID == 80 then
			movement("l;d;d;d;l;l;l;u;u;u;l;l;l;d;d;l;l;l;u;u;l;u;l;l;l;d;l;l;l;")
		elseif currentRoomID == 82 then
			movement("l;d;l;l;l;l;l;d;d;l;l;r;r;u;u;l;d;l;l;l;u;u;l;l;l;l;l;l;l;")
		elseif currentRoomID == 84 then
			movement("l;l;l;l;l;l;l;l;d;u;u;r;r;r;d;d;d;l;l;u;u;r;u;l;l;l;l;d;l;l;l;l;l;l;l;")
		elseif currentRoomID == 85 then
			movement("l;l;l;l;d;d;l;l;u;l;l;l;r;r;r;u;r;r;u;u;l;l;d;l;l;l;d;l;l;l;l;l;l;l;l;")
		elseif currentRoomID == 89 then
			movement("l;u;u;l;l;l;d;d;l;l;l;l;l;u;r;r;r;d;r;r;u;u;l;d;r;d;l;l;l;l;u;l;d;d;d;l;d;r;r;r;u;r;r;d;l;l;l;l;l;l;l;l;l;u;u;u;l;l;l;")
		elseif currentRoomID == 90 then
			movement("l;u;u;l;l;l;l;d;d;d;d;d;l;l;u;l;l;d;r;r;u;r;r;u;u;l;l;d;l;l;u;l;l;l;l;d;d;l;l;l;")
		elseif currentRoomID == 91 then
			movement("l;d;l;l;l;d;d;l;l;l;l;l;l;u;u;r;u;u;u;r;r;r;r;d;d;l;r;r;d;d;l;d;l;u;u;d;r;r;u;u;l;l;l;l;r;u;u;l;l;d;d;r;d;l;l;l;l;l;l;u;l;l;l;")
		elseif currentRoomID == 94 then
			movement("l;d;l;l;l;l;d;l;l;r;r;u;u;l;l;d;l;u;l;r;d;d;l;u;l;d;l;u;l;l;l;u;l;l;l;")
		elseif currentRoomID == 96 then
			movement("l;d;d;d;l;l;l;l;u;u;l;r;u;d;d;d;l;l;l;l;u;u;r;d;l;u;l;l;u;d;d;d;r;r;r;u;u;l;u;u;l;l;l;l;l;d;d;l;l;l;")
		elseif currentRoomID == 100 then
			movement("l;d;l;l;l;d;d;l;l;u;u;l;d;r;r;r;u;l;l;l;d;l;u;r;u;l;d;r;r;r;u;l;l;l;l;l;l;u;u;l;l;l;d;d;l;l;l;")
		elseif currentRoomID == 107 then
			movement("l;d;l;l;l;l;d;u;u;l;l;l;u;u;l;l;l;d;r;u;r;r;r;r;r;d;d;l;u;r;d;d;l;l;d;l;u;u;d;d;l;u;r;d;d;l;l;d;l;l;l;l;u;u;l;l;l;")
		end
	else
		if currentRoomID == 60 then
			movement("l;d;l;l;l;d;d;l;l;u;u;d;d;r;r;u;u;u;u;l;d;r;d;l;l;l;l;r;r;r;u;u;l;d;r;d;l;l;l;l;l;l;l;l;l;u;l;l;l;")
		elseif currentRoomID == 61 then
			movement("l;d;l;l;l;l;l;d;l;l;d;r;r;u;r;u;r;u;d;d;l;l;d;l;l;u;r;r;r;u;u;u;u;l;l;l;d;l;l;d;l;l;l;u;l;l;l;")
		elseif currentRoomID == 62 then
			movement("l;l;l;l;l;d;l;d;r;r;u;u;l;l;l;u;l;r;d;r;r;r;d;d;l;l;u;r;r;d;d;l;l;l;l;u;u;r;u;r;r;r;d;d;d;d;l;l;l;l;u;l;l;l;l;l;l;u;u;l;l;l;")
		elseif currentRoomID == 63 then
			movement("l;u;u;l;l;l;l;d;d;d;d;d;l;u;u;u;u;l;l;u;l;l;d;d;d;u;u;u;r;r;d;l;d;d;r;r;d;d;l;l;l;l;l;l;l;u;u;u;l;l;l;")
		elseif currentRoomID == 64 then
			movement("l;u;u;l;l;l;l;d;l;l;l;r;r;r;d;d;d;l;u;l;l;d;l;l;l;l;l;l;u;u;u;l;l;l;")
		elseif currentRoomID == 65 then
			movement("l;d;l;l;l;l;l;d;d;l;l;u;r;l;u;r;d;l;l;d;r;r;u;u;u;l;l;d;l;l;l;l;l;u;l;l;l;")
		elseif currentRoomID == 66 then
			movement("l;d;l;l;l;l;l;l;l;l;u;r;l;l;u;r;d;l;l;l;l;l;l;l;l;")
		elseif currentRoomID == 67 then
			movement("l;u;u;l;l;l;d;d;l;l;d;d;d;l;l;l;l;u;u;r;r;u;u;l;l;l;l;l;d;d;l;l;l;")
		elseif currentRoomID == 68 then
			movement("l;d;l;l;l;l;d;l;l;u;l;d;l;l;r;u;u;l;d;l;l;l;l;u;l;l;l;")
		elseif currentRoomID == 69 then
			movement("l;d;d;l;l;l;u;l;l;d;u;l;u;l;d;r;r;r;d;d;l;l;l;l;u;l;l;l;l;l;u;u;l;l;l;")
		elseif currentRoomID == 70 then 
			movement("l;d;d;d;l;l;l;u;u;u;u;u;l;l;d;d;r;r;d;d;l;u;d;d;l;l;l;l;l;u;u;u;l;l;l;l;d;d;l;l;l;")
		elseif currentRoomID == 71 then
			movement("l;u;u;l;l;l;d;d;d;d;l;l;u;u;r;u;u;l;l;l;d;d;r;d;d;l;l;l;u;u;u;u;l;l;l;l;d;d;l;l;l;")
		elseif currentRoomID == 72 then
			movement("l;l;l;l;l;l;u;l;l;r;r;d;d;d;d;l;l;u;r;u;u;l;d;r;u;u;l;l;l;l;l;l;l;l;l;l;")
		elseif currentRoomID == 74 then
			movement("l;l;l;l;u;u;l;l;l;l;d;d;r;u;l;d;d;l;l;d;r;r;r;d;r;r;u;u;u;l;l;l;l;l;l;l;l;l;l;l;l;l;")
		elseif currentRoomID == 75 then
			movement("l;u;u;l;l;l;l;l;l;l;l;d;d;r;r;r;d;u;r;u;u;l;l;l;l;d;d;r;d;l;d;l;l;l;l;u;u;u;l;l;l;")
		elseif currentRoomID == 76 then
			movement("l;l;l;l;l;l;d;l;u;r;u;u;l;l;l;d;d;l;l;l;l;l;l;l;l;")
		elseif currentRoomID == 77 then
			movement("l;l;l;l;u;u;l;l;l;d;d;d;r;r;u;u;u;u;l;l;l;l;l;d;l;d;l;l;l;l;l;l;")
		elseif currentRoomID == 78 then
			movement("l;l;l;l;d;d;d;l;l;l;r;r;u;u;l;l;u;l;l;l;d;l;l;l;l;u;l;l;l;")
		elseif currentRoomID == 79 then
			movement("l;l;l;l;l;d;d;l;l;l;r;r;r;u;u;u;u;l;d;l;l;l;u;l;d;d;l;l;l;l;l;l;l;")
		elseif currentRoomID == 80 then
			movement("l;u;u;l;l;l;d;d;d;l;l;l;u;u;l;l;l;d;d;l;d;l;l;l;u;u;l;l;l;")
		elseif currentRoomID == 81 then
			movement("l;d;d;d;l;l;l;u;u;u;u;u;l;l;l;d;l;u;r;r;d;d;r;r;d;d;d;l;l;u;u;u;u;l;l;d;r;u;l;l;d;d;l;u;u;l;l;l;d;d;l;l;l;")
		elseif currentRoomID == 82 then
			movement("l;l;l;l;l;l;u;u;l;l;r;r;d;d;l;u;l;l;l;d;d;l;l;l;l;u;l;l;l;")
		elseif currentRoomID == 83 then
			movement("l;d;l;l;l;d;l;l;l;r;u;u;l;d;l;u;d;d;l;u;l;l;l;l;l;u;l;l;l;")
		elseif currentRoomID == 84 then
			movement("l;d;l;l;l;l;l;l;l;d;u;u;r;r;r;d;d;d;l;l;u;u;r;u;l;l;l;l;d;l;l;l;l;u;l;l;l;")
		elseif currentRoomID == 85 then
			movement("l;d;l;l;l;u;u;l;l;d;l;l;l;r;r;r;d;r;r;d;d;l;l;u;l;l;l;u;l;l;l;l;l;u;l;l;l;")
		elseif currentRoomID == 86 then
			movement("l;u;u;l;l;l;l;d;d;l;u;r;d;d;l;l;l;u;r;r;r;d;d;l;u;r;d;d;l;l;l;l;l;u;r;r;r;r;r;d;d;l;u;r;d;d;l;l;l;u;r;r;r;d;d;l;u;r;d;d;d;d;l;u;r;d;d;l;l;l;u;r;r;r;d;d;l;u;r;d;d;l;l;l;l;l;u;r;r;r;r;r;d;d;l;u;r;d;d;l;l;l;u;r;r;r;d;d;l;u;r;d;d;l;l;l;l;l;l;l;l;l;u;u;l;l;l;")
		elseif currentRoomID == 88 then
			movement("l;u;u;l;l;l;l;l;l;l;r;r;d;d;d;l;l;d;d;l;l;l;u;u;r;r;l;l;d;d;r;r;r;u;u;u;u;d;d;d;d;r;r;u;r;u;l;l;r;u;u;u;l;l;l;r;r;r;d;d;d;d;d;l;l;u;u;u;u;d;d;r;r;u;u;u;l;l;l;l;l;l;l;l;d;d;l;l;l;")
		elseif currentRoomID == 89 then
			movement("l;d;d;d;l;l;l;u;u;l;l;l;l;l;d;r;r;r;u;r;r;d;d;l;u;r;u;l;l;l;l;d;l;u;u;u;l;u;r;r;r;d;r;r;u;l;l;l;l;l;l;l;l;l;d;d;l;l;l;")
		elseif currentRoomID == 90 then
			movement("l;d;d;d;l;l;l;l;u;u;u;u;u;l;l;d;l;l;u;r;r;d;r;r;d;d;l;l;u;l;l;d;l;l;l;l;u;u;u;l;l;l;")
		elseif currentRoomID == 91 then
			movement("l;l;l;l;u;u;l;l;l;l;l;l;d;d;r;d;d;d;r;r;r;r;u;u;l;r;r;u;u;l;u;l;d;d;u;r;r;d;d;l;l;l;l;r;d;d;l;l;u;u;r;u;l;l;l;l;l;l;l;l;l;")
		elseif currentRoomID == 92 then
			movement("l;d;l;l;l;d;d;l;l;u;u;l;l;u;u;r;r;r;d;r;d;l;l;l;l;l;r;u;u;r;r;d;r;d;l;l;l;l;l;l;l;l;l;u;l;l;l;")
		elseif currentRoomID == 93 then
			movement("l;l;l;l;l;l;u;u;l;l;d;r;d;d;l;l;d;r;u;l;l;u;l;l;l;l;l;l;")
		elseif currentRoomID == 94 then
			movement("l;l;l;l;l;d;l;l;r;r;u;u;l;l;d;l;u;l;r;d;d;l;u;l;d;l;u;l;l;l;l;l;l;")
		elseif currentRoomID == 95 then
			movement("l;d;l;l;l;d;d;l;l;u;r;u;d;d;l;l;u;u;l;l;u;u;l;u;l;d;d;d;l;l;l;u;l;l;l;")
		elseif currentRoomID == 96 then
			movement("l;u;u;l;l;l;l;d;d;l;r;d;u;u;u;l;l;l;l;d;d;r;u;l;d;l;l;d;u;u;u;r;r;r;d;d;l;d;d;l;l;l;l;l;u;u;u;l;l;l;")
		elseif currentRoomID == 97 then
			movement("l;u;u;l;l;l;d;d;d;l;l;d;l;l;u;u;u;r;r;u;u;l;d;r;u;u;l;l;l;l;l;l;d;d;l;l;l;")
		elseif currentRoomID == 98 then
			movement("l;l;l;l;l;u;u;l;l;d;r;d;r;d;d;l;u;u;u;d;d;d;l;l;l;u;r;u;u;l;d;l;l;l;l;l;l;l;l;")
		elseif currentRoomID == 99 then
			movement("l;d;d;d;l;l;l;l;l;u;u;u;l;l;l;d;d;l;u;r;u;u;l;l;d;r;r;r;r;u;r;d;d;l;d;r;r;d;r;u;u;u;l;l;l;l;l;u;u;l;d;d;d;r;d;l;l;d;l;l;l;u;u;u;l;l;l;")
		elseif currentRoomID == 100 then
			movement("l;l;l;l;u;u;l;l;d;d;l;u;r;r;r;d;l;l;l;u;l;d;r;d;l;u;r;r;r;d;l;l;l;l;l;l;d;d;l;l;l;u;u;u;l;l;l;")
		elseif currentRoomID == 102 then
			movement("l;u;u;l;l;l;d;d;d;l;l;u;u;r;r;d;d;d;l;l;u;r;l;l;l;d;d;r;r;r;r;u;u;u;l;l;l;l;d;l;l;d;d;l;u;u;r;r;l;l;u;u;r;d;r;d;l;d;l;u;u;u;u;l;l;l;d;d;l;l;l;")
		elseif currentRoomID == 103 then
			movement("l;d;d;d;l;l;l;l;l;l;l;u;u;u;r;r;r;u;u;l;l;l;d;d;l;l;d;d;d;r;r;u;u;d;d;l;l;u;u;u;r;r;l;l;u;d;d;d;d;r;r;u;u;u;u;r;r;r;d;d;l;l;l;l;l;l;l;l;l;l;l;l;")
		elseif currentRoomID == 104 then
			movement("l;d;d;d;l;l;l;u;l;l;l;l;l;d;l;l;u;r;r;r;r;r;d;r;r;u;l;d;l;u;u;u;l;l;l;r;r;r;u;u;l;d;r;d;l;l;l;l;l;u;u;l;l;l;d;d;l;l;l;")
		elseif currentRoomID == 106 then
			movement("l;u;u;l;l;l;l;d;d;l;d;l;u;r;d;d;l;l;d;l;l;r;r;u;r;r;u;u;u;l;l;l;d;d;d;l;u;r;d;d;l;l;l;l;l;u;l;l;l;")
		elseif currentRoomID == 107 then
			movement("l;l;l;l;l;u;d;d;l;l;l;d;d;l;l;l;u;r;d;r;r;r;r;r;u;u;l;d;r;u;u;l;l;u;l;d;d;u;u;l;d;r;u;u;l;l;u;l;l;l;l;d;l;l;l;")
		elseif currentRoomID == 108 then
			movement("l;l;l;l;l;u;l;l;l;r;r;r;d;d;d;l;l;u;l;d;u;u;l;d;l;l;l;l;l;u;l;l;l;")
		elseif currentRoomID == 109 then
			movement("l;d;l;l;l;l;l;l;l;r;r;r;r;u;u;l;d;r;u;u;l;l;l;d;r;r;r;u;u;l;d;r;u;u;l;l;l;l;l;r;r;r;r;r;d;d;l;u;r;d;d;l;l;l;u;r;r;r;d;d;l;u;r;d;d;l;l;l;l;l;u;l;r;d;r;r;r;r;r;d;d;l;u;r;d;d;l;l;l;u;r;r;r;d;d;l;u;r;d;d;l;l;l;l;l;u;l;u;l;l;l;l;u;l;l;l;")
		end
	end
	
	
	
end