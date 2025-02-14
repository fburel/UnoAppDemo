using CommunityToolkit.Mvvm.Input;
using Unoapp1.Messages;
using UnoApp1.Messages;

namespace Unoapp1.ViewModel;

public class AuthenticationViewModel : BaseViewModel
{
    public string Email { get; set; } = "test@user.com";
    public string LastName { get; set; }  = string.Empty;
    public string FirstName { get; set; } = string.Empty;
    public string Password { get; set; } = "foobar";
    public string ConfirmationPassword { get; set; } = string.Empty;
    public string ConfirmationCode { get; set; } = string.Empty;
    public readonly IAsyncRelayCommand SignInCommand;
    public readonly IAsyncRelayCommand SignUpCommand;
    public readonly IAsyncRelayCommand ResendConfirmationCodeCommand;
    public readonly IAsyncRelayCommand ValidateConfirmationCodeCommand;
    public readonly IAsyncRelayCommand PasswordForgottenCommand;
    public readonly IAsyncRelayCommand ChangeForgottenPasswordCommand;
    
    public enum AuthenticationError {
        None,
        AppVersionNoLongerSupported,
        EmailMissingOrInvalid,
        PasswordMissingOrInvalid,
        ConfirmationPasswordsMissing,
        ConfirmationPasswordsDoesNotMatch,
        LastNameMissingOrInvalid,
        FirstNameMissingOrInvalid,
        ConfirmationCodeMissingOrInvalid,
        AuthentiationFailed,
        UnknownError,
    }

    private bool _isBusy = false;
    public bool IsBusy
    {
        get => _isBusy;
        set => SetProperty(ref _isBusy, value);
    }
    
    private AuthenticationError _error = AuthenticationError.None;
    public AuthenticationError Error
    {
        get => _error;
        set => SetProperty(ref _error, value);
    }
    
    
    public AuthenticationViewModel()
    {
        SignInCommand = new AsyncRelayCommand(OnSignIn, () => !IsBusy);
        SignUpCommand = new AsyncRelayCommand(OnSignUp, () => !IsBusy);
        ResendConfirmationCodeCommand = new AsyncRelayCommand(OnResendConfirmationCodeRequest);
        ValidateConfirmationCodeCommand = new AsyncRelayCommand(OnCodeValidationRequest);
        PasswordForgottenCommand = new AsyncRelayCommand(OnPasswordForgottenRequest);
        ChangeForgottenPasswordCommand = new AsyncRelayCommand(OnChangeForgottenPasswordRequest);
    }
    
    private async Task OnSignIn()
    {
        Error = AuthenticationError.None;
        Email = Email.Trim().ToLower();
        
        // validate input
        if (string.IsNullOrEmpty(Email))
        {
            Error = AuthenticationError.EmailMissingOrInvalid;
        }
        else if (string.IsNullOrEmpty(Password))
        {
            // Minimum eight characters, at least one letter and one number:
            Error = AuthenticationError.PasswordMissingOrInvalid;
        }
        if(Error != AuthenticationError.None) return;
        
        // do the sign in process...
        IsBusy = true;
        
        await Task.Delay(1000);
        
        // inform app state machine
        AppEvent.LogIn.Send();
        
        IsBusy = false;
    }

    private async Task OnSignUp()
    {
        Error = AuthenticationError.None;
        Email = Email.Trim().ToLower();
        
        if (string.IsNullOrEmpty(Email))
        {
            Error = AuthenticationError.EmailMissingOrInvalid;
        }
        else if (string.IsNullOrEmpty(FirstName))
        {
            Error = AuthenticationError.FirstNameMissingOrInvalid;
        }
        else if (string.IsNullOrEmpty(LastName))
        {
            Error = AuthenticationError.LastNameMissingOrInvalid;
        }
        else if (string.IsNullOrEmpty(Password))
        {
            // Minimum eight characters, at least one letter and one number:
            Error = AuthenticationError.PasswordMissingOrInvalid;
        }
        else if (!Password.SequenceEqual(ConfirmationPassword))
        {
            // Minimum eight characters, at least one letter and one number:
            Error = AuthenticationError.ConfirmationPasswordsDoesNotMatch;
        }
        
        if(Error != AuthenticationError.None) return;
        
        // do the sign in process...
        IsBusy = true;
        
        await Task.Delay(1000);
        
        // inform app state machine
        AuthenticationSegue.OpenCreationCodeVerification.Send();
        
        IsBusy = false;
        
    }
    
    private async Task OnCodeValidationRequest()
    {
        IsBusy = true;
        
        await Task.Delay(1000);
        
        // inform app state machine
        AppEvent.LogIn.Send();
        
        IsBusy = false;
    }
    
    private async Task OnResendConfirmationCodeRequest()
    {
        IsBusy = true;
        
        await Task.Delay(1000);
        
        IsBusy = false;
    }
    
    private async Task OnPasswordForgottenRequest()
    {
        throw new NotImplementedException();
    }
    
   
    
    private async Task OnChangeForgottenPasswordRequest()
    {
        throw new NotImplementedException();
    }
}