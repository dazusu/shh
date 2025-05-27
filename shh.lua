_addon.name      = 'shh';
_addon.author    = 'Dazusu';
_addon.version   = '1.0.0.0';

local json = require("dkjson")
local spamDetector = require("spam_detector")
local logger = require("spam_logger")
local rateLimiter = require("rate_limiter")
packets = require('packets')


-- Function to extract username from chat messages
function extractUsername(chatMessage)
    -- Pattern matches: optional [HH:MM:SS], followed by username, then location in brackets
    local username = chatMessage:match("^%[%d%d:%d%d:%d%d%]%s+(.-)%[") -- with timestamp
                      or chatMessage:match("^([^%[]+)%[") -- fallback without timestamp

    return username and username:match("^%s*(.-)%s*$") -- trim whitespace
end


windower.register_event('incoming chunk', function(id,data)
    if id == 0x017 then
        local chat = packets.parse('incoming', data)
        if chat['Mode'] == 26 then
            local msg = windower.convert_auto_trans(chat['Message']):lower()
            local player = chat['Sender Name']
            local analysis = spamDetector.analyze(player, msg)
            --local a = string.format("User: %s | Spam: %s (%d%%)", player, analysis.isSpam and "YES" or "NO", analysis.score)
            --print(chat.header(addon.name):append(chat.message(a)))
            --logger:log(player, msg, analysis)
            if (analysis.isSpam) then
                logger:log(player, msg, analysis)
                return true
            else
                logger:logham(player, msg, analysis)
            end
        end
    end
end)
