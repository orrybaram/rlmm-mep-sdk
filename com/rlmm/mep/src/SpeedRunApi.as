package com.rlmm.mep.src {
    import flash.system.fscommand;
    import flash.external.ExternalInterface;
    import flash.events.EventDispatcher;
    import flash.events.Event;
    import com.rlmm.mep.src.SpeedRunApiEvent;
    import com.adobe.serialization.json.JSON;

    public class SpeedRunApi extends EventDispatcher {
        private var ctx: Object;

        public function SpeedRunApi(_ctx: Object) {
            ctx = _ctx;
            ExternalInterface.addCallback("MEPOutputEvent", onResponse);
        }

        public function getCategoryRecords(categoryId:String):void {
            fscommand("SET_MEP_COMMAND", "speedrun get categories/" + categoryId + "/records");
        }

        public function getUser(userId:String):void {
            fscommand("SET_MEP_COMMAND", "speedrun get users/" + userId);
        }

        private function onResponse(response:String):void {
            var res = JSON.decode(response);
            var source = res.source;
            
            if (source.match(/categories\/[^\/]+\/records/)) {
                ctx.stage.dispatchEvent(new SpeedRunApiEvent(SpeedRunApiEvent.CATEGORY_RECORDS_RESPONSE_RECEIVED, { data: res.data[0] }));
                return;
            }

            if (source.match(/users\/[^\/]+/)) {
                ctx.stage.dispatchEvent(new SpeedRunApiEvent(SpeedRunApiEvent.USER_RESPONSE_RECEIVED, { data: res.data }));
                return;
            }
        }

        static public function formatTime(timeInSeconds:Number):String {
            var hours = Math.floor(timeInSeconds / 3600);
            timeInSeconds = timeInSeconds % 3600;
            var minutes = Math.floor(timeInSeconds / 60);
            var seconds = Math.floor(timeInSeconds % 60); 
            var milliseconds = Math.floor((timeInSeconds % 1) * 1000);
            
            // Pad with leading zeros
            minutes = minutes < 10 ? "0" + minutes : minutes;
            seconds = seconds < 10 ? "0" + seconds : seconds;
            milliseconds = milliseconds < 100 ? (milliseconds < 10 ? "00" + milliseconds : "0" + milliseconds) : milliseconds;

            if (hours > 0) {    
                return hours + ':' + minutes + ':' + seconds + '.' + milliseconds;
            }

            return minutes + ':' + seconds + '.' + milliseconds;
        }
    }
}