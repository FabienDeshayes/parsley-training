package com.bluecallisto.parsley.message
{
    public class OpenApplicationMessage
    {
        public function OpenApplicationMessage(applicationName:String)
        {
            _applicationName = applicationName;
        }
        
        private var _applicationName:String;
        
        public function get applicationName():String
        {
            return _applicationName;
        }
    }
}