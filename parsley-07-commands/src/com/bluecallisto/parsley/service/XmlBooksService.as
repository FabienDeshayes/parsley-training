package com.bluecallisto.parsley.service
{
    import com.bluecallisto.parsley.model.Book;
    
    import flash.xml.XMLNode;
    
    import mx.collections.ArrayCollection;
    import mx.rpc.AsyncToken;
    import mx.rpc.http.HTTPService;

    public class XmlBooksService implements IBooksService
    {
        
        public function getBooks():AsyncToken
        {
            var httpService:HTTPService = new HTTPService();
            httpService.useProxy = false;
            httpService.url = "assets/books.xml";
            httpService.xmlDecode = decodeBooks;
            
            return httpService.send();
        }
        
        public function decodeBooks(xml:XMLNode):Object
        {
            var books:ArrayCollection = new ArrayCollection();
            
            var rootNode:XMLNode = xml.childNodes[0] as XMLNode;
            
            for each (var node:XMLNode in rootNode.childNodes)
            {
                var book:Book = new Book(node.attributes.author, node.attributes.title);
                books.addItem(book);
            }
            
            return books;
        }
        
    }
}