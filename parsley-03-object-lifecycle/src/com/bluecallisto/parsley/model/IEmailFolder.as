package com.bluecallisto.parsley.model
{
    import mx.collections.IList;

    public interface IEmailFolder
    {
        function fetchMessages():void;
        function get messages():IList;
    }
}