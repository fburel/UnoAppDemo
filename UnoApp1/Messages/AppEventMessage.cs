using CommunityToolkit.Mvvm.Messaging;
using CommunityToolkit.Mvvm.Messaging.Messages;

namespace Unoapp1.Messages;

public enum AppEvent
{
    LogIn,
    LogOut,
}

public class AppEventMessage(AppEvent value) : ValueChangedMessage<AppEvent>(value)
{
}
public static class AppEventExtensions
{
    public static void Send(this AppEvent segue, object? payload = null)
    {
        WeakReferenceMessenger.Default.Send(new AppEventMessage(segue));
    }
}