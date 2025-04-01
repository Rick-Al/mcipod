math.randomseed(os.time() + os.clock() * 1000000 + math.random(1, 1000000))

for _ = 1, 5 do math.random() end

local messages = {
    "Think Different.",
    "One thousand songs in your pocket.",
    "Leave no tune behind.",
    "Touch comes to iPod.",
    "Welcome to the digital music revolution.",
    "Play more than music. Play a part.",
    "Rip. Mix. Burn.",
    "Which iPod are you?"
}

local function ensureFileExists(filename, url)
    if not fs.exists(filename) then
        print("Downloading missing file: " .. filename)
        shell.run("wget " .. url .. " " .. filename)
    end
end

ensureFileExists("apple.nfp", "https://pastebin.com/raw/xdVUHeuF")
ensureFileExists("applew.nfp", "https://pastebin.com/raw/2VqqGDE9")

ensureFileExists("itunes", "https://pastebin.com/raw/Rc1PCzLH")
ensureFileExists("waveflow", "https://gist.githubusercontent.com/michielp1807/9536445bd5773915a58594869049d2ed/raw/a056cc57db5008a9cca2736f931ae8c1359f0a88/waveflow.lua")

local apple = paintutils.loadImage("apple.nfp")
local applew = paintutils.loadImage("applew.nfp")

local images = {
    apple,
    applew
}

term.clear()
term.setCursorPos(1,1)

textutils.slowPrint(messages[math.random(1, #messages)])

paintutils.drawImage(images[math.random(1, #images)], 1, 1)

os.sleep(2)
term.clear()
term.setCursorPos(1,1)

-- Run programs after ensuring they exist
shell.run("fg itunes")
shell.run("bg waveflow")
