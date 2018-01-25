local currentRoomID
local moveleft
local moveright
local movedown
local moveup
local wait

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
	while memory.readbyte(0x02E7) == 8 do
		joypad.set({Left=1})
		emu.frameadvance()
	end
	
	wait()
end

moveright = function()
	console.writeline("Moving right")
	while memory.readbyte(0x02E7) == 8 do
		joypad.set({Right=1})
		emu.frameadvance()
	end
	wait()
end

moveup = function()
	console.writeline("Moving up")
	while memory.readbyte(0x02E7) == 8 do
		joypad.set({Up=1})
		emu.frameadvance()
	end
	wait()
end

movedown = function()
	console.writeline("Moving down")
	while memory.readbyte(0x02E7) == 8 do
		joypad.set({Down=1})
		emu.frameadvance()
	end
	wait()
end

console.writeline("Stating kwirkbot...")

while memory.readbyte(0x02BB) < 100 do

	while memory.readbyte(0x02E7) == 8 do
		console.writeline("Initial move")
		joypad.set({Left=1})
		emu.frameadvance()
	end
	
	wait()
	
	currentRoomID = memory.readbyte(0x02BF)
	console.writeline("Starting room " .. currentRoomID)
	
	if currentRoomID == 60 then
	
	elseif  currentRoomID == 70 then
		moveleft()
		movedown()
		movedown()
		movedown()
		moveleft()
		moveleft()
		moveleft()
		moveup()
		moveup()
		moveup()
		moveup()
		moveup()
		moveleft()
		moveleft()
		movedown()
		movedown()
		moveright()
		moveright()
		movedown()
		movedown()
		moveleft()
		moveup()
		movedown()
		movedown()
		moveleft()
		moveleft()
		moveleft()
		moveleft()
		moveleft()
		moveup()
		moveup()
		moveup()
		moveleft()
		moveleft()
		moveleft()
		moveleft()
		movedown()
		movedown()
		moveleft()
		moveleft()
		moveleft()
	end
	
end