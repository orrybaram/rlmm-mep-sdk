package com.rlmm.mep.analytics {
    import flash.system.fscommand;
    import flash.external.ExternalInterface;
    import flash.events.EventDispatcher;

    public class AnalyticsApi  {
        public function AnalyticsApi(config: Object) {
            fscommand("SET_MEP_COMMAND", "analytics trackinit " + config.apiKey);
    
            ExternalInterface.addCallback("track", track);
        }

        public function track(eventName:String, properties:Object = null):void {
            var trackData:Object = {
                event: eventName,
                properties: properties || {}
            };
            
            fscommand("SET_MEP_COMMAND", "analytics trackevent " + JSON.stringify(trackData));
        }
    }
}