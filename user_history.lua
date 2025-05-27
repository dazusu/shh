local json = require("dkjson")
local DATA_FILE = "../addons/shh/UserHistoryData.json"

local UserHistory = {
  users = {},
  penaltyPerSpam = 5,
}

-- Load user history from disk
local function loadFromDisk()
  local file = io.open(DATA_FILE, "r")
  if file then
    local content = file:read("*a")
    file:close()
    if content and #content > 0 then
      local data, _, err = json.decode(content)
      if data and type(data) == "table" then
        UserHistory.users = data
      end
    end
  end
end

-- Save user history to disk
local function saveToDisk()
  local file = io.open(DATA_FILE, "w")
  if file then
    file:write(json.encode(UserHistory.users, { indent = true }))
    file:close()
  end
end

function UserHistory:getPenalty(userId)
  return (self.users[userId] or 0) * self.penaltyPerSpam
end

function UserHistory:recordSpam(userId, isSpam)
  if isSpam then
    self.users[userId] = (self.users[userId] or 0) + 1
    saveToDisk()
  end
end

-- Load history on module load
loadFromDisk()

return UserHistory







-- local UserHistory = {
--   users = {},
--   penaltyPerSpam = 10,
-- }

-- function UserHistory:getPenalty(userId)
--   return (self.users[userId] or 0) * self.penaltyPerSpam
-- end

-- function UserHistory:recordSpam(userId, isSpam)
--   if isSpam then
--     self.users[userId] = (self.users[userId] or 0) + 1
--   end
-- end

-- return UserHistory