package com.bluecallisto.parsley.message
{
    public class TextMessage
    {
        public function TextMessage(content:String)
        {
            _content = content;
        }
        
        private var _content:String;
        
        public function get content():String
        {
            return _content;
        }
    }
}