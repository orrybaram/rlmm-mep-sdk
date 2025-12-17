# MEP Actionscript SDK

An Actionscript library for integrating with the Map Expansion Plugin and the speedrun.com API.

## Features
- RLMM Analytics API
  - Initialize session
  - Track custom events

- Speedrun.com API
  - Fetch category records for a specific category ID
  - Retrieve user information by user ID
  - Format speedrun times into human-readable strings
  - Event-based response handling

## Installation
### Part 1: Download
[Download the SDK](https://github.com/orrybaram/rlmm-mep-sdk/archive/refs/heads/main.zip)

### Part 2: Flash
Move the downloaded root `com` folder to the directory where you keep your flash files (NOTE: not the publishing directory).
Make sure to add this directory as a source path in Action Script Settings

<img width="451" height="681" alt="action script settings" src="https://github.com/user-attachments/assets/b365313a-d5d5-4430-806e-9736c310081f" />

### Part 3: UDK
The SDK uses `fscommands` to send messages from your flash project to kismet which then in turn make calls to the Map Expansion Plugin.
In order for this to work you'll need to make the following additions in kismet:
![Kismet example](https://github.com/orrybaram/rlmm-mep-sdk/blob/main/examples/kismet-mep-setup.png?raw=true)  
You can copy this code directly here: [Kismet example](examples/src-kismet.md)

## Speedrun.com API Example
This will fetch the world record for a category and then fetch the user's name.

```as
import com.rlmm.mep.src.SpeedRunApi;
import com.rlmm.mep.src.SpeedRunApiEvent;

var playerName:String;
var time:String;

var speedRunApi = new SpeedRunApi({ stage: stage });
speedRunApi.getCategoryRecords('YOUR_CATEGORY_ID');

function onCategoryRecordsResponseReceived(e:SpeedRunApiEvent):void {
    var data = e.payload.data;
    if (data.runs.length > 0) {
        var run = data.runs[0].run;
        var player = run.players[0];
        time = SpeedRunApi.formatTime(run.times.primary_t);
        speedRunApi.getUser(player.id);
    }
}

function onUserResponseReceived(e:SpeedRunApiEvent):void {
    playerName = e.payload.data.names.international;
}


stage.addEventListener(SpeedRunApiEvent.CATEGORY_RECORDS_RESPONSE_RECEIVED, onCategoryRecordsResponseReceived);
stage.addEventListener(SpeedRunApiEvent.USER_RESPONSE_RECEIVED, onUserResponseReceived);
```

## Analytics Example

```as
import com.rlmm.mep.analytics.AnalyticsApi;

var analytics = new AnalyticsApi({ projectId: 'your-project-id', apiKey: 'your-api-key' });

//... somewhere in your code ...
analytics.track('level_completed', {
  deaths: 10,
  time: 42
});
```

## Contributing
This SDK is unfinished and not all endpoints are implemented. Please feel free to contribute to the project!
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.
