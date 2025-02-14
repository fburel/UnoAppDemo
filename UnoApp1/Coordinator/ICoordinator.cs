namespace UnoApp1.Coordinator;

/// <summary>
/// Coordinator aims to manage navigation between the pages of an application.
/// </summary>
public interface ICoordinator
{
    Frame RootFrame { get; }
}