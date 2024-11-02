package com.rlmm.mep.src {
    import flash.events.Event;

    public class SpeedRunApiEvent extends Event {
        public static const CATEGORY_RECORDS_RESPONSE_RECEIVED = "CATEGORY_RECORDS_RESPONSE_RECEIVED";
        public static const USER_RESPONSE_RECEIVED = "USER_RESPONSE_RECEIVED";
        
        public var payload:Object;

        public function SpeedRunApiEvent(type:String, payload:Object = null, bubbles:Boolean = false, cancelable:Boolean = false) {
            super(type, bubbles, cancelable);
            this.payload = payload;
        }

        override public function clone():Event {
            return new SpeedRunApiEvent(type, payload, bubbles, cancelable);
        }
    }
}