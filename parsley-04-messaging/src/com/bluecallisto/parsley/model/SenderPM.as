package com.bluecallisto.parsley.model
{
    import com.bluecallisto.parsley.event.TextEvent;
    import com.bluecallisto.parsley.message.TextMessage;
    
    import flash.events.EventDispatcher;

    [Event(name="textSent", type="com.bluecallisto.parsley.event.TextEvent")]
    
    [ManagedEvents("textSent")]
    public class SenderPM extends EventDispatcher
    {
        
        [Publish(objectId="intercepting")]
        [Bindable]
        public var intercepting:Boolean;
        
        [MessageDispatcher]
        public var dispatcher:Function;
        
        public function sendMessage(content:String):void
        {
            dispatcher(new TextMessage(content));
        }
        
        public function sendEvent(content:String):void
        {
            dispatchEvent(new TextEvent(content));
        }
        
    }
}