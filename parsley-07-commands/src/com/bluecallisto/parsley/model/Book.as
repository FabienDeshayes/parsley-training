package com.bluecallisto.parsley.model
{
    public class Book
    {
        public function Book(author:String, title:String)
        {
            _author = author;
            _title = title;
        }
        
        private var _author:String;
        
        public function get author():String
        {
            return _author;
        }
        
        private var _title:String;
        
        public function get title():String
        {
            return _title;
        }
    }
}