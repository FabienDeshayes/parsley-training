package com.bluecallisto.parsley.service
{
    public class ValidationService implements IValidationService
    {
        
        /**
         * Test that the expression is valid. A valid expression is not null,
         * not empty and contains only alphanumerical characters. 
         * @param expression the expression to be validated
         * @return true is the expression is valid.
         * 
         */
        public function validate(expression:String):Boolean
        {
            var regExp:RegExp = /^[a-zA-Z0-9]*$/;
            return expression
                && expression != ""
                && regExp.test(expression);
        }
        
    }
}