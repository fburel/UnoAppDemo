using Microsoft.Extensions.DependencyInjection;
using Unoapp1;
using Unoapp1.ViewModel;

namespace UnoApp1.Pages.Authentication;

public partial class EmailConfirmationPage : Page
{
    public AuthenticationViewModel ViewModel => AppStateMachine.Current.Services.GetService<AuthenticationViewModel>()!;

    public EmailConfirmationPage()
    {
        InitializeComponent();
    }

    public string Text1
    {
        get
        {
            return $"Un code de vérification a été envoyé à l’adresse {this.ViewModel.Email}.\n\nVeuillez le saisir ci-dessous pour continuer. ";
        }
    }
}