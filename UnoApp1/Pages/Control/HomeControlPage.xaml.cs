using UnoApp1.Messages;

namespace UnoApp1.Pages.Control;

public partial class HomeControlPage : Page
{
    public HomeControlPage()
    {
        InitializeComponent();
    }

    private void OnHomeSetup(object sender, RoutedEventArgs e)
    {
        ControlSegue.SetupHome.Send();
    }
}