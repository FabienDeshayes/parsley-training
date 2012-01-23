package com.bluecallisto.parsley.tag
{
    import com.bluecallisto.parsley.message.CloseApplicationMessage;
    import com.bluecallisto.parsley.message.OpenApplicationMessage;
    
    import org.spicefactory.lib.flash.logging.LogLevel;
    import org.spicefactory.parsley.config.Configuration;
    import org.spicefactory.parsley.config.RootConfigurationElement;
    import org.spicefactory.parsley.dsl.ObjectDefinitionBuilder;
    import org.spicefactory.parsley.flex.util.MessageConfirmation;

    public class NavigationLoggerTag implements RootConfigurationElement
    {

        public var logLevel:LogLevel;
        
        public var scope:String;
        
        public function process(config:Configuration):void
        {
            var builder:ObjectDefinitionBuilder
                = config.builders.forClass(NavigationLogger);
                
            builder
                .constructorArgs()
                    .value(logLevel);
                
            builder
                .method("logNavigationIn")
                    .messageHandler()
                    .type(OpenApplicationMessage)
                    .scope(scope);
            
            builder
                .method("logNavigationOut")
                    .messageHandler()
                    .type(CloseApplicationMessage)
                    .scope(scope);

            builder
                .asSingleton()
                .register();
        }

    }
}
