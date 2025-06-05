package com.rlmm.mep.analytics {
    import flash.system.fscommand;
    import flash.external.ExternalInterface;
    import flash.events.EventDispatcher;
    import com.adobe.serialization.json.JSON;
    import flash.utils.setTimeout;

    public class AnalyticsApi  {
        public function AnalyticsApi(config: Object) {
            setTimeout(function() {
                fscommand("SET_MEP_COMMAND", "analytics trackinit " + config.projectId + " " + config.apiKey);
            }, 1000);
            
            ExternalInterface.addCallback("track", track);
        }

        public function track(eventName:String, properties:Object = null):void {
            var trackData:Object = {
                name: eventName,
                params: properties || {}
            };
            
            fscommand("SET_MEP_COMMAND", "analytics trackevent " + JSON.encode(trackData));
        }
    }
}
