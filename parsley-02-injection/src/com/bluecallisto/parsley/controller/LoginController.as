package com.bluecallisto.parsley.controller
{
    import com.bluecallisto.parsley.model.User;
    import com.bluecallisto.parsley.service.ILoginService;
    import com.bluecallisto.parsley.service.IValidationService;

    [InjectConstructor]
    public class LoginController
    {
        public function LoginController(validationService:IValidationService)
        {
            _validationService = validationService;
        }
        
        private var _validationService:IValidationService;
        
        // this is injected from the context
        public var loginService:ILoginService;
        
        [Inject(id="loggingInUser")]
        public var loggingInUser:User;
        
        [Inject(id="loggedUser")]
        public var loggedUser:User;
        
        public function login():void
        {
            var isValid:Boolean = _validationService.validate(loggingInUser.login);
            
            if (isValid)
            {
                isValid = loginService.login(loggingInUser.login, loggingInUser.password);
            }
            
            loggedUser.login = isValid ? loggingInUser.login : "";
            loggedUser.password = isValid ? loggingInUser.password : "";
        }
    }
}