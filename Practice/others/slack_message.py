import json
import requests

slack_token = 'xoxb-my-bot-token' 
slack_channel = '#general'
slack_user_name = 'Thalapathy'
blocks = [{  
  "type": "section",
  "text": {  
    "type": "mrkdwn",
    "text": ":check: The script has run successfully on the dev."
  }
}]


def post_message_to_slack(text, blocks = None):
    return requests.post('https://slack.com/api/chat.postMessage', {
        'token': slack_token,
        'channel': slack_channel,
        'text': text,
        'username': slack_user_name,
        'blocks': json.dumps(blocks) if blocks else None
    }).json()

print(post_message_to_slack("Hello channel",blocks))	