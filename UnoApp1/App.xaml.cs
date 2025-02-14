using Uno.Resizetizer;
using Unoapp1;
using UnoApp1.Coordinator;

namespace UnoApp1;

public partial class App : Application, IMainScreenSwitcher
{
    /// <summary>
    /// Initializes the singleton application object. This is the first line of authored code
    /// executed, and as such is the logical equivalent of main() or WinMain().
    /// </summary>
    public App()
    {
        this.InitializeComponent();
    }

    
    private ICoordinator? _coordinator;
    protected Window? MainWindow { get; private set; }

    protected override void OnLaunched(LaunchActivatedEventArgs args)
    {
        
        // var appBuilder = this.CreateBuilder(args)
        //     .Configure(host => {
        //         // Configure the host builder
        //     });
        // var host = appBuilder.Build();
        
        
        MainWindow = new Window();
#if DEBUG
        MainWindow.UseStudio();
#endif

#if __IOS__ || __ANDROID__
         FeatureConfiguration.Style.ConfigureNativeFrameNavigation();
#endif

        // Do not repeat app initialization when the Window already has content,
        // just ensure that the window is active
        if (MainWindow.Content is not Frame rootFrame)
        {
            // Create a Frame to act as the navigation context and navigate to the first page
            rootFrame = new Frame();

            // Place the frame in the current Window
            MainWindow.Content = rootFrame;

            rootFrame.NavigationFailed += OnNavigationFailed;
        }

        if (rootFrame.Content == null)
        {
            // When the navigation stack isn't restored navigate to the first page,
            // configuring the new page by passing required information as a navigation
            // parameter
            rootFrame.Navigate(typeof(SplashScreen), args.Arguments);
        }

        MainWindow.SetWindowIcon();
        // Ensure the current window is active
        MainWindow.Activate();
        
        AppStateMachine.Current.Switcher = this;
        AppStateMachine.Current.Start();
    }



    /// <summary>
    /// Invoked when Navigation to a certain page fails
    /// </summary>
    /// <param name="sender">The Frame which failed navigation</param>
    /// <param name="e">Details about the navigation failure</param>
    void OnNavigationFailed(object sender, NavigationFailedEventArgs e)
    {
        throw new InvalidOperationException($"Failed to load {e.SourcePageType.FullName}: {e.Exception}");
    }

    public void RequestSwitchToScreen(MainScreenType type)
    {
        
        // DispatchQueue.MainQueue.DispatchAsync(() =>
        // {
            _coordinator = type switch
            {
                MainScreenType.Authentication => new AuthenticationCoordinator(),
                MainScreenType.Control => new MainCoordinator(),
                _ => throw new ArgumentOutOfRangeException(nameof(type), type, null)
            };

            MainWindow!.Content = _coordinator!.RootFrame;
        // });
        
    }
}

