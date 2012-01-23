package com.bluecallisto.parsley.tag
{
    import com.bluecallisto.parsley.model.User;
    import com.bluecallisto.parsley.model.UserPermissions;
    
    import flash.display.DisplayObject;
    import flash.events.Event;
    import flash.events.EventDispatcher;
    
    import mx.core.IMXMLObject;
    
    import org.spicefactory.parsley.dsl.view.FastInject;
    
    public class UserTag extends EventDispatcher implements IMXMLObject
    {
        
        public var permissions:UserPermissions;
        
        public function initialized(document:Object, id:String):void
        {
            FastInject
                .view(document as DisplayObject)
                .target(this)
                .type(UserPermissions)
                .property("permissions")
                .complete(fastInjectCompleteHandler)
                .execute();
        }
        
        private var _username:String;
        
        public function set user(username:String):void
        {
            _username = username;
            if (permissions)
            {
                permissions.loadPermissions(_username);
            }
        }
            
        public function fastInjectCompleteHandler():void
        {
            permissions.addEventListener("permissionsChange", permissions_changeHandler);
            permissions.loadPermissions(_username);
        }
        
        public function permissions_changeHandler(event:Event):void
        {
            dispatchEvent(new Event("userPermissionsChange"));
        }
        
        [Bindable("userPermissionsChange")]
        public function get isAdmin():Boolean
        {
            return permissions.permissions["admin"] || permissions.permissions["superuser"];
        }
        
        [Bindable("userPermissionsChange")]
        public function get canSeeRisk():Boolean
        {
            return permissions.permissions["risk"] || permissions.permissions["superuser"];
        }
    }
}