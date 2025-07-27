--[[
    Script made by zitus
    discord.gg/zitus
    Cracked and deobfuscated by Natix#1316
    discord.gg/xQA6AnMxfk
]] 

-- CRACK SETTINGS
ownerCrack          = "Natix" -- Your username 

-- GENERAL SETTING
YourDiscordid       = "527737154877652993"
platId              = 102 -- plat id
letter              = 5 -- custom how many letter world
auto_find_world     = true

-- LIST WORLD IF DONT WANT AUTO FIND WORLD
list_world_DF       = {" "}

-- OPTIONAL
breakRock           = false -- true/false
nonumber            = true -- set to false if WITH NUMBER, set to true if NO NUMBER
auto_buy_bp         = true
disable_webhook     = false -- WARNING !!! if disabled then you cant see list world
save_seed           = true
takeJammer          = false -- true = bot will take jammer after DF Done, false = bot not take jammer
takeWL              = false -- true = bot will take wl after DF Done, false = bot not take WL
bangrowid           = true -- true = bot will ban all people in world DF except whitelist growid
remove_bot          = true -- remove bot after DF DONE
whitelist           = {" ", " ", " "} -- if you dont want your account banned by bot when entering world input your id here

-- WORLD SETTING
worldPlat           = " " -- world take plat MUST CAPITAL (HURUF BESAR)
idWorldPlat         = " " -- id door world take plat MUST CAPITAL (HURUF BESAR)
world_seed          = " " -- world take plat MUST CAPITAL (HURUF BESAR)
id_world_seed       = " " -- id door world take plat MUST CAPITAL (HURUF BESAR)
move_direction      = 1 -- 1 = drop right, -1 = drop left

-- ROTATION DF MODE
SL_mode             = true -- SET false, if dont want Rotation DF MODE 
door_itemid         = 886 -- can use other than normal door, such as Screen door, path marker, etc 
entrance_itemid     = 2810 -- your entrance id
sl_id               = 202 -- SMALL LOCK ID
edit_doorid         = " " -- CAPS LOCK DOOR ID TO SET AUTO PUT ID INSIDE DOOR

webhookdc           = " "

-- ========================================================================================

world = " "
isowner = false
isLocked = false
list_DF = {}
count_df = 0
string_list_df = ""
worldPlat = string.upper(worldPlat)
wlId = 242
jammerId = 226
dcbotnamedc = "AUTO X LETTER AND DF V3.5"
thumbnaildc = "https://media.discordapp.net/attachments/1012992127740952576/1025653196816920607/image-removebg-preview_3.png"
colorEmbed = "4672231"
owner = ownerCrack
function editDoor(label, world, doorid)
  wrench(0, 1)
  sleep(5000)
  sendPacket(2, [[
action|dialog_return
dialog_name|door_edit
tilex|]] .. math.floor(getBot().x / 32) .. [[
|
tiley|]] .. math.floor(getBot().y / 32) + 1 .. [[
|
door_name|]] .. label .. [[

door_target|]] .. world .. [[

door_id|]] .. doorid .. [[

checkbox_locked|0]])
end
function logToTxt(farm_world)
  local file = io.open("DF_" .. getBot().name .. ".txt", "a")
  file:write([[

"]] .. farm_world .. "\",")
  file:close()
end
function pshell(webhook, dcbotname, thumbnail, colorEmbed, message)
  local script = "    $webHookUrl = '" .. webhook .. [[
'
    
    $host.ui.RawUI.WindowTitle = ""
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    
    
    [System.Collections.ArrayList]$embedArray = @()
    
    $title       = ']] .. dcbotname .. [[
'
    
    $description = ']] .. message .. [[
'
    
    $color       = ']] .. colorEmbed .. [[
'
    
    $user        = ']] .. dcbotname .. [[
'
    
    $discordid   = ']] .. YourDiscordid .. [[
'

    $lockOwner   = ']] .. owner .. [[
'

    $nameBot     = ']] .. getBot().name .. [[
'

    $levelbot    = ']] .. getBot().level .. [[
'

    $worldBot    = ']] .. getBot().world .. [[
'

    $online      = ']] .. getBot().status .. [[
'

    $online      = ']] .. getBot().status .. [[
'

    $stockWL     = ']] .. findItem(wlId) .. [[
'

    $stockSL     = ']] .. findItem(sl_id) .. [[
'

    $stockDoor   = ']] .. findItem(door_itemid) .. [[
'

    $stockEntrance = ']] .. findItem(entrance_itemid) .. [[
'

    $stockJammer  = ']] .. findItem(jammerId) .. [[
'
    
    $cpu = (Get-WmiObject win32_processor | Measure-Object -property LoadPercentage -Average | Select Average).Average
    
    $ram = (Get-Counter '\Memory\Available MBytes').CounterSamples.CookedValue
    
    $date = ']] .. os.date("!%x | %I:%M %p", os.time() + 25200) .. [[
'
    
    $ip = Get-NetIPAddress -AddressFamily IPv4 -InterfaceIndex $(Get-NetConnectionProfile | Select-Object -ExpandProperty InterfaceIndex) | Select-Object -ExpandProperty IPAddress
    
    
    $thumbUrl = ']] .. thumbnail .. [[
' 
    $thumbnailObject = [PSCustomObject]@{
    
    url = $thumbUrl
    
    }
    
    $embedObject = [PSCustomObject]@{
    username    = $user
    title       = $title
    description = "<a:discord:993775478798307368> Discord : <@$discordid>
    <:server_owner:999478757775642674> Owner Script : $lockOwner

    `n**RDP INFORMATION**
    <:CPU:996159527500120127> CPU : $cpu%`n<:RAM:996159529966391377> Free RAM : $ram MB`r
    <:ipaddress:997077571810369637> IPv4 : $ip`n
    
    **BOT INFORMATION**
    <a:broadcast:981898314423341116> Information : **$description**
    <:bot:1013240987906228255> Name Bot : $nameBot
    <:gtLevelUp:799439602032705567> Level : $levelbot
    <:world:996054982795198544> World : $worldBot
    <a:onlinegif:958670636434219018> Status : $online
    `n**BACKPACK INFORMATION**
    <:WL:880251447470596157> WL : $stockWL
    <:small_lock:1025726493743132722> SL/BL/HL : $stockSL
    <:door_growtopia:1025727914349711360> Door : $stockDoor
    <:house_entrance:1025728368089497630> Entrance : $stockEntrance
    <:signal_jammer:998084034980749362> Jammer : $stockJammer
    ***[$date]***"
    color       = $color
    thumbnail   = $thumbnailObject
    
    }
    
    $embedArray.Add($embedObject) | Out-Null
    
    $payload = [PSCustomObject]@{
    
    embeds = $embedArray
    
    }
    
    Invoke-RestMethod -Uri $webHookUrl -Body ($payload | ConvertTo-Json -Depth 4) -Method Post -ContentType 'application/json'
    ]]
  pipe = io.popen("powershell  -command -", "w")
  pipe:write(script)
  pipe:close()
end
function checkPeople()
  ban_now = false
  list_people = {}
  i = 0
  if bangrowid == true then
    for _, plyer in pairs(getPlayers()) do
      for _, whitePlayer in pairs(whitelist) do
        if string.lower(plyer.name) == string.lower(whitePlayer) then
          ban_now = false
          break
        else
          ban_now = true
        end
      end
      if ban_now == true then
        list_people[i] = plyer.name
        i = i + 1
      end
    end
    if i > 0 then
      for _, j in pairs(list_people) do
        say("/ban " .. j)
        sleep(100)
      end
    end
  end
end
function gs(id)
  count = 0
  for _, object in pairs(getObjects()) do
    if object.id == id then
      count = count + object.count
    end
  end
  return count
end
function whiteDoorM()
  while 6 == getTile(math.floor(getBot().x / 32), math.floor(getBot().y / 32)).fg do
    move(-1, 0)
    sleep(200)
    move(-1, 0)
    sleep(200)
    if 0 == getTile(math.floor(getBot().x / 32), math.floor(getBot().y / 32)).fg then
      break
    end
  end
end
function recon()
  if getBot().status ~= "online" and disable_webhook == false then
    pshell(webhookdc, dcbotnamedc, thumbnaildc, colorEmbed, "Checking status bot")
  end
  while getBot().status ~= "online" do
    sleep(1000)
    if getBot().status == "online" and disable_webhook == false then
      whiteDoorM()
      pshell(webhookdc, dcbotnamedc, thumbnaildc, colorEmbed, "Checking status bot")
      break
    end
  end
end
function dropItem(itemID, count)
  if count <= findItem(itemID) then
    sendPacket(2, [[
action|drop
itemID|]] .. itemID)
    sleep(500)
    sendPacket(2, [[
action|dialog_return
dialog_name|drop_item
itemID|]] .. itemID .. [[
|
count|]] .. count)
    sleep(1000)
  end
end
trashs = {
  11,
  10,
  2914,
  5024,
  5026,
  5028,
  5030,
  5032,
  5034,
  5036,
  5038,
  5040,
  5042,
  5044
}
function trashh()
  world_df = getBot().world
  x = math.floor(getBot().x / 32)
  y = math.floor(getBot().y / 32)
  for i, trash in ipairs(trashs) do
    if findItem(trash) > 0 then
      sendPacket(2, [[
action|trash
|itemID|]] .. trash)
      sleep(500)
      sendPacket(2, [[
action|dialog_return
dialog_name|trash_item
itemID|]] .. trash .. [[
|
count|]] .. findItem(trash))
      sleep(500)
    end
  end
  if save_seed == false then
    TrashF = {
      2,
      14,
      4,
      3,
      15,
      5,
      11
    }
    for i, trash in ipairs(TrashF) do
      if findItem(trash) > 190 then
        sendPacket(2, [[
action|trash
|itemID|]] .. trash)
        sleep(500)
        sendPacket(2, [[
action|dialog_return
dialog_name|trash_item
itemID|]] .. trash .. [[
|
count|]] .. 20)
        sleep(500)
      end
    end
  else
    TrashF = {
      2,
      14,
      4
    }
    for i, trash in ipairs(TrashF) do
      if findItem(trash) > 190 then
        sendPacket(2, [[
action|trash
|itemID|]] .. trash)
        sleep(500)
        sendPacket(2, [[
action|dialog_return
dialog_name|trash_item
itemID|]] .. trash .. [[
|
count|]] .. 20)
        sleep(500)
      end
    end
    Isseed = false
    Listseed = {
      3,
      15,
      5,
      11
    }
    for i, seed in ipairs(Listseed) do
      if findItem(seed) > 150 then
        Isseed = true
      end
    end
    if Isseed then
      while string.lower(getBot().world) ~= string.lower(world_seed) do
        sendPacket(3, [[
action|join_request
name|]] .. world_seed .. [[

invitedWorld|0]])
        sleep(15000)
      end
      sendPacket(3, [[
action|join_request
name|]] .. world_seed .. "|" .. id_world_seed .. [[

invitedWorld|0]])
      sleep(5000)
      for i, seed in ipairs(Listseed) do
        if findItem(seed) > 150 then
          collectSet(false, 2)
          count_seed = findItem(seed)
          drop(seed)
          sleep(4000)
          while count_seed == findItem(seed) do
            move(move_direction, 0)
            sleep(1000)
            drop(seed)
            sleep(4000)
          end
        end
      end
      while string.lower(getBot().world) ~= string.lower(world_df) do
        sendPacket(3, [[
action|join_request
name|]] .. world_df .. [[

invitedWorld|0]])
        sleep(15000)
      end
      collectSet(true, 2)
      whiteDoorM()
      findPath(x, y)
      sleep(500)
    end
  end
end
function clearSide()
  for i = 24, 53 do
    checkPeople()
    if 14 == getTile(1, i).bg or 2 == getTile(1, i).fg or 14 == getTile(0, i).bg or 2 == getTile(0, i).fg then
      while 14 == getTile(1, i).bg or 2 == getTile(1, i).fg do
        recon()
        whiteDoorM()
        findPath(1, i - 1)
        punch(0, 1)
        sleep(190)
        if 0 == getTile(1, i).bg then
          collect(2)
        end
        trashh()
      end
      while 14 == getTile(0, i).bg or 2 == getTile(0, i).fg do
        recon()
        whiteDoorM()
        findPath(1, i - 1)
        punch(-1, 1)
        sleep(190)
        if 0 == getTile(1, i).bg then
          collect(2)
        end
        trashh()
      end
    end
  end
  for i = 24, 53 do
    checkPeople()
    if 14 == getTile(98, i).bg or 2 == getTile(98, i).fg or 14 == getTile(99, i).bg or 2 == getTile(99, i).fg then
      while 14 == getTile(98, i).bg or 2 == getTile(98, i).fg do
        recon()
        whiteDoorM()
        findPath(98, i - 1)
        punch(0, 1)
        sleep(190)
        if 0 == getTile(1, i).bg then
          collect(2)
        end
        trashh()
      end
      while 14 == getTile(99, i).bg or 2 == getTile(99, i).fg do
        recon()
        whiteDoorM()
        findPath(98, i - 1)
        punch(1, 1)
        sleep(190)
        if 0 == getTile(1, i).bg then
          collect(2)
        end
        trashh()
      end
    end
  end
end
function platform(retun)
  checkPeople()
  checkSLOT()
  while findItem(platId) < 52 do
    say("Platform stock : " .. findItem(platId))
    sleep(6000)
    recon()
    sendPacket(3, [[
action|join_request
name|]] .. worldPlat .. [[

invitedWorld|0]])
    sleep(15000)
    while string.lower(getBot().world) ~= string.lower(worldPlat) do
      sendPacket(3, [[
action|join_request
name|]] .. worldPlat .. [[

invitedWorld|0]])
      sleep(15000)
    end
    sendPacket(3, [[
action|join_request
name|]] .. worldPlat .. "|" .. idWorldPlat .. [[

invitedWorld|0]])
    sleep(5000)
    for _, object in pairs(getObjects()) do
      if object.id == platId then
        recon()
        findPath(math.floor(object.x / 32), math.floor(object.y / 32))
        sleep(3000)
        break
      end
    end
    recon()
    collect(2)
    sleep(4500)
    recon()
    if disable_webhook == false then
      pshell(webhookdc, dcbotnamedc, thumbnaildc, colorEmbed, "Checking platform")
    end
    if findItem(platId) > 52 then
      collectSet(false, 2)
      dropItem(platId, findItem(platId) - 52)
    end
    recon()
    sendPacket(3, [[
action|join_request
name|]] .. retun .. [[

invitedWorld|0]])
    sleep(15000)
    while string.lower(getBot().world) ~= string.lower(retun) do
      sendPacket(3, [[
action|join_request
name|]] .. retun .. [[

invitedWorld|0]])
      sleep(15000)
    end
    checkPeople()
    recon()
    whiteDoorM()
  end
  for i = 2, 52, 2 do
    checkPeople()
    while 0 == getTile(1, i).fg do
      recon()
      if 0 == findItem(platId) then
        break
      end
      whiteDoorM()
      findPath(1, i - 1)
      place(platId, 0, 1)
      sleep(190)
    end
  end
  for i = 2, 52, 2 do
    checkPeople()
    while 0 == getTile(98, i).fg do
      recon()
      if 0 == findItem(platId) then
        break
      end
      whiteDoorM()
      findPath(98, i - 1)
      place(platId, 0, 1)
      sleep(190)
    end
  end
end
function clearDirt()
  for i = 1, 54, 2 do
    for j = 2, 97 do
      checkPeople()
      if 14 == getTile(j, i).bg then
        recon()
        while 14 == getTile(j, i).bg or 2 == getTile(j, i).fg do
          recon()
          whiteDoorM()
          findPath(j - 1, i)
          punch(1, 0)
          sleep(190)
          if 0 == getTile(j, i).bg or 0 == getTile(j, i + 1).fg then
            recon()
            collect(2)
          end
          trashh()
          recon()
        end
      end
    end
  end
end
function clearRock()
  if breakRock then
    checkPeople()
    for _, tile in pairs(getTiles()) do
      while 10 == tile.fg do
        recon()
        checkPeople()
        whiteDoorM()
        recon()
        findPath(tile.x, tile.y - 1)
        punch(0, 1)
        sleep(190)
        if 0 == getTile(tile.x, tile.y).fg then
          collect(2)
          break
        end
        trashh()
      end
    end
  end
end
function clearLava()
  checkPeople()
  for _, tile in pairs(getTiles()) do
    while 4 == tile.fg do
      checkPeople()
      recon()
      whiteDoorM()
      recon()
      findPath(tile.x, tile.y - 1)
      punch(0, 1)
      sleep(190)
      if 0 == getTile(tile.x, tile.y).fg then
        collect(2)
        break
      end
      trashh()
    end
  end
end
function plantHv()
  checkPeople()
  while 0 == findItem(2) do
    if getBot().status ~= "online" and disable_webhook == false then
      pshell(webhookdc, dcbotnamedc, thumbnaildc, colorEmbed, "Checking status bot")
    end
    while getBot().status ~= "online" do
      sleep(1000)
      if getBot().status == "online" and disable_webhook == false then
        pshell(webhookdc, dcbotnamedc, thumbnaildc, colorEmbed, "Checking status bot")
        plantHv()
        break
      end
    end
    for x = 2, 22 do
      checkPeople()
      if getBot().status ~= "online" and disable_webhook == false then
        pshell(webhookdc, dcbotnamedc, thumbnaildc, colorEmbed, "Checking status bot")
      end
      while getBot().status ~= "online" do
        sleep(1000)
        if getBot().status == "online" and disable_webhook == false then
          pshell(webhookdc, dcbotnamedc, thumbnaildc, colorEmbed, "Checking status bot")
          plantHv()
          break
        end
      end
      if findItem(2) > 180 then
        checkPeople()
        break
      end
      if 0 == findItem(3) then
        if disable_webhook == false then
          pshell(webhookdc, dcbotnamedc, thumbnaildc, colorEmbed, "Need more Dirt")
          sleep(10000)
        end
        while 0 == findItem(3) do
          checkSLOT()
          trashh()
          checkPeople()
          say("GIVE ME DIRT SEED LOL")
          sleep(10000)
          back_Df = getBot().world
          while string.lower(getBot().world) ~= string.lower(world_seed) do
            sendPacket(3, [[
action|join_request
name|]] .. world_seed .. [[

invitedWorld|0]])
            sleep(15000)
          end
          sendPacket(3, [[
action|join_request
name|]] .. world_seed .. "|" .. id_world_seed .. [[

invitedWorld|0]])
          sleep(5000)
          for _, object in pairs(getObjects()) do
            if 3 == object.id then
              collect(2)
              findPath(math.floor(object.x / 32), math.floor(object.y / 32))
              sleep(4000)
            end
            if findItem(3) > 0 then
              break
            end
          end
        end
        while string.lower(getBot().world) ~= string.lower(back_Df) do
          sendPacket(3, [[
action|join_request
name|]] .. back_Df .. [[

invitedWorld|0]])
          sleep(15000)
        end
        whiteDoorM()
        break
      end
      while 3 == getTile(x, 23).fg and getTile(x, 23).ready == true do
        if getBot().status ~= "online" and disable_webhook == false then
          pshell(webhookdc, dcbotnamedc, thumbnaildc, colorEmbed, "Checking status bot")
        end
        while getBot().status ~= "online" do
          sleep(1000)
          if getBot().status == "online" and disable_webhook == false then
            pshell(webhookdc, dcbotnamedc, thumbnaildc, colorEmbed, "Checking status bot")
            plantHv()
            break
          end
        end
        whiteDoorM()
        findPath(x, 23)
        punch(0, 0)
        sleep(190)
        collect(2)
      end
      while 0 == getTile(x, 23).fg and findItem(3) > 0 do
        if getBot().status ~= "online" and disable_webhook == false then
          pshell(webhookdc, dcbotnamedc, thumbnaildc, colorEmbed, "Checking status bot")
        end
        while getBot().status ~= "online" do
          sleep(1000)
          if getBot().status == "online" and disable_webhook == false then
            pshell(webhookdc, dcbotnamedc, thumbnaildc, colorEmbed, "Checking status bot")
            plantHv()
            break
          end
        end
        whiteDoorM()
        findPath(x, 23)
        place(3, 0, 0)
        sleep(100)
      end
    end
  end
  checkPeople()
end
function placeDirt()
  checkPeople()
  if getBot().status ~= "online" and disable_webhook == false then
    pshell(webhookdc, dcbotnamedc, thumbnaildc, colorEmbed, "Checking status bot")
  end
  while getBot().status ~= "online" do
    sleep(1000)
    if getBot().status == "online" and disable_webhook == false then
      pshell(webhookdc, dcbotnamedc, thumbnaildc, colorEmbed, "Checking status bot")
      placeDirt()
      break
    end
  end
  for y = 52, 2, -2 do
    if getBot().status ~= "online" and disable_webhook == false then
      pshell(webhookdc, dcbotnamedc, thumbnaildc, colorEmbed, "Checking status bot")
    end
    while getBot().status ~= "online" do
      sleep(1000)
      if getBot().status == "online" and disable_webhook == false then
        pshell(webhookdc, dcbotnamedc, thumbnaildc, colorEmbed, "Checking status bot")
        placeDirt()
        break
      end
    end
    for x = 2, 97 do
      if getBot().status ~= "online" and disable_webhook == false then
        pshell(webhookdc, dcbotnamedc, thumbnaildc, colorEmbed, "Checking status bot")
      end
      while getBot().status ~= "online" do
        sleep(1000)
        if getBot().status == "online" and disable_webhook == false then
          pshell(webhookdc, dcbotnamedc, thumbnaildc, colorEmbed, "Checking status bot")
          placeDirt()
          break
        end
      end
      if 0 == getTile(x, y).fg then
        plantHv()
        whiteDoorM()
        findPath(x, y - 1)
        if getBot().status ~= "online" and disable_webhook == false then
          pshell(webhookdc, dcbotnamedc, thumbnaildc, colorEmbed, "Checking status bot")
        end
        while getBot().status ~= "online" do
          sleep(1000)
          if getBot().status == "online" and disable_webhook == false then
            pshell(webhookdc, dcbotnamedc, thumbnaildc, colorEmbed, "Checking status bot")
            placeDirt()
            break
          end
        end
        while 0 == getTile(x, y).fg and findItem(2) > 0 do
          if getBot().status ~= "online" and disable_webhook == false then
            pshell(webhookdc, dcbotnamedc, thumbnaildc, colorEmbed, "Checking status bot")
          end
          while getBot().status ~= "online" do
            sleep(1000)
            if getBot().status == "online" and disable_webhook == false then
              pshell(webhookdc, dcbotnamedc, thumbnaildc, colorEmbed, "Checking status bot")
              placeDirt()
              break
            end
          end
          place(2, 0, 1)
          sleep(190)
        end
      end
    end
    if getBot().status ~= "online" and disable_webhook == false then
      pshell(webhookdc, dcbotnamedc, thumbnaildc, colorEmbed, "Checking status bot")
    end
    while getBot().status ~= "online" do
      sleep(1000)
      if getBot().status == "online" and disable_webhook == false then
        pshell(webhookdc, dcbotnamedc, thumbnaildc, colorEmbed, "Checking status bot")
        placeDirt()
        break
      end
    end
  end
  if getBot().status ~= "online" and disable_webhook == false then
    pshell(webhookdc, dcbotnamedc, thumbnaildc, colorEmbed, "Checking status bot")
  end
  while getBot().status ~= "online" do
    sleep(1000)
    if getBot().status == "online" and disable_webhook == false then
      pshell(webhookdc, dcbotnamedc, thumbnaildc, colorEmbed, "Checking status bot")
      placeDirt()
      break
    end
  end
end
function allDone()
  if getBot().status ~= "online" and disable_webhook == false then
    pshell(webhookdc, dcbotnamedc, thumbnaildc, colorEmbed, "Checking status bot")
  end
  while getBot().status ~= "online" do
    sleep(1000)
    if getBot().status == "online" and disable_webhook == false then
      pshell(webhookdc, dcbotnamedc, thumbnaildc, colorEmbed, "Checking status bot")
      allDone()
      break
    end
  end
  checkPeople()
  if takeJammer == true then
    sendPacket(3, [[
action|join_request
name|]] .. getBot().world .. [[

invitedWorld|0]])
    sleep(5000)
    count_jammer = findItem(jammerId)
    while findItem(jammerId) == count_jammer do
      punch(-1, -1)
      sleep(200)
    end
    place(2, -1, -1)
  end
  if getBot().status ~= "online" and disable_webhook == false then
    pshell(webhookdc, dcbotnamedc, thumbnaildc, colorEmbed, "Checking status bot")
  end
  while getBot().status ~= "online" do
    sleep(1000)
    if getBot().status == "online" and disable_webhook == false then
      pshell(webhookdc, dcbotnamedc, thumbnaildc, colorEmbed, "Checking status bot")
      allDone()
      break
    end
  end
  checkPeople()
  if true == takeWL then
    sendPacket(3, [[
action|join_request
name|]] .. getBot().world .. [[

invitedWorld|0]])
    sleep(5000)
    count_wl = findItem(wlId)
    while findItem(wlId) == count_wl do
      if SL_mode then
        punch(1, 1)
        sleep(200)
      else
        punch(0, -1)
        sleep(200)
      end
    end
    if SL_mode then
      place(2, 1, 1)
    else
      place(2, 0, -1)
    end
  end
  checkPeople()
  for x = 2, 22 do
    while 3 == getTile(x, 23).fg do
      if getBot().status ~= "online" and disable_webhook == false then
        pshell(webhookdc, dcbotnamedc, thumbnaildc, colorEmbed, "Checking status bot")
      end
      while getBot().status ~= "online" do
        sleep(1000)
        if getBot().status == "online" and disable_webhook == false then
          pshell(webhookdc, dcbotnamedc, thumbnaildc, colorEmbed, "Checking status bot")
          allDone()
          break
        end
      end
      whiteDoorM()
      findPath(x, 23)
      punch(0, 0)
      sleep(190)
      trashh()
      if 0 == getTile(x, 23).fg then
        collect(2)
        sleep(400)
      end
    end
  end
end
say("Script Running")
sleep(2000)
say("buy sc? `4Youtube : Zitus, `2Subcriber : 225")
sleep(4000)
--for _, player in pairs(getPlayers()) do
  --if string.lower(player.name) == string.lower(owner) then
    isOwner = true
    say("Owner script : " .. owner)
    if disable_webhook == false then
      pshell(webhookdc, dcbotnamedc, thumbnaildc, colorEmbed, "OWNER SCRIPT IS ALIVE")
      sleep(4000)
    end
    --break
  --else
  --  isOwner = false
  --end
--end
if isOwner == false then
  say("Sorry you're not Owner script SILLY !")
  if disable_webhook == false then
    pshell(webhookdc, dcbotnamedc, thumbnaildc, colorEmbed, "Owner Script not with bot when executed RIP")
    sleep(4000)
  end
end
function checkSLOT()
  if auto_buy_bp == true then
    bp_active = 0
    for _, item in pairs(getInventory()) do
      bp_active = bp_active + 1
    end
    if bp_active == getBot().slots then
      trashh()
      sendPacket(2, [[
action|buy
item|upgrade_backpack]])
      sleep(3000)
    end
  end
end
function main()
  iterator_df = 1
  checkSLOT()
  while getBot().world ~= "EXIT" do
    say("Checking `9WL `wand `2JAMMER")
    sleep(4000)
    while 0 == findItem(wlId) or 0 == findItem(jammerId) do
      for _, obj in pairs(getObjects()) do
        if obj.id == jammerId or obj.id == wlId then
          collectSet(true, 2)
          findPath(math.floor(obj.x / 32), math.floor(obj.y / 32))
          sleep(4000)
          say("Found " .. obj.id .. " at x : " .. math.floor(obj.x / 32) .. ", y : " .. math.floor(obj.y / 32))
        end
      end
      count_df = 0
      for _, world_df in pairs(list_DF) do
        count_df = count_df + 1
      end
      if count_df > 0 and remove_bot == true and 0 == findItem(wlId) then
        removeBot(getBot().name)
        break
      end
      say("WAITING TO COLLECT ITEM")
      sleep(10000)
    end
    if SL_mode then
      while 0 == findItem(sl_id) or 0 == findItem(door_itemid) or 0 == findItem(entrance_itemid) do
        for _, obj in pairs(getObjects()) do
          if obj.id == sl_id or obj.id == door_itemid or obj.id == entrance_itemid then
            collectSet(true, 2)
            findPath(math.floor(obj.x / 32), math.floor(obj.y / 32))
            sleep(4000)
            say("Found " .. obj.id .. " at x : " .. math.floor(obj.x / 32) .. ", y : " .. math.floor(obj.y / 32))
          end
        end
        say("WAITING TO COLLECT ITEM")
        sleep(8000)
      end
    end
    collectSet(false, 2)
    world = ""
    if true == nonumber then
      for i = 1, letter do
        world = world .. string.char(math.random(97, 122))
        world = string.upper(world)
      end
    else
      for i = 1, letter do
        if 0 == i % 2 then
          world = world .. string.char(math.random(97, 122))
          world = string.upper(world)
        else
          world = world .. string.char(math.random(48, 57))
          world = string.upper(world)
        end
      end
    end
    sleep(4000)
    j = 1
    while getBot().world ~= world and findItem(wlId) > 0 and findItem(jammerId) > 0 do
      if j < 4 then
        recon()
        if disable_webhook == false then
          pshell(webhookdc, dcbotnamedc, thumbnaildc, colorEmbed, "Trying to Join world (" .. world .. ")")
        end
        sendPacket(3, [[
action|join_request
name|]] .. world .. [[

invitedWorld|0]])
        sleep(15000)
        j = j + 1
      else
        world = ""
        if true == nonumber then
          j = 0
          for i = 1, letter do
            world = world .. string.char(math.random(97, 122))
            world = string.upper(world)
          end
        else
          j = 0
          for i = 1, letter do
            if 0 == i % 2 then
              world = world .. string.char(math.random(97, 122))
              world = string.upper(world)
            else
              world = world .. string.char(math.random(48, 57))
              world = string.upper(world)
            end
          end
        end
      end
    end
    if disable_webhook == false then
      pshell(webhookdc, dcbotnamedc, thumbnaildc, colorEmbed, "Joined World")
      sleep(4000)
    end
    say("/msg " .. owner .. " Success Join world")
    countWL = findItem(wlId)
    countJammer = findItem(jammerId)
    sleep(4000)
    isWorldLocked = false
    list_lock = {
      202,
      204,
      206,
      242,
      1796,
      7188,
      9640,
      4802,
      5814,
      8470,
      5980,
      2950,
      5260,
      4482,
      2408,
      10410,
      11550,
      11586
    }
    for _, tile in pairs(getTiles()) do
      if false == isWorldLocked then
        for _, lock_id in pairs(list_lock) do
          if tile.fg == lock_id then
            isWorldLocked = true
            say("WORLD HAVE BEEN LOCKED BY SOMEONE ELSE")
            if disable_webhook == false then
              pshell(webhookdc, dcbotnamedc, thumbnaildc, colorEmbed, "WORLD ALREADY LOCKED")
              sleep(4000)
            end
            break
          end
        end
      else
        break
      end
    end
    if false == isWorldLocked then
      sleep(1000)
      if SL_mode then
        collectSet(true, 2)
        recon()
        while 0 ~= getTile(math.floor(getBot().x / 32) - 2, math.floor(getBot().y / 32) + 1).fg or 0 ~= getTile(math.floor(getBot().x / 32) - 2, math.floor(getBot().y / 32) + 1).bg do
          punch(-2, 1)
          sleep(200)
        end
        recon()
        while 0 ~= getTile(math.floor(getBot().x / 32) - 1, math.floor(getBot().y / 32) + 1).fg or 0 ~= getTile(math.floor(getBot().x / 32) - 1, math.floor(getBot().y / 32) + 1).bg do
          punch(-1, 1)
          sleep(200)
        end
        recon()
        while 0 ~= getTile(math.floor(getBot().x / 32) - 1, math.floor(getBot().y / 32) + 2).fg or 0 ~= getTile(math.floor(getBot().x / 32) - 1, math.floor(getBot().y / 32) + 2).bg do
          punch(-1, 2)
          sleep(200)
        end
        recon()
        while 0 ~= getTile(math.floor(getBot().x / 32) + 1, math.floor(getBot().y / 32) + 1).fg or 0 ~= getTile(math.floor(getBot().x / 32) + 1, math.floor(getBot().y / 32) + 1).bg do
          punch(1, 1)
          sleep(200)
        end
        recon()
        while 0 ~= getTile(math.floor(getBot().x / 32) - 1, math.floor(getBot().y / 32) - 1).fg do
          punch(-1, -1)
          sleep(200)
        end
        recon()
        while 0 ~= getTile(math.floor(getBot().x / 32), math.floor(getBot().y / 32) - 1).fg do
          punch(0, -1)
          sleep(200)
        end
        recon()
        while 0 ~= getTile(math.floor(getBot().x / 32) + 1, math.floor(getBot().y / 32) - 1).fg do
          punch(1, -1)
          sleep(200)
        end
        recon()
        move(1, 0)
        sleep(200)
        place(wlId, 0, 1)
        sleep(2000)
        recon()
        pub = 1
        ignor = 0
        wrench(0, 1)
        sleep(5000)
        sendPacket(2, [[
action|dialog_return
dialog_name|lock_edit
tilex|]] .. math.floor(getBot().x / 32) .. [[
|
tiley|]] .. math.floor(getBot().y / 32) + 1 .. [[
|
buttonClicked|recalcLock

checkbox_public|]] .. pub .. [[

checkbox_ignore|]] .. ignor)
        move(-1, 0)
        recon()
        sleep(200)
        place(jammerId, -1, -1)
        sleep(2000)
        punch(-1, -1)
        sleep(200)
        recon()
        count_sl = findItem(sl_id)
        if findItem(sl_id) > 0 then
          while count_sl == findItem(sl_id) do
            place(sl_id, 0, -1)
            sleep(200)
          end
        end
        recon()
        if findItem(entrance_itemid) > 0 then
          recon()
          while getTile(math.floor(getBot().x / 32) - 1, math.floor(getBot().y / 32)).fg ~= entrance_itemid do
            place(entrance_itemid, -1, 0)
            sleep(500)
          end
          while getTile(math.floor(getBot().x / 32) + 1, math.floor(getBot().y / 32)).fg ~= entrance_itemid do
            place(entrance_itemid, 1, 0)
            sleep(500)
          end
        else
          recon()
          place(2, -1, 0)
          sleep(500)
          place(2, 1, 0)
          sleep(500)
        end
        checkPeople()
        recon()
        move(-1, 0)
        sleep(200)
        recon()
        if findItem(door_itemid) > 0 then
          place(door_itemid, 0, 1)
          sleep(1000)
          editDoor("WHAT!?", getBot().world, edit_doorid)
          sleep(2000)
        else
          place(2, 0, 1)
          sleep(200)
        end
        recon()
        move(1, 0)
        sleep(100)
        recon()
        if findItem(2) > 0 then
          place(2, 1, -1)
          sleep(200)
        else
          world_df = getBot().world
          recon()
          whiteDoorM()
          checkPeople()
          for x = 2, 22 do
            if 0 == getTile(x, 23).fg then
              findPath(x, 23)
              if findItem(3) > 0 then
                place(3, 0, 0)
                while 0 == findItem(2) do
                  while 3 == getTile(x, 23).fg and true == getTile(x, 23).ready do
                    punch(0, 0)
                  end
                end
              else
                while 0 == findItem(3) do
                  while string.lower(getBot().world) ~= string.lower(world_seed) do
                    sendPacket(3, [[
action|join_request
name|]] .. world_seed .. [[

invitedWorld|0]])
                    sleep(15000)
                  end
                  sendPacket(3, [[
action|join_request
name|]] .. world_seed .. "|" .. id_world_seed .. [[

invitedWorld|0]])
                  sleep(5000)
                  for _, object in pairs(getObjects()) do
                    if 3 == object.id then
                      collect(2)
                      findPath(math.floor(object.x / 32), math.floor(object.y / 32))
                      sleep(4000)
                      break
                    end
                  end
                end
                while string.lower(getBot().world) ~= string.lower(world_df) do
                  sendPacket(3, [[
action|join_request
name|]] .. world_df .. [[

invitedWorld|0]])
                  sleep(15000)
                end
                whiteDoorM()
                sleep(500)
                findPath(x, 23)
                if findItem(3) > 0 then
                  place(3, 0, 0)
                  while 0 == findItem(2) do
                    while 3 == getTile(x, 23).fg and true == getTile(x, 23).ready do
                      punch(0, 0)
                    end
                  end
                end
              end
              sendPacket(3, [[
action|join_request
name|]] .. world_df .. [[

invitedWorld|0]])
              sleep(5000)
              place(2, 1, -1)
              sleep(500)
              break
            end
          end
        end
        recon()
        checkPeople()
        pub = 0
        ignor = 1
        wrench(0, -1)
        sleep(5000)
        sendPacket(2, [[
action|dialog_return
dialog_name|lock_edit
tilex|]] .. math.floor(getBot().x / 32) .. [[
|
tiley|]] .. math.floor(getBot().y / 32) - 1 .. [[
|
buttonClicked|recalcLock

checkbox_public|]] .. pub .. [[

checkbox_ignore|]] .. ignor)
        recon()
        while getTile(math.floor(getBot().x / 32) - 1, math.floor(getBot().y / 32)).fg ~= entrance_itemid do
          punch(-1, 0)
          sleep(200)
        end
        recon()
        while getTile(math.floor(getBot().x / 32) + 1, math.floor(getBot().y / 32)).fg ~= entrance_itemid do
          punch(1, 0)
          sleep(200)
        end
        recon()
      else
        recon()
        place(wlId, 0, -1)
        sleep(2000)
        recon()
        place(jammerId, -1, -1)
        sleep(2000)
        punch(-1, -1)
        sleep(200)
      end
    end
    if findItem(wlId) < countWL then
      recon()
      say("/msg " .. owner .. " Success lock world")
      isLocked = true
      list_DF[iterator_df] = getBot().world
      logToTxt(getBot().world)
      iterator_df = iterator_df + 1
      if disable_webhook == false then
        pshell(webhookdc, dcbotnamedc, thumbnaildc, colorEmbed, "WL & JAMMER PLACED")
      end
    else
      isLocked = false
    end
    if true == isLocked then
      start = os.time()
      checkPeople()
      whiteDoorM()
      if disable_webhook == false then
        pshell(webhookdc, dcbotnamedc, thumbnaildc, colorEmbed, "Start making Dirt Farm")
      end
      checkPeople()
      clearSide()
      checkPeople()
      platform(world)
      checkPeople()
      if disable_webhook == false then
        pshell(webhookdc, dcbotnamedc, thumbnaildc, colorEmbed, "Platform placed")
      end
      checkSLOT()
      clearDirt()
      checkPeople()
      if disable_webhook == false then
        pshell(webhookdc, dcbotnamedc, thumbnaildc, colorEmbed, "Done Clear Dirt")
      end
      clearRock()
      checkSLOT()
      checkPeople()
      if disable_webhook == false then
        pshell(webhookdc, dcbotnamedc, thumbnaildc, colorEmbed, "Clearing Lava")
      end
      clearLava()
      checkPeople()
      if disable_webhook == false then
        pshell(webhookdc, dcbotnamedc, thumbnaildc, colorEmbed, "Start plant and harvest Dirt")
      end
      placeDirt()
      checkSLOT()
      checkPeople()
      if disable_webhook == false then
        start = os.time() - start
        total_time = "DF done in " .. math.floor(start / 3600) .. " Hours " .. math.floor(start % 3600 / 60) .. " Minutes"
        pshell(webhookdc, dcbotnamedc, thumbnaildc, colorEmbed, total_time)
      end
      checkSLOT()
      allDone()
      checkPeople()
      checkSLOT()
      string_list_df = ""
      for _, list_df_world in pairs(list_DF) do
        string_list_df = string_list_df .. list_df_world .. "\n"
      end
      if disable_webhook == false then
        pshell(webhookdc, dcbotnamedc, thumbnaildc, colorEmbed, "Showing List DIRT FARM" .. [[


<:world:996054982795198544> World : ]] .. string_list_df .. "\n")
      end
    end
  end
end
function main_2()
  checkSLOT()
  counter = 0
  for _, counting_df in pairs(list_world_DF) do
    counter = counter + 1
  end
  counter = counter - findItem(wlId)
  if counter > 0 then
    say("`2I NEED " .. counter .. " WLS ")
  end
  while findItem(wlId) < counter or 0 == findItem(jammerId) do
    for _, obj in pairs(getObjects()) do
      if obj.id == jammerId or obj.id == wlId then
        collectSet(true, 2)
        findPath(math.floor(obj.x / 32), math.floor(obj.y / 32))
        sleep(4000)
        say("Found " .. obj.id .. " at x : " .. math.floor(obj.x / 32) .. ", y : " .. math.floor(obj.y / 32))
      end
    end
    say("WAITING TO COLLECT ITEM")
    sleep(8000)
  end
  if SL_mode then
    while findItem(sl_id) < counter or 0 == findItem(door_itemid) or 0 == findItem(entrance_itemid) do
      for _, obj in pairs(getObjects()) do
        if obj.id == sl_id or obj.id == door_itemid or obj.id == entrance_itemid then
          collectSet(true, 2)
          findPath(math.floor(obj.x / 32), math.floor(obj.y / 32))
          sleep(4000)
          say("Found " .. obj.id .. " at x : " .. math.floor(obj.x / 32) .. ", y : " .. math.floor(obj.y / 32))
        end
      end
      say("WAITING TO COLLECT ITEM")
      sleep(8000)
    end
  end
  for _, df_zitus in pairs(list_world_DF) do
    sendPacket(3, [[
action|join_request
name|]] .. df_zitus .. [[

invitedWorld|0]])
    sleep(15000)
    while getBot().world ~= df_zitus do
      sendPacket(3, [[
action|join_request
name|]] .. df_zitus .. [[

invitedWorld|0]])
      sleep(15000)
    end
    say("/msg " .. owner .. " Success Join world")
    collectSet(false, 2)
    if disable_webhook == false then
      pshell(webhookdc, dcbotnamedc, thumbnaildc, colorEmbed, "Joined World")
      sleep(4000)
    end
    isWorldLocked = false
    countWL = findItem(wlId)
    if false == isWorldLocked then
      sleep(1000)
      if SL_mode then
        collectSet(true, 2)
        while 0 ~= getTile(math.floor(getBot().x / 32) - 2, math.floor(getBot().y / 32) + 1).fg or 0 ~= getTile(math.floor(getBot().x / 32) - 2, math.floor(getBot().y / 32) + 1).bg do
          punch(-2, 1)
          sleep(200)
        end
        while 0 ~= getTile(math.floor(getBot().x / 32) - 1, math.floor(getBot().y / 32) + 1).fg or 0 ~= getTile(math.floor(getBot().x / 32) - 1, math.floor(getBot().y / 32) + 1).bg do
          punch(-1, 1)
          sleep(200)
        end
        while 0 ~= getTile(math.floor(getBot().x / 32) - 1, math.floor(getBot().y / 32) + 2).fg or 0 ~= getTile(math.floor(getBot().x / 32) - 1, math.floor(getBot().y / 32) + 2).bg do
          punch(-1, 2)
          sleep(200)
        end
        while 0 ~= getTile(math.floor(getBot().x / 32) + 1, math.floor(getBot().y / 32) + 1).fg or 0 ~= getTile(math.floor(getBot().x / 32) + 1, math.floor(getBot().y / 32) + 1).bg do
          punch(1, 1)
          sleep(200)
        end
        while 0 ~= getTile(math.floor(getBot().x / 32) - 1, math.floor(getBot().y / 32) - 1).fg do
          punch(-1, -1)
          sleep(200)
        end
        while 0 ~= getTile(math.floor(getBot().x / 32), math.floor(getBot().y / 32) - 1).fg do
          punch(0, -1)
          sleep(200)
        end
        while 0 ~= getTile(math.floor(getBot().x / 32) + 1, math.floor(getBot().y / 32) - 1).fg do
          punch(1, -1)
          sleep(200)
        end
        move(1, 0)
        sleep(200)
        place(wlId, 0, 1)
        sleep(2000)
        pub = 1
        ignor = 0
        wrench(0, 1)
        sleep(5000)
        sendPacket(2, [[
action|dialog_return
dialog_name|lock_edit
tilex|]] .. math.floor(getBot().x / 32) .. [[
|
tiley|]] .. math.floor(getBot().y / 32) + 1 .. [[
|
buttonClicked|recalcLock

checkbox_public|]] .. pub .. [[

checkbox_ignore|]] .. ignor)
        sleep(5000)
        move(-1, 0)
        sleep(200)
        place(jammerId, -1, -1)
        sleep(2000)
        punch(-1, -1)
        sleep(200)
        move(-1, 0)
        sleep(200)
        if findItem(door_itemid) > 0 then
          place(door_itemid, 0, 1)
          sleep(1000)
          editDoor("WHAT!?", getBot().world, edit_doorid)
          sleep(2000)
        else
          place(2, 0, 1)
          sleep(200)
        end
        move(1, 0)
        sleep(200)
        if findItem(entrance_itemid) > 0 then
          while getTile(math.floor(getBot().x / 32) - 1, math.floor(getBot().y / 32)).fg ~= entrance_itemid do
            place(entrance_itemid, -1, 0)
            sleep(500)
          end
          while getTile(math.floor(getBot().x / 32) + 1, math.floor(getBot().y / 32)).fg ~= entrance_itemid do
            place(entrance_itemid, 1, 0)
            sleep(500)
          end
        else
          place(2, -1, 0)
          sleep(500)
          place(2, 1, 0)
          sleep(500)
        end
        place(2, 1, -1)
        sleep(200)
        if findItem(sl_id) > 0 then
          place(sl_id, 0, -1)
          sleep(200)
          pub = 0
          ignor = 1
          wrench(0, -1)
          sleep(5000)
          sendPacket(2, [[
action|dialog_return
dialog_name|lock_edit
tilex|]] .. math.floor(getBot().x / 32) .. [[
|
tiley|]] .. math.floor(getBot().y / 32) - 1 .. [[
|
buttonClicked|recalcLock

checkbox_public|]] .. pub .. [[

checkbox_ignore|]] .. ignor)
        end
        while getTile(math.floor(getBot().x / 32) - 1, math.floor(getBot().y / 32)).fg ~= entrance_itemid do
          punch(-1, 0)
          sleep(200)
        end
        while getTile(math.floor(getBot().x / 32) + 1, math.floor(getBot().y / 32)).fg ~= entrance_itemid do
          punch(1, 0)
          sleep(200)
        end
      else
        place(wlId, 0, -1)
        sleep(2000)
        place(jammerId, -1, -1)
        sleep(2000)
        punch(-1, -1)
        sleep(200)
      end
    end
    if findItem(wlId) ~= countWL then
      say("/msg " .. owner .. " Success lock world")
      isLocked = true
      logToTxt(getBot().world)
      if disable_webhook == false then
        pshell(webhookdc, dcbotnamedc, thumbnaildc, colorEmbed, "WL & Jammer PLACED")
      end
    else
      isLocked = false
    end
    if isLocked == true then
      checkPeople()
      whiteDoorM()
      if disable_webhook == false then
        start = os.time()
        pshell(webhookdc, dcbotnamedc, thumbnaildc, colorEmbed, "Start making Dirt Farm")
      end
      checkPeople()
      clearSide()
      checkPeople()
      world = getBot().world
      platform(world)
      checkPeople()
      if disable_webhook == false then
        pshell(webhookdc, dcbotnamedc, thumbnaildc, colorEmbed, "Platform Placed")
      end
      checkSLOT()
      clearDirt()
      checkPeople()
      if disable_webhook == false then
        pshell(webhookdc, dcbotnamedc, thumbnaildc, colorEmbed, "Done Clear Dirt")
      end
      clearRock()
      checkSLOT()
      checkPeople()
      if disable_webhook == false then
        pshell(webhookdc, dcbotnamedc, thumbnaildc, colorEmbed, "Clearing Lava")
      end
      clearLava()
      checkPeople()
      if disable_webhook == false then
        pshell(webhookdc, dcbotnamedc, thumbnaildc, colorEmbed, "Start plant and harvest Dirt")
      end
      placeDirt()
      checkSLOT()
      checkPeople()
      if disable_webhook == false then
        start = os.time() - start
        total_time = "DF done in " .. math.floor(start / 3600) .. " Hours " .. math.floor(start % 3600 / 60) .. " Minutes"
        pshell(webhookdc, dcbotnamedc, thumbnaildc, colorEmbed, total_time)
      end
      checkSLOT()
      allDone()
      checkPeople()
      checkSLOT()
      string_list_df = string_list_df .. getBot().world .. "\n"
      if disable_webhook == false then
        pshell(webhookdc, dcbotnamedc, thumbnaildc, colorEmbed, [[
Showing List DIRT FARM 

]] .. "<:world:996054982795198544> World : " .. string_list_df .. "\n")
      end
    end
  end
end
if isOwner == true then
  if auto_find_world then
    main()
  else
    main_2()
    removeBot(getBot().name)
  end
else
  say("`2OWNER SCRIPT `4NOT FOUND")
  sleep(4000)
end
