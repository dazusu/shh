-- spam_rules_FIXED_20250520.lua
-- Created at: 2025-05-20 22:40:00 UTC (User: dazusu)
-- Based on test results showing simpler patterns are more reliable

return {
  -- Legitimate Party Formation - Negative Rules
  {pattern = "looking for members%.", weight = -30, reason = "Legitimate group formation"},
  {pattern = "linkshell", weight = -30, reason = "Legitimate group formation"},
  {pattern = "you can have this%.", weight = -30, reason = "Legitimate buyer"},
  {pattern = "reward", weight = -30, reason = "Legitimate buyer"},
  {pattern = "can i have it", weight = -50, reason = "Legitimate buyer"},
  {pattern = "interested%.", weight = -70, reason = "Legitimate buyer"},
  {pattern = "sell", weight = -30, reason = "Legitimate buyer"},
  {pattern = "looking for party", weight = -30, reason = "Legitimate group formation"},
  {pattern = "lfg", weight = -30, reason = "Looking for group"},
  {pattern = "lf%d*m", weight = -30, reason = "Looking for members"}, -- Matches lfm, lf1m, lf3m, etc.
  {pattern = "sell%?", weight = -30, reason = "Legitimate selling question"},
  {pattern = "team up%?", weight = -30, reason = "Legitimate team invitation"},
  {pattern = "venus orb", weight = -35, reason = "Legitimate seller"},
  {pattern = "mars orb", weight = -35, reason = "Legitimate seller"},
  {pattern = "card", weight = -35, reason = "Specific jobs"},
  {pattern = "whm", weight = -35, reason = "Specific jobs - WHM"},
  {pattern = "pld", weight = -35, reason = "Specific jobs - PLD"},
  {pattern = "tank", weight = -35, reason = "Specific jobs - Tank"},
  {pattern = "cor", weight = -35, reason = "Specific jobs - COR"},
  {pattern = "brd", weight = -35, reason = "Specific jobs - BRD"},
  {pattern = "geo", weight = -35, reason = "Specific jobs - GEO"},
  {pattern = "dd", weight = -35, reason = "Damage dealers"},
  {pattern = "ddx2", weight = -35, reason = "Damage dealers x2"},
  {pattern = "ddx3", weight = -35, reason = "Damager dealers x3"},
  {pattern = "pool", weight = -35, reason = "Hot sales"},
  {pattern = "buying", weight = -65, reason = "Leigimat buyer"},
  {pattern = "in pool now", weight = -35, reason = "Hot sales"},
  {pattern = "please assist", weight = -35, reason = "Hot sales"},
  {pattern = "nyzul isle", weight = -25, reason = "Legitimate dungeon content"},
  {pattern = "token farm", weight = -15, reason = "Legitimate farming activity"},
  {pattern = "@%d+/%d+", weight = -30, reason = "Party size indicator"},
  {pattern = " %d+/%d+ ", weight = -20, reason = "Party size indicator with spaces"},
  {pattern = "interest%?", weight = -10, reason = "Legitimate question"},
  {pattern = "yughott grotto", weight = -50, reason = "Legitimate seller"},
  {pattern = "horlais peak", weight = -50, reason = "Legitimate seller"},
  {pattern = "waughroon shrine", weight = -50, reason = "Legitimate seller"},
  {pattern = "balga's dais", weight = -50, reason = "Legitimate seller"},


  -- Strong Spam Characters / Mojibake
  {pattern = "[œƒš]", weight = 40, reason = "Suspicious unicode character (œ, ƒ, š)"},
  {pattern = "%?%?%?%?+", weight = 40, reason = "Excessive question marks (>=4)"},
  {pattern = "lv%d+%s+%d+%s+%d+", weight = 15, reason = "Multiple level numbers (powerleveling/boosting context)"},
  {pattern = "weapon%s*shop", weight = 35, reason = "Phrase 'weapon shop' (RMT context)"},

  -- Core Spam Actions & Keywords
  {pattern = "[Bb]uy%??", weight = 35, reason = "Keyword 'buy?'"},
  {pattern = "/tell", weight = 10, reason = "Command '/tell'"},
  {pattern = "tell$", weight = 10, reason = "Word 'tell' at end of message"},
  {pattern = "[Bb]uy%??%s*tell", weight = 40, reason = "'buy?tell' combination"},
  {pattern = "[Dd]o you need it%??", weight = 15, reason = "Phrase 'do you need it?'"},
  {pattern = "/t%s", weight = 10, reason = "Command '/t' (tell shortcut)"},

  -- Currency and Pricing
  {pattern = "%d+%.?%d*[mMkK][iI]?[lL]?%??", weight = 25, reason = "Currency amount (e.g., 20m, 10k+, 120k)"},
  {pattern = "%d+[Mm]/run", weight = 35, reason = "Price per run (e.g., 1m/run)"},
  {pattern = "%d+%-%d+%s*%d+[mMkK]", weight = 30, reason = "Range Price (e.g., 0-20 8m)"},
  {pattern = "%d+[Hh]/%d+[mMkK]", weight = 30, reason = "Time per currency (e.g., 12h/8m)"},
  {pattern = "%d+[Hh]%s*=%s*%d+[mMkK]", weight = 35, reason = "Time equals currency (e.g., 1h=120k)"},
  {pattern = "[Mm][Ll]%d+%-%d+/%d+[mMkK]", weight = 30, reason = "ML Range per currency (e.g., ml0-20/10m)"},
  {pattern = "%d+[Pp]/%d+[mMkK]", weight = 30, reason = "NumberP per currency (e.g., 500p/3m)"},
  {pattern = "%d%d+/%d+", weight = 20, reason = "Simple X/Y ratio (e.g., 500/3, 2100/12)"},
  {pattern = "%d+%-%d+/%d+", weight = 50, reason = "Range over value pricing (e.g., 0-20/8)"},
  -- Rule for simple X-Y numeric ranges
  {pattern = "%d+%-%d+", weight = 20, reason = "Numeric range X-Y (e.g., 122-145)"},

  -- Odyssey Specifics - SIMPLIFIED PATTERNS
  {pattern = "[Oo]dyssey", weight = 15, reason = "Keyword 'odyssey'"},
  {pattern = "[Uu][Nn][Mm]~%d+", weight = 30, reason = "'UNM~level' format (e.g. UNM~135)"},
  {pattern = "[Ss]egment%s*[Uu][Nn][Mm]", weight = 25, reason = "'segment UNM' combination"},
  {pattern = "[Ss]eg%d*[kK]%+", weight = 20, reason = "Keyword 'seg' with numbers (e.g., seg10k+)"},
  {pattern = "[Ss]eg/%d*[kK]%+", weight = 20, reason = "Keyword 'seg/' with numbers (e.g., seg/10k+)"},
  {pattern = "[Oo]dyboss", weight = 20, reason = "Keyword 'odyboss'"},

  -- Tier/Version Spam - FIXED PATTERNS
  {pattern = "[Tt]%d+[-%s][Tt]%d+", weight = 20, reason = "Tier sequence (e.g., t1-t4, t1-t2-t3)"},
  {pattern = "[Vv]%d+%-[Vv]?%d+", weight = 20, reason = "Version/Level range (e.g. v0-v25 or v0-25)"},
  {pattern = "[Tt]%d+[%-%s]?%d*~[Vv]%d+[%-%s]?%d+", weight=30, reason="Tiers ~ Version range"},
  {pattern = "[Tt]%d+/[Vv]%d+", weight = 20, reason = "Tier/Version (e.g., t1-t2/v0-v25)"},

  -- Aeonic & Service Spam
  {pattern = "[Aa]eonic", weight = 10, reason = "Keyword 'aeonic'"},
  {pattern = "Clear Mind", weight=15, reason="Phrase 'Clear Mind'"},
  {pattern = "%d+%.?%d*[Hh][Rr]?", weight = 20, reason = "Time duration with h or hr (e.g., 3.5h)"},
  {pattern = "%d+%s*spot", weight=20, reason="Number of spots (e.g. 4spot)"},
  {pattern = "[Aa]mbuscade", weight = 10, reason = "Keyword 'ambuscade'"},

  -- Keywords/Phrases - SIMPLIFIED
  {pattern = "[Ee]scha%s*-%s*[Zz]i'[Tt]ah", weight=15, reason="Phrase 'Escha - Zi'Tah'"},
  {pattern = "[Ee]scha%s*-%s*[Rr]u'[Aa]un", weight=15, reason="Phrase 'Escha - Ru'Aun'"},
  {pattern = "[Rr]eisenjima", weight = 15, reason = "Keyword 'reisenjima'"},
  {pattern = "[Pp]ulse%s*[Ff]arm", weight = 25, reason = "Phrase 'pulse farm'"},
  {pattern = "[Aa]bj", weight = 15, reason = "Keyword 'abj' (abjuration)"},
  {pattern = "[Cc][Oo][Dd]", weight = 10, reason = "Keyword 'cod' (Cash on Delivery)"},
  {pattern = "[Uu][Cc]", weight = 10, reason = "Keyword 'uc' (Unity Concord)"},
  {pattern = "[Pp]ay%s*lat[e%a]+%s*[Ww]in", weight = 25, reason = "Phrase 'pay later/late win'"},
  {pattern = "[Aa]utoinv", weight = 20, reason = "Keyword 'autoinv'"},
  {pattern = "master trials", weight=10, reason="Phrase 'master trials'"},
  {pattern = "[Rr][Pp]", weight = 5, reason = "Keyword 'rp'"},
  {pattern = "[Ss]ortie", weight = 5, reason = "Keyword 'sortie'"},
  {pattern = "[Bb]umba", weight = 10, reason = "Keyword 'bumba'"},
  {pattern = "[Dd]ynamis", weight = 5, reason = "Keyword 'dynamis'"},
  {pattern = "[Ii]tem%s", weight = 10, reason = "Keyword 'item'"},
  {pattern = "[Hh][Tt][Mm][Bb]", weight = 10, reason = "Keyword 'htmb'"},
  {pattern = "[Dd]ydw3clear", weight = 15, reason = "Keyword 'dydw3clear'"},
  {pattern = "tvr last boss", weight=15, reason="Phrase 'tvr last boss'"},
  {pattern = "merit points", weight=15, reason="Phrase 'merit points'"},
  {pattern = "escha beads", weight=10, reason="Phrase 'escha beads'"},
  {pattern = "[Ee]xp", weight = 10, reason = "Keyword 'exp'"},
  {pattern = "fast cast", weight = 5, reason = "Phrase 'fast cast'"},
  {pattern = "all/bc", weight=10, reason = "Phrase 'all/bc'"},
  {pattern = "all/unity", weight=10, reason = "Phrase 'all/unity'"},
  {pattern = "team up%?", weight=-5, reason = "Phrase 'team up?'"},

  -- Items (low weight, as they can be legit)
  {pattern = "reiki yotai", weight = 5, reason = "Item 'reiki yotai'"},
  {pattern = "telos earring", weight = 5, reason = "Item 'telos earring'"},

  -- Misc patterns
  {pattern = "%d+/%s*amp", weight=15, reason="Number / amp (e.g. 2386/amp)"},
  {pattern = "[Vv][Dd]", weight=10, reason="Keyword 'vd'"},

  -- Enhanced Character Detection
  {pattern = "[%?][%?]+", weight = 30, reason = "Multiple unreadable characters"}, 
  {pattern = "[%?][^%?]*[%?][^%?]*[%?]", weight = 35, reason = "Multiple unreadable characters scattered in text"},

  -- Promotional Patterns
  {pattern = "save [\"']%w+[\"']", weight = 50, reason = "Discount code pattern"},
  {pattern = "for more", weight = 15, reason = "Promotional phrase"},

  -- Fast/Quick Offers (common in spam)
  {pattern = "fast %w+!", weight = 25, reason = "Fast offer promotion"},

  -- Excessive Punctuation
  {pattern = "![^!]*!", weight = 15, reason = "Multiple exclamation points"}
}