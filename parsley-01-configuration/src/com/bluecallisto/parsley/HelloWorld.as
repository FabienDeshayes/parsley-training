package com.bluecallisto.parsley
{
    public class HelloWorld
    {

        [Bindable]
        public var message:String;
        
        public function HelloWorld()
        {
            message = "Hello Parsley World!";
        }
    }
}