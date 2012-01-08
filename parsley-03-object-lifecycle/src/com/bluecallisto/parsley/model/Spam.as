package com.bluecallisto.parsley.model
{
    import flash.events.Event;
    import flash.events.EventDispatcher;
    
    import mx.collections.ArrayCollection;
    import mx.collections.IList;

    [AsyncInit]
    public class Spam extends EventDispatcher implements IEmailFolder
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
                {date: new Date(2011, 10, 11), title: "Enlarge your Parsley", sender: "xxx@abc.com"},
                {date: new Date(2011, 10, 13), title: "You just won a prize!", sender: "yyy@def.com"},
                {date: new Date(2011, 10, 14), title: "Win a holiday trip", sender: "ccc@fly.com"},
                {date: new Date(2011, 10, 15), title: "Free Flex For All", sender: "zzz@ghi.com"}
            ]);

        }
    }
}