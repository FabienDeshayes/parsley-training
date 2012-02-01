package com.bluecallisto.parsley.service
{
    import mx.rpc.AsyncToken;

    public interface IBooksService
    {
        function getBooks():AsyncToken;
    }
}