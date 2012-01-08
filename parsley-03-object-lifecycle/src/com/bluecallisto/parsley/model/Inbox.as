package com.bluecallisto.parsley.model
{
    import flash.events.Event;
    import flash.events.EventDispatcher;
    
    import mx.collections.ArrayCollection;
    import mx.collections.IList;

    [AsyncInit]
    public class Inbox extends EventDispatcher implements IEmailFolder
    {
        private var _messages:IList;
        
        public function get messages():IList
        {
            return _messages;
        }
        
        [Init]
        public function init():void
        {
            fetchMessages();
            // pretend to wait
            dispatchEvent(new Event(Event.COMPLETE));
        }
        
        /**
         * Asynchronous function to get the messages 
         * 
         */
        public function fetchMessages():void
        {
            _messages = new ArrayCollection([
                {date: new Date(2011, 10, 21), title: "Friday evening", sender: "john@bluecallisto.com"},
                {date: new Date(2011, 10, 23), title: "Slides for the presentation", sender: "paul@bluecallisto.com"},
                {date: new Date(2011, 10, 25), title: "Re: Friday evening", sender: "fabien@bluecallisto.com"}
                ]);
        }
        
        
    }
}