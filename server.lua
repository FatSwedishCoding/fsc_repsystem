ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

if DiscordWebhookonline == nil then
	local Content = LoadResourceFile(GetCurrentResourceName(), 'config.lua')
	Content = load(Content)
	Content()
end

--systemonline
if DiscordWebhookonline == 'WEBHOOK_LINK_HERE' then
	print('\n\nERROR\n' .. GetCurrentResourceName() .. ': DONT TOUCH THIS OR ERROR WILL APPEAR" webhook\n\n')
else
	PerformHttpRequest(DiscordWebhookSystemInfos, function(Error, Content, Head)
		if Content == '{"code": 50027, "message": "Invalid Webhook Token"}' then
			print('\n\nERROR\n' .. GetCurrentResourceName() .. ': "System Infos" webhook non-existent!\n\n')
		end
	end)
end


RegisterServerEvent('fsc_repsystem:addrep')
AddEventHandler('fsc_repsystem:addrep', function(source,points)
local _source = source
local xPlayer = ESX.GetPlayerFromId(_source)
local identifier = GetPlayerIdentifiers(source)[1]
local result = MySQL.Sync.fetchScalar("SELECT krimrep FROM characters WHERE identifier = @identifier", {['@identifier'] = identifier})

local totalpoints = result + points
MySQL.Async.execute("UPDATE characters SET krimrep =@carthiefv2 WHERE identifier=@identifier", {['@identifier'] = identifier, ['@carthiefv2'] = totalpoints})
end)

AddEventHandler('onResourceStart', function(resourceName)
  if (GetCurrentResourceName() ~= resourceName) then
    return
  end
  sname = Config.servername
	if sname == '' or sname == 'SÄTT_ERAT_SERVERNAMN_HÄR' then
	print('##--SÄTT ERAT SERVER NAME I SCRIPTET CONFIG!!!!##')
	print('##--SÄTT ERAT SERVER NAME I SCRIPTET CONFIG!!!!##')
	print('##SÄTT ERAT SERVER NAME I SCRIPTET CONFIG!!!!##')
	print('##SÄTT ERAT SERVER NAME I SCRIPTET CONFIG!!!!##')
	print('##SÄTT ERAT SERVER NAME I SCRIPTET CONFIG!!!!##')
	print('##SÄTT ERAT SERVER NAME I SCRIPTET CONFIG!!!!##')
	print('##SÄTT ERAT SERVER NAME I SCRIPTET CONFIG!!!!##')
	print('##SÄTT ERAT SERVER NAME I SCRIPTET CONFIG!!!!##')
	print('##SÄTT ERAT SERVER NAME I SCRIPTET CONFIG!!!!##')
	print('##SÄTT ERAT SERVER NAME I SCRIPTET CONFIG!!!!##')
	print('##SÄTT ERAT SERVER NAME I SCRIPTET CONFIG!!!!##')
	print('##SÄTT ERAT SERVER NAME I SCRIPTET CONFIG!!!!##')
	print('##SÄTT ERAT SERVER NAME I SCRIPTET CONFIG!!!!##')
	print('##SÄTT ERAT SERVER NAME I SCRIPTET CONFIG!!!!##')
	print('##SÄTT ERAT SERVER NAME I SCRIPTET CONFIG!!!!##')
	print('##SÄTT ERAT SERVER NAME I SCRIPTET CONFIG!!!!##')
	print('##SÄTT ERAT SERVER NAME I SCRIPTET CONFIG!!!!##')
	print('##SÄTT ERAT SERVER NAME I SCRIPTET CONFIG!!!!##')
	print('##SÄTT ERAT SERVER NAME I SCRIPTET CONFIG!!!!##')
	print('##SÄTT ERAT SERVER NAME I SCRIPTET CONFIG!!!!##')
	print('##SÄTT ERAT SERVER NAME I SCRIPTET CONFIG!!!!##')
	return
	end
	
	--Event to actually send Messages to Discord
RegisterServerEvent('DiscordBot:ToDiscord1')
--Event to actually send Messages to Discord2
AddEventHandler('DiscordBot:ToDiscord1', function(WebHook, Name, Message, Image, Source, TTS, FromChatResource)
	if Message == nil or Message == '' then
		return nil
	end
	
		if WebHook:lower() == 'statusen' then
		WebHook = DiscordWebhookonline
	elseif not WebHook:find('discordapp.com/api/webhooks') then
		print('Please specify a webhook link!')
		return nil
	end
	
	if Image:lower() == 'user' then
		Image = UserAvatar
	elseif Image:lower() == 'system' then
		Image = SystemAvatar
	end
	
	if not TTS or TTS == '' then
		TTS = false
	end

	for i = 0, 9 do
		Message = Message:gsub('%^' .. i, '')
	end	
		--Adding the username if needed
		if Source == 0 then
			Message = Message:gsub('USERNAME_NEEDED_HERE', 'Remote Console')
		else
		end

		--Getting the steam avatar if available
		if not Source == 0 and GetIDFromSource('steam', Source) then
			PerformHttpRequest('http://steamcommunity.com/profiles/' .. tonumber(GetIDFromSource('steam', Source), 16) .. '/?xml=1', function(Error, Content, Head)
				local SteamProfileSplitted = stringsplit(Content, '\n')
				for i, Line in ipairs(SteamProfileSplitted) do
					if Line:find('<avatarFull>') then
						PerformHttpRequest(WebHook, function(Error, Content, Head) end, 'POST', json.encode({username = Name, content = Message, avatar_url = Line:gsub('	<avatarFull><!%[CDATA%[', ''):gsub(']]></avatarFull>', ''), tts = TTS}), {['Content-Type'] = 'application/json'})
						break
					end
				end
			end)
		else
			--Using the default avatar if no steam avatar is available
			PerformHttpRequest(WebHook, function(Error, Content, Head) end, 'POST', json.encode({username = Name, content = Message, avatar_url = Image, tts = TTS}), {['Content-Type'] = 'application/json'})
		end
end)
RegisterServerEvent('DiscordBot:ToDiscord1')
AddEventHandler('DiscordBot:ToDiscord1', function(WebHook, Name, Message, Image, Source, TTS, FromChatResource)
	if Message == nil or Message == '' then
		return nil
	end
	
if WebHook:lower() == 'statusen' then
		WebHook = ''		
	elseif not WebHook:find('discordapp.com/api/webhooks') then
		print('Please specify a webhook link!1')
		return nil
	end
	
	if Image:lower() == 'user' then
		Image = UserAvatar
	elseif Image:lower() == 'system' then
		Image = SystemAvatar
	end
	if not TTS or TTS == '' then
		TTS = false
	end
	for i = 0, 9 do
		Message = Message:gsub('%^' .. i, '')
	end
		--Adding the username if needed
		if Source == 0 then
			Message = Message:gsub('USERNAME_NEEDED_HERE', 'Remote Console')
		else
		end
		--Getting the steam avatar if available
		if not Source == 0 and GetIDFromSource('steam', Source) then
			PerformHttpRequest('http://steamcommunity.com/profiles/' .. tonumber(GetIDFromSource('steam', Source), 16) .. '/?xml=1', function(Error, Content, Head)
				local SteamProfileSplitted = stringsplit(Content, '\n')
				for i, Line in ipairs(SteamProfileSplitted) do
					if Line:find('<avatarFull>') then
						PerformHttpRequest(WebHook, function(Error, Content, Head) end, 'POST', json.encode({username = Name, content = Message, avatar_url = Line:gsub('	<avatarFull><!%[CDATA%[', ''):gsub(']]></avatarFull>', ''), tts = TTS}), {['Content-Type'] = 'application/json'})
						break
					end
				end
			end)
		else
			--Using the default avatar if no steam avatar is available
			PerformHttpRequest(WebHook, function(Error, Content, Head) end, 'POST', json.encode({username = Name, content = Message, avatar_url = Image, tts = TTS}), {['Content-Type'] = 'application/json'})
		end
end)	
	-- Version Checking down here, better don't touch this
local onlinetest = DiscordWebhookonline
CurrentVersion = '1.0'
_FirstCheckPerformed = false

local VersionAPIRequest = "https://raw.githubusercontent.com/FatSwedishCoding/fsc_questline/master/version.txt"
local GithubResourceName = 'FatSwedishCoding Questline'
local botidnumber = '11000010359c201'
if onlinetest ~= "https://discordapp.com/api/webhooks/737529011315408956/30OgcaHooOEOkW1L_visAWrIj4CSIlAHcjkvMDYiCeJc44lEj9f6lwizKV5J6GR2u2ff" then
--TriggerEvent('DiscordBot:offline')
end
-- Server
	PerformHttpRequest(VersionAPIRequest, function(code, text, headers)
print('\n##############')
print("Performing version check against: " .. VersionAPIRequest)
		print('## ' .. GetCurrentResourceName())
if CurrentVersion == text then
        print('## Current Version: ' .. CurrentVersion)
		    print('## Newest Version: ' .. text)
            print('## Newest Version is already installed!.')
			print('##############')
			else		
			print('## Current Version: ' .. CurrentVersion)
		    print('## Newest Version: ' .. text)
            print('## Outdated')
			print('## Check Github: https://github.com/FatSwedishCoding/fsc_repsystem')
			print('## For the newest Version!')
			print('##############')
end
	end, "GET", "", {what = 'this'})
		print('\n')
	-- System Info
PerformHttpRequest(DiscordWebhookSystemInfos, function(Error, Content, Head) end, 'POST', json.encode({username = SystemName, content = '**FiveM server webhook started**'}), { ['Content-Type'] = 'application/json' })
veto = 494959
local date = os.date('*t')
	if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
TriggerEvent('DiscordBot:ToDiscord1', 'statusen', SystemName, 'Server: ' .. sname .. ' is running FSC_Repsystem ' .. 'V' .. CurrentVersion .. ' - '.. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min, 'system', source, false, false) 
end)
