local json = require("dkjson") -- Ensure Lua JSON library is installed

local Logger = { 
  logFile = "C:\\spam_detection_spam.json",
  logFileChat = "C:\\spam_detection_ham.json"
 }

function Logger:log(userId, msg, analysis)

  local entry = {
    timestamp = os.date("%Y-%m-%d %H:%M:%S"),
    userId = userId,
    message = msg,
    isSpam = analysis.isSpam,
    score = analysis.score,
    reasons = analysis.reasons
  }

  local file = io.open(self.logFile, "a")
  if file then
    file:write(json.encode(entry) .. ",\n")
    file:close()
  end
end

function Logger:logham(userId, msg, analysis)

  local entry = {
    timestamp = os.date("%Y-%m-%d %H:%M:%S"),
    userId = userId,
    message = msg,
    isSpam = analysis.isSpam,
    score = analysis.score,
    reasons = analysis.reasons
  }

  local file = io.open(self.logFileChat, "a")
  if file then
    file:write(json.encode(entry) .. ",\n")
    file:close()
  end
end

return Logger