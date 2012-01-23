package com.bluecallisto.parsley.tag
{
    import com.bluecallisto.parsley.message.CloseApplicationMessage;
    import com.bluecallisto.parsley.message.OpenApplicationMessage;
    
    import mx.utils.StringUtil;
    
    import org.spicefactory.lib.flash.logging.LogLevel;
    import org.spicefactory.lib.logging.LogContext;
    import org.spicefactory.lib.logging.Logger;

    public class NavigationLogger
    {

        private static const LOG:Logger = LogContext.getLogger(NavigationLogger);
        
        private var logLevel:LogLevel;

        public function NavigationLogger(logLevel:LogLevel)
        {
            this.logLevel = logLevel;
        }
        
        public function logNavigationIn(message:OpenApplicationMessage):void
        {
            logNavigation(message.applicationName, true);
        }

        public function logNavigationOut(message:CloseApplicationMessage):void
        {
            logNavigation(message.applicationName, false);
        }

        private function logNavigation(destination:String, opening:Boolean):void
        {
            var message:String = opening
                ? "Opening application {0}"
                : "Leaving application {0}";
            message = StringUtil.substitute(message, destination);

            switch (logLevel)
            {
                case LogLevel.FATAL:
                    LOG.fatal(message);
                    break;
                
                case LogLevel.ERROR:
                    LOG.error(message);
                    break;
                
                case LogLevel.INFO:
                    LOG.info(message);
                    break;
                
                case LogLevel.WARN:
                    LOG.warn(message);
                    break;
                
                case LogLevel.DEBUG:
                    LOG.debug(message);
                default:
                    break;
            }
            
        }

    }
}
