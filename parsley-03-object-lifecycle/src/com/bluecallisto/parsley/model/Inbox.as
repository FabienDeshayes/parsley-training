package com.bluecallisto.parsley.model
{
    import mx.collections.ArrayCollection;
    import mx.collections.IList;

    public class Inbox implements IEmailFolder
    {
        private var _messages:IList;
        
        public function get messages():IList
        {
            return _messages;
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