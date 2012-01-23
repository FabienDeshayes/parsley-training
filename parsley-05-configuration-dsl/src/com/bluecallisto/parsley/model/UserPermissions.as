package com.bluecallisto.parsley.model
{
    import flash.events.Event;
    import flash.events.EventDispatcher;
    import flash.utils.Dictionary;

    public class UserPermissions extends EventDispatcher
    {
        
        [Bindable("permissionsChange")]
        public var permissions:Dictionary = new Dictionary();
        
        [Init]
        public function init():void
        {
            loadPermissions("");
        }
        
        public function loadPermissions(username:String):void
        {
            permissions["risk"] = username == "fabien" || username == "risk";
            permissions["admin"] = username == "fabien" || username == "admin";
            permissions["superuser"] = username == "fabien" || username == "superuser";
            
            dispatchEvent(new Event("permissionsChange"));
        }
     
    }
}