package com.bluecallisto.parsley.extension
{
    import com.bluecallisto.parsley.message.OpenApplicationMessage;
    
    import org.spicefactory.parsley.config.ObjectDefinitionDecorator;
    import org.spicefactory.parsley.dsl.ObjectDefinitionBuilder;

    [Metadata(types="method", multiple="true")]
    public class Open implements ObjectDefinitionDecorator
    {

        [DefaultProperty]
        public var target:String;
        
        [Target]
        public var method:String;
        
        public function decorate(builder:ObjectDefinitionBuilder):void
        {
            builder
            .method(method)
                .messageHandler()
                .type(OpenApplicationMessage)
                .selector(target);
        }

    }
}