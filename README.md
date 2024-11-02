# MEP Actionscript SDK

An Actionscript library for integrating with the Map Expansion Plugin and the speedrun.com API.

## Features

- Fetch category records for a specific category ID
- Retrieve user information by user ID
- Format speedrun times into human-readable strings
- Event-based response handling

## Installation
Download the SDK and add the `com` folder to the root directory where you keep your flash files..


## Simple Example
This will fetch the world record for a category and then fetch the user's name.

```as
import com.rlmm.mep.src.SpeedRunApi;
import com.rlmm.mep.src.SpeedRunApiEvent;

var playerName:String;
var time:String;

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

## Kismet Example
See the [Kismet example](examples/src-kismet.md) for a more detailed example of how to use the SDK with Kismet.
![Kismet example](https://github.com/orrybaram/rlmm-mep-sdk/blob/main/examples/kismet-mep-setup.png?raw=true)

## Contributing
This SDK is unfinished and not all endpoints are implemented. Please feel free to contribute to the project!
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.
