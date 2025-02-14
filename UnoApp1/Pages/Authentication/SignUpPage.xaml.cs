using Microsoft.Extensions.DependencyInjection;
using Unoapp1;
using Unoapp1.ViewModel;

namespace UnoApp1.Pages.Authentication;

public partial class SignUpPage : Page
{
    public AuthenticationViewModel ViewModel => AppStateMachine.Current.Services.GetService<AuthenticationViewModel>()!;

    public SignUpPage()
    {
        InitializeComponent();
    }
}