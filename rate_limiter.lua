local RateLimiter = {
  buckets = {},
  maxMessages = 5,
  interval = 60,
}

function RateLimiter:isRateLimited(userId)
  local now = os.time()
  local bucket = self.buckets[userId] or {count = 0, reset = now + self.interval}

  if now > bucket.reset then
    bucket.count, bucket.reset = 0, now + self.interval
  end

  bucket.count = bucket.count + 1
  self.buckets[userId] = bucket

  return bucket.count > self.maxMessages
end

return RateLimiter