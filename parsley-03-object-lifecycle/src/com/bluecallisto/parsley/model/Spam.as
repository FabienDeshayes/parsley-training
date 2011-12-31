package com.bluecallisto.parsley.model
{
    import mx.collections.ArrayCollection;
    import mx.collections.IList;

    public class Spam implements IEmailFolder
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
                {date: new Date(2011, 10, 11), title: "Enlarge your Parsley", sender: "xxx@abc.com"},
                {date: new Date(2011, 10, 13), title: "You just won a prize!", sender: "yyy@def.com"},
                {date: new Date(2011, 10, 15), title: "Free Flex For All", sender: "zzz@ghi.com"}
            ]);

        }
    }
}