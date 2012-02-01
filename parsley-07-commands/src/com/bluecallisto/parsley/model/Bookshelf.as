package com.bluecallisto.parsley.model
{
    import com.bluecallisto.parsley.message.LoadBooksMessage;
    
    import mx.collections.IList;

    public class Bookshelf
    {
        
        [MessageDispatcher]
        public var dispatcher:Function;
        
        [Bindable]
        public var books:IList;
        
        [Init]
        public function init():void
        {
            dispatcher(new LoadBooksMessage());
        }
        
        
    }
}