package com.bluecallisto.parsley.model
{
    import com.bluecallisto.parsley.message.GlobalRefreshMessage;
    import com.bluecallisto.parsley.message.LocalRefreshMessage;
    import com.bluecallisto.parsley.message.WindowRefreshMessage;

    public class TreeNodePM
    {
        protected static const LOADING:String = "loading";
        protected static const DEFAULT:String = "default";
        
        [MessageDispatcher]
        public var dispatcher:Function;
        
        [Bindable]
        public var viewState:String = DEFAULT;
        
        [MessageHandler(scope="local")]
        public function onLocalRefresh(message:LocalRefreshMessage):void
        {
            refresh();
        }
        
        [MessageHandler(scope="global")]
        public function onGlobalRefresh(message:GlobalRefreshMessage):void
        {
            refresh();
        }
        
        public function askForRefresh(scope:String):void
        {
            var message:Object;
            
            switch (scope)
            {
                case "global":
                    message = new GlobalRefreshMessage();
                    break;
                
                case "custom":
                    message = new WindowRefreshMessage();
                    break;
                
                case "local":
                default:
                    message = new LocalRefreshMessage();
                    break;
            }
            
            if (message)
            {
                dispatcher(message);
            }
        }
        
        public function viewRefreshed():void
        {
            viewState = DEFAULT;
        }
        
        protected function refresh():void
        {
            viewState = LOADING;
        }
        
    }
}