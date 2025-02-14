using CommunityToolkit.Mvvm.Messaging;
using UnoApp1.Messages;
using UnoApp1.Pages.Authentication;

namespace UnoApp1.Coordinator;

public class AuthenticationCoordinator : ICoordinator
{
    public Frame RootFrame { get; set; }

    public AuthenticationCoordinator()
    {
        RootFrame = new Frame();
        RootFrame.Navigate(typeof(LoginPage));
        WeakReferenceMessenger.Default.Register<AuthenticationSegueMessage>(this, OnSegue);
    }

    private void OnSegue(object recipient, AuthenticationSegueMessage message)
    {
        switch (message.Value)
        {
            case AuthenticationSegue.OpenSignUpForm:
                RootFrame.Navigate(typeof(SignUpPage));
                break;
            case AuthenticationSegue.OpenCreationCodeVerification:
                RootFrame.Navigate(typeof(EmailConfirmationPage));
                break;
            default:
                throw new ArgumentOutOfRangeException();
        }
    }
}