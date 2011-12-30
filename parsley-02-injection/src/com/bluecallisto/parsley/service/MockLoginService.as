package com.bluecallisto.parsley.service
{
    public class MockLoginService implements ILoginService
    {

        /**
         * The mock always accepts any login/password couple 
         * @return true always 
         * 
         */
        public function login(username:String, password:String):Boolean
        {
            return true;
        }
    }
}