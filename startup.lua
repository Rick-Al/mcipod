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

ensureFileExists("apple.nfp", "https://example.com/apple.nfp")
ensureFileExists("applew.nfp", "https://example.com/applew.nfp")

ensureFileExists("music", "https://pastebin.com/raw/Rc1PCzLH")
ensureFileExists("waveflow", "https://pinestore.cc/d/99")

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
shell.run("fg music")
shell.run("bg waveflow")
