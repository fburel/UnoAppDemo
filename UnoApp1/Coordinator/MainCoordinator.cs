using CommunityToolkit.Mvvm.Messaging;
using UnoApp1.Messages;
using UnoApp1.Pages.Control;
using UnoApp1.Pages.Registration;

namespace UnoApp1.Coordinator;

public partial class MainCoordinator: ICoordinator
{
    public Frame RootFrame { get; set; }
    
    public MainCoordinator()
    {
        RootFrame = new Frame();
        RootFrame.Navigate(typeof(HomeControlPage));
        WeakReferenceMessenger.Default.Register<ControlSegueMessage>(this, OnSegue);
    }

    private void OnSegue(object recipient, ControlSegueMessage message)
    {
        switch (message.Value)
        {
            case ControlSegue.OpenPeeringScreen:
                
                break;
            case ControlSegue.OpenDeviceControl:
                break;
            case ControlSegue.OpenProgrammList:
                break;
            case ControlSegue.OpenProgrammDetail:
                break;
            case ControlSegue.SetupHome:
                RootFrame.Navigate(typeof(RegisterHomePage));
                break;
            default:
                throw new ArgumentOutOfRangeException();
        }
    }

}