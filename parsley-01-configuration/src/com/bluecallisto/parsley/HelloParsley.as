package com.bluecallisto.parsley
{
    import mx.utils.StringUtil;

    public class HelloParsley
    {
        
        private static var count:int = 1;

        [Bindable]
        public var message:String;
        
        public function HelloParsley()
        {
            message = StringUtil.substitute("Hello Parsley World! {0}", count++);
        }
    }
}