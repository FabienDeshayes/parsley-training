package com.bluecallisto.parsley.controller
{
    import com.bluecallisto.parsley.message.TextMessage;
    
    import mx.controls.Alert;
    import mx.events.CloseEvent;
    
    import org.spicefactory.parsley.core.messaging.MessageProcessor;

    public class MessageInterceptor
    {
        
        [Subscribe(objectId="intercepting")]
        public var intercepting:Boolean;
        
        [MessageHandler]
        public function intercept(message:TextMessage, processor:MessageProcessor):void
        {
            if (intercepting)
            {
                processor.suspend();
                
                var listener:Function = function (event:CloseEvent) : void {
                    if (event.detail == Alert.OK) {
                        processor.resume();
                    }  
                    else {
                        processor.cancel();
                    }
                };      
                
                Alert.show("Do you really want to send this message?", "Confirmation", 
                    Alert.OK | Alert.CANCEL, null, listener);
            }
            // else process as normal
        }
        
    }
}