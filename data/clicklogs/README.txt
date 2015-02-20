ClickStream logs format:
timestamp,  user_id,  action,   domain,   campaign_id,  cost,   session

        timestamp : (long) milliseconds since epoch
        user_id : (int)
        action : (string) clicked, viewed, blocked
        domain : (string) where the ad was served
        campaign_id : (int) ad campaign id
        cost : (int) cost to serve this ad
        session : (string) user's session id
