package com.bluecallisto.parsley.model
{
    public class EmailPM
    {
        
        [Bindable]
        public var selectedFolder:IEmailFolder;
        
        [Inject]
        public var inbox:Inbox;
        
        [Inject]
        public var spam:Spam;
        
        [Init]
        public function init():void
        {
            switchTo(inbox);
        }
        
        private function switchTo(folder:IEmailFolder):void
        {
            selectedFolder = folder;
            folder.fetchMessages();
        }
        
    }
}