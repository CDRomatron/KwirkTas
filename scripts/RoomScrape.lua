console.writeline("starting...")

for i=0, 256, 1 do
	savestate.load("C:\\Users\\Mike\\Downloads\\BizHawk-2.2\\Gameboy\\State\\Kwirk (USA, Europe).QuickSave1.State")
	mainmemory.writebyte(0x02BF, i)
	for j=0, 350, 1 do
		emu.frameadvance()
	end
	client.screenshot("C:\\Users\\Mike\\Downloads\\BizHawk-2.2\\kwirk rooms\\".. i .. ".png")
	console.writeline("taking screengrab of " .. i)
end

console.writeline("stopping")