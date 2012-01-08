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
        
        public function switchTo(folder:IEmailFolder):void
        {
            selectedFolder = folder;
        }
        
    }
}