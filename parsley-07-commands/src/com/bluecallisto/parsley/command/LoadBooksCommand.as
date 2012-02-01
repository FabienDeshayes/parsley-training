package com.bluecallisto.parsley.command
{
    import com.bluecallisto.parsley.message.LoadBooksMessage;
    import com.bluecallisto.parsley.model.Bookshelf;
    import com.bluecallisto.parsley.service.IBooksService;
    
    import mx.collections.ArrayCollection;
    import mx.rpc.AsyncToken;
    import mx.rpc.Fault;

    public class LoadBooksCommand
    {
        
        [Inject]
        public var service:IBooksService;
        
        [Inject]
        public var bookshelf:Bookshelf;
        
        public function execute(message:LoadBooksMessage):AsyncToken
        {
            return service.getBooks();
        }
        
        public function result(result:ArrayCollection):void
        {
            bookshelf.books = result;
        }
        
        public function error(fault:Fault):void
        {
            bookshelf.books = null;
        }
        
    }
}