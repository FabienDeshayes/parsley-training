package com.bluecallisto.parsley.extension
{
    import com.bluecallisto.parsley.message.CloseApplicationMessage;
    
    import org.spicefactory.parsley.config.ObjectDefinitionDecorator;
    import org.spicefactory.parsley.dsl.ObjectDefinitionBuilder;

    [Metadata(types="method", multiple="true")]
    public class Close implements ObjectDefinitionDecorator
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
                .type(CloseApplicationMessage)
                .selector(target);
        }

    }
}