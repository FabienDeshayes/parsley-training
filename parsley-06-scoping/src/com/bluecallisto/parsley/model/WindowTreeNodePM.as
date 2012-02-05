package com.bluecallisto.parsley.model
{
    import com.bluecallisto.parsley.message.WindowRefreshMessage;

    public class WindowTreeNodePM extends TreeNodePM
    {
        [MessageHandler(scope="window")]
        public function onWindowRefresh(message:WindowRefreshMessage):void
        {
            refresh();
        }
    }
}