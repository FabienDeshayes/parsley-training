package com.bluecallisto.parsley.model
{
    import com.bluecallisto.parsley.event.TextEvent;
    import com.bluecallisto.parsley.message.TextMessage;
    
    import mx.utils.StringUtil;

    public class ReceiverPM
    {
        
        [Bindable]
        public var displayedText:String = "";
        
        [MessageHandler]
        public function textMessageReceived(message:TextMessage):void
        {
            displayedText += StringUtil.substitute("Message: {0}\n", message.content);
        }
        
        [MessageHandler]
        public function textEventReceived(event:TextEvent):void
        {
            displayedText += StringUtil.substitute("Event: {0}\n", event.content);
        }
        
    }
}