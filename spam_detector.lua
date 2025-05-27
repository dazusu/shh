local spam_rules = require("spam_rules")
local UserHistory = require("user_history")

local SpamDetector = {}

print("Rules loaded successfully. Number of rules: " .. #spam_rules)

function SpamDetector.analyze(userId, msg)
  local spamScore, reasons = 0, {}
  local msgLower = msg:lower()

  for _, rule in ipairs(spam_rules) do
    if msgLower:find(rule.pattern:lower()) then
      spamScore = spamScore + rule.weight
      table.insert(reasons, rule.reason)
    end
  end

  spamScore = spamScore + UserHistory:getPenalty(userId) --math.min(spamScore + UserHistory:getPenalty(userId), 100)

  local result = {
    score = spamScore,
    isSpam = spamScore >= 50,
    reasons = reasons,
  }

  UserHistory:recordSpam(userId, result.isSpam)

  return result
end

return SpamDetector