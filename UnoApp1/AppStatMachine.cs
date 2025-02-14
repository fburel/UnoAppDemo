using CommunityToolkit.Mvvm.Messaging;
using Microsoft.Extensions.DependencyInjection;
using Splat;
using Unoapp1.Messages;
using Unoapp1.ViewModel;

namespace Unoapp1;

public enum MainScreenType
{
    Authentication,
    Control,
}

public interface IMainScreenSwitcher
{
    void RequestSwitchToScreen(MainScreenType type);
}

public class AppStateMachine {
    public bool IsStarted { get; private set; }

    public IMainScreenSwitcher? Switcher { get; set; }
    
    #region singleton

    private static readonly Lazy<AppStateMachine> Instance = new(() => new AppStateMachine());

    public static AppStateMachine Current => Instance.Value;

    private AppStateMachine() 
    {
    }

    #endregion
    
    public void Start()
    {
        if (IsStarted) return;
        IsStarted = true;

        Services = RegisterServices();
        
        WeakReferenceMessenger.Default.Register<AppEventMessage>(this, OnAppEvent);

        
        Switcher?.RequestSwitchToScreen(MainScreenType.Authentication);
    }

    public IServiceProvider Services { get; set; }

    private IServiceProvider RegisterServices()
    {
        var services = new ServiceCollection();

        services.AddTransient<AuthenticationViewModel>();

        return services.BuildServiceProvider();
    }

    private void OnAppEvent(object recipient, AppEventMessage message)
    {
        switch (message.Value)
        {
            case AppEvent.LogIn:
                Switcher?.RequestSwitchToScreen(MainScreenType.Control);
                break;
            case AppEvent.LogOut:
                Switcher?.RequestSwitchToScreen(MainScreenType.Authentication);
                break;
            default:
                throw new ArgumentOutOfRangeException();
        }
    }
    
}