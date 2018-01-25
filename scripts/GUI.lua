local currentRoomAddress=0x02BF
local isMovingAddress=0x0F34
local movementCooldownAddress=0x2E7
local roomCountAddress=0x02BB
local stepsCountAddress=0x02EA

console.writeline(memory.getmemorydomainlist())

memory.usememorydomain("WRAM")

console.writeline("starting gui...")

while true do
	gui.text(0,0,"Current Room id: " .. memory.readbyte(0x02BF))
	gui.text(0,20,"Is moving?: " .. memory.readbyte(isMovingAddress))
	gui.text(0,40,"Movement cooldown: " .. memory.readbyte(movementCooldownAddress))
	gui.text(0,60,"Room count: " .. memory.readbyte(roomCountAddress))
	gui.text(0,80,"Steps Counter: " .. memory.readbyte(stepsCountAddress))
	gui.text(0,100,"" .. memory.read_u8(0x02EC))
	emu.frameadvance()
end