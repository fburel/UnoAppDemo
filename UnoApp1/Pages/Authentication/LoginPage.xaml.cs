
using Microsoft.Extensions.DependencyInjection;
using Unoapp1;
using UnoApp1.Messages;
using Unoapp1.ViewModel;

namespace UnoApp1.Pages.Authentication;

public partial class LoginPage
{
    public AuthenticationViewModel ViewModel => AppStateMachine.Current.Services.GetService<AuthenticationViewModel>()!;
    
    public LoginPage()
    {
        InitializeComponent();
    }

    private void OnSignUpButtonClicked(object sender, RoutedEventArgs e) => AuthenticationSegue.OpenSignUpForm.Send();
}