using CommunityToolkit.Mvvm.Messaging;
using CommunityToolkit.Mvvm.Messaging.Messages;

namespace UnoApp1.Messages;

public enum AuthenticationSegue 
{
    OpenCreationCodeVerification,
    OpenSignUpForm
}

public class AuthenticationSegueMessage(AuthenticationSegue value) : ValueChangedMessage<AuthenticationSegue>(value)
{
}

public enum ControlSegue 
{
    OpenPeeringScreen,
    OpenDeviceControl,
    OpenProgrammList,
    OpenProgrammDetail,
    SetupHome
}

public class ControlSegueMessage(ControlSegue value) : ValueChangedMessage<ControlSegue>(value)
{
}



public static class SegueExtensions
{
    public static void Send(this AuthenticationSegue segue)
    {
        WeakReferenceMessenger.Default.Send(new AuthenticationSegueMessage(segue));
    }
    
    public static void Send(this ControlSegue segue)
    {
        WeakReferenceMessenger.Default.Send(new ControlSegueMessage(segue));
    }
}