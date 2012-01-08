package com.bluecallisto.parsley.event
{
    import flash.events.Event;
    
    public class TextEvent extends Event
    {
        
        public static const TEXT_SENT:String = "textSent";
        
        public function TextEvent(content:String)
        {
            super(TEXT_SENT);
            _content = content;
        }
        
        private var _content:String;
        
        public function get content():String
        {
            return _content;
        }
        
        override public function clone():Event
        {
            return new TextEvent(_content);
        }
    }
}