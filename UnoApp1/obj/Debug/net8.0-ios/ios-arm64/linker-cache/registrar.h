#pragma clang diagnostic ignored "-Wdeprecated-declarations"
#pragma clang diagnostic ignored "-Wtypedef-redefinition"
#pragma clang diagnostic ignored "-Wobjc-designated-initializers"
#pragma clang diagnostic ignored "-Wunguarded-availability-new"
#define DEBUG 1
#include <stdarg.h>
#include <objc/objc.h>
#include <objc/runtime.h>
#include <objc/message.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>
#import <GLKit/GLKit.h>
#import <WebKit/WebKit.h>
#import <QuartzCore/QuartzCore.h>
#import <CallKit/CallKit.h>
#import <AuthenticationServices/AuthenticationServices.h>
#import <CoreLocation/CoreLocation.h>
#import <ContactsUI/ContactsUI.h>
#import <PhotosUI/PhotosUI.h>
#import <MessageUI/MessageUI.h>
#import <Contacts/Contacts.h>
#import <AVFoundation/AVFoundation.h>

@class Microsoft_iOS__UIKit_UIApplicationDelegate;
@class Microsoft_Maui_MauiUIApplicationDelegate;
@class __UnoHotRestartDelegate;
@class Uno_UI_Controls_BindableUIView;
@class Microsoft_UI_Xaml_UIElement;
@class Microsoft_UI_Xaml_FrameworkElement;
@class Microsoft_UI_Xaml_Controls_Control;
@class Microsoft_UI_Xaml_Controls_ContentControl;
@class Microsoft_UI_Xaml_Controls_UserControl;
@class Microsoft_UI_Xaml_Controls_Page;
@class Unoapp1_SplashScreen;
@class UnoAppDelegate;
@class UnoApp1_App;
@class UnoApp1_Pages_Registration_RegisterHomePage;
@class UnoApp1_Pages_Control_HomeControlPage;
@class UnoApp1_Pages_Authentication_EmailConfirmationPage;
@class UnoApp1_Pages_Authentication_LoginPage;
@class UnoApp1_Pages_Authentication_SignUpPage;
@class SkiaSharp_Views_Windows_SKSwapChainPanel;
@class Microsoft_UI_Xaml_Controls_Panel;
@class Microsoft_UI_Xaml_Controls_Canvas;
@class SkiaSharp_Views_Windows_SKXamlCanvas;
@class SkiaSharp_Views_Windows_SKGLView;
@class Uno_Material_Ripple;
@class Microsoft_iOS__UIKit_UIScrollViewDelegate;
@class Uno_Toolkit_UI_ScrollViewDelegate;
@class Uno_Toolkit_UI_CardContentControl;
@class Uno_Toolkit_UI_Card;
@class Microsoft_UI_Xaml_Controls_Primitives_ButtonBase;
@class Microsoft_UI_Xaml_Controls_Primitives_ToggleButton;
@class Uno_Toolkit_UI_Chip;
@class Uno_Toolkit_UI_Divider;
@class Uno_Toolkit_UI_DrawerControl;
@class Microsoft_UI_Xaml_Controls_Border;
@class Uno_Toolkit_UI_AppBarButtonWrapper;
@class Uno_Toolkit_UI_TitleView;
@class Uno_Toolkit_UI_SafeAreaPresenter;
@class Microsoft_UI_Xaml_Controls_Primitives_SelectorItem;
@class Uno_Toolkit_UI_TabBarItem;
@class Microsoft_UI_Xaml_Controls_RelativePanel;
@class Uno_Toolkit_UI_AutoLayout;
@class Microsoft_UI_Xaml_Controls_ItemsControl;
@class Uno_Toolkit_UI_ChipGroup;
@class Uno_Toolkit_UI_DrawerFlyoutPresenter;
@class Uno_Toolkit_UI_LoadingView;
@class Uno_Toolkit_UI_ExtendedSplashScreen;
@class Uno_Toolkit_UI_CompositeLoadableSource;
@class Uno_Toolkit_UI_LoadableSource;
@class Uno_Toolkit_UI_NativeFramePresenter_PageViewController;
@class Uno_Toolkit_UI_NativeFramePresenter_FrameNavigationController;
@class Microsoft_iOS__UIKit_UINavigationControllerDelegate;
@class Uno_Toolkit_UI_NativeFramePresenter_ControllerDelegate;
@class Uno_Toolkit_UI_NativeFramePresenter;
@class Microsoft_UI_Xaml_Controls_ContentPresenter;
@class Uno_Toolkit_UI_NativeNavigationBarPresenter;
@class Uno_Toolkit_UI_NavigationBar;
@class Uno_Toolkit_UI_NavigationBarPresenter;
@class Uno_Toolkit_UI_ResponsiveView;
@class Uno_Toolkit_UI_SafeArea;
@class Uno_Toolkit_UI_TabBar;
@class Uno_Toolkit_UI_TabBarListPanel;
@class Uno_Toolkit_UI_TabBarSelectionIndicatorPresenter;
@class Uno_UI_HotDesign_BaseToolWindowControl;
@class Uno_UI_HotDesign_Controls_ShadowControl;
@class Uno_UI_HotDesign_Client_Core_Controls_DataTemplateBreadcrumb;
@class Uno_UI_HotDesign_Client_Controls_HDMessage;
@class Uno_UI_HotDesign_Client_Controls_ShellControlPanel;
@class Uno_UI_HotDesign_Client_Controls_ShellToolbarMenu;
@class Uno_UI_HotDesign_Client_HotDesignClientHost;
@class Uno_UI_HotDesign_Client_HotReload_HotReloadStatusView;
@class Uno_UI_HotDesign_Client_Controls_Adornment;
@class Uno_UI_HotDesign_Client_Controls_DataTemplateEditor;
@class Uno_UI_HotDesign_Client_Controls_DesignerOverlay;
@class Uno_UI_HotDesign_Client_Controls_EntryButton;
@class Uno_UI_HotDesign_Client_Controls_ZoomContentControl;
@class Uno_UI_HotDesign_Client_Adorners_AdornersLayer;
@class Uno_UI_HotDesign_CommunityToolkit_Controls_SizerBase;
@class Microsoft_UI_Xaml_Controls_Grid;
@class Uno_UI_HotDesign_CommunityToolkit_Controls_UniformGrid;
@class Uno_UI_HotDesign_CommunityToolkit_Controls_GridSplitter;
@class Uno_UI_HotDesign_Hierarchy_HierarchyView;
@class Uno_UI_HotDesign_PropertyGrid_PropertySearchBar;
@class Uno_UI_HotDesign_PropertyGrid_SelectionBreadcrumb;
@class Uno_UI_HotDesign_PropertyGrid_AdvancedPropertyEditor;
@class Uno_UI_HotDesign_PropertyGrid_CollectionEditor;
@class Uno_UI_HotDesign_PropertyGrid_IdentityProperties;
@class Uno_UI_HotDesign_PropertyGrid_SelectionProperties;
@class Microsoft_UI_Xaml_Controls_ContentDialog;
@class Uno_UI_HotDesign_PropertyGrid_PropertyFlyout;
@class Uno_UI_HotDesign_PropertyGrid_PropertyGridCell;
@class Uno_UI_HotDesign_PropertyGrid_PropertyGridView;
@class Uno_UI_HotDesign_PropertyGrid_Editors_CornerRadiusEditor;
@class Uno_UI_HotDesign_PropertyGrid_Editors_GridDefinitionsEditor;
@class Uno_UI_HotDesign_Toolbox_ToolboxView;
@class Uno_UI_Toolkit_ElevatedView;
@class Uno_Diagnostics_UI_DiagnosticsOverlay;
@class Microsoft_UI_Xaml_DragRoot;
@class Microsoft_UI_Xaml_DragView;
@class Microsoft_UI_Xaml_Shapes_Shape;
@class Microsoft_UI_Xaml_Shapes_Ellipse;
@class Microsoft_UI_Xaml_Shapes_Line;
@class Microsoft_UI_Xaml_Shapes_Path;
@class Microsoft_UI_Xaml_Shapes_Rectangle;
@class Microsoft_UI_Xaml_Documents_Glyphs;
@class Microsoft_UI_Xaml_Controls_AnimatedVisualPlayer;
@class Microsoft_UI_Xaml_Controls_AnnotatedScrollBar;
@class Microsoft_UI_Xaml_Controls_AppBarElementContainer;
@class Microsoft_UI_Xaml_Controls_AppBarSeparator;
@class Microsoft_UI_Xaml_Controls_AppBarToggleButton;
@class Microsoft_UI_Xaml_Controls_Button;
@class Microsoft_UI_Xaml_Controls_CheckBox;
@class Microsoft_UI_Xaml_Controls_ComboBoxItem;
@class Microsoft_UI_Xaml_Controls_DatePickerFlyoutPresenter;
@class Microsoft_UI_Xaml_Controls_DropDownButton;
@class Microsoft_UI_Xaml_Controls_Primitives_Selector;
@class Microsoft_UI_Xaml_Controls_FlipView;
@class Microsoft_UI_Xaml_Controls_FlipViewItem;
@class Microsoft_UI_Xaml_Controls_FlyoutPresenter;
@class Microsoft_UI_Xaml_Controls_ListViewBase;
@class Microsoft_UI_Xaml_Controls_GridView;
@class Microsoft_UI_Xaml_Controls_ListViewBaseHeaderItem;
@class Microsoft_UI_Xaml_Controls_GridViewHeaderItem;
@class Microsoft_UI_Xaml_Controls_GridViewItem;
@class Microsoft_UI_Xaml_Controls_GroupItem;
@class Microsoft_UI_Xaml_Controls_Hub;
@class Microsoft_UI_Xaml_Controls_HubSection;
@class Microsoft_UI_Xaml_Controls_IconElement;
@class Microsoft_UI_Xaml_Controls_ImageIcon;
@class Microsoft_UI_Xaml_Controls_InfoBadge;
@class Microsoft_UI_Xaml_Controls_InfoBar;
@class Microsoft_UI_Xaml_Controls_ListBox;
@class Microsoft_UI_Xaml_Controls_ListBoxItem;
@class Microsoft_UI_Xaml_Controls_ListPickerFlyoutPresenter;
@class Microsoft_UI_Xaml_Controls_ListView;
@class Microsoft_UI_Xaml_Controls_ListViewHeaderItem;
@class Microsoft_UI_Xaml_Controls_ListViewItem;
@class Microsoft_UI_Xaml_Controls_MapControl;
@class Microsoft_UI_Xaml_Controls_MenuBar;
@class Microsoft_UI_Xaml_Controls_MenuFlyoutItemBase;
@class Microsoft_UI_Xaml_Controls_MenuFlyoutSeparator;
@class Microsoft_UI_Xaml_Controls_NavigationViewItemBase;
@class Microsoft_UI_Xaml_Controls_NavigationViewItemHeader;
@class Microsoft_UI_Xaml_Controls_NavigationViewItemSeparator;
@class Microsoft_UI_Xaml_Controls_ParallaxView;
@class Microsoft_UI_Xaml_Controls_PersonPicture;
@class Microsoft_UI_Xaml_Controls_PickerFlyoutPresenter;
@class Microsoft_UI_Xaml_Controls_PivotItem;
@class Microsoft_UI_Xaml_Controls_Primitives_RangeBase;
@class Microsoft_UI_Xaml_Controls_ProgressBar;
@class Microsoft_UI_Xaml_Controls_RadioButton;
@class Microsoft_UI_Xaml_Controls_RefreshVisualizer;
@class Microsoft_UI_Xaml_Controls_Primitives_ListViewItemPresenter;
@class Microsoft_UI_Xaml_Controls_RevealListViewItemPresenter;
@class Microsoft_UI_Xaml_Controls_RichEditBox;
@class Microsoft_UI_Xaml_Controls_RichTextBlock;
@class Microsoft_UI_Xaml_Controls_RichTextBlockOverflow;
@class Microsoft_UI_Xaml_Controls_ScrollContentPresenter;
@class Microsoft_UI_Xaml_Controls_SelectorBar;
@class Microsoft_UI_Xaml_Controls_ItemContainer;
@class Microsoft_UI_Xaml_Controls_SelectorBarItem;
@class Microsoft_UI_Xaml_Controls_SemanticZoom;
@class Microsoft_UI_Xaml_Controls_SwapChainBackgroundPanel;
@class Microsoft_UI_Xaml_Controls_SwapChainPanel;
@class Microsoft_UI_Xaml_Controls_TabViewItem;
@class Microsoft_UI_Xaml_Controls_TimePickerFlyoutPresenter;
@class Microsoft_UI_Xaml_Controls_SplitButton;
@class Microsoft_UI_Xaml_Controls_ToggleSplitButton;
@class Microsoft_UI_Xaml_Controls_ToolTip;
@class Microsoft_UI_Xaml_Controls_TreeView;
@class Microsoft_UI_Xaml_Controls_Viewbox;
@class Microsoft_UI_Xaml_Controls_VirtualizingPanel;
@class Microsoft_UI_Xaml_Controls_Primitives_OrientedVirtualizingPanel;
@class Microsoft_UI_Xaml_Controls_VirtualizingStackPanel;
@class Microsoft_UI_Xaml_Controls_WrapGrid;
@class Microsoft_UI_Xaml_Controls_TextBlock;
@class Microsoft_UI_Xaml_Controls_ImplicitTextBlock;
@class Microsoft_UI_Xaml_Controls_Primitives_PopupPanel;
@class Microsoft_UI_Xaml_Controls_ContentDialogPopupPanel;
@class Microsoft_UI_Xaml_Controls_NativeDatePickerFlyoutPresenter;
@class Microsoft_iOS__UIKit_UICollectionViewSource;
@class Microsoft_UI_Xaml_Controls_FlipViewSource;
@class Microsoft_UI_Xaml_Controls_PagedCollectionView;
@class Microsoft_UI_Xaml_Controls_NativeFlipView;
@class Microsoft_UI_Xaml_Controls_FlyoutBasePopupPanel;
@class Microsoft_UI_Xaml_Controls_PickerFlyoutPopupPanel;
@class Microsoft_UI_Xaml_Controls_NativeImageView;
@class Microsoft_UI_Xaml_Controls_VirtualizingPanelLayout;
@class Microsoft_UI_Xaml_Controls_ItemsStackPanelLayout;
@class Microsoft_UI_Xaml_Controls_ListViewBaseScrollContentPresenter;
@class Microsoft_UI_Xaml_Controls_ListViewBaseInternalContainer;
@class Microsoft_UI_Xaml_Controls_BlockLayout;
@class Microsoft_UI_Xaml_Controls_UnsetLayout;
@class Microsoft_UI_Xaml_Controls_NativePage;
@class Microsoft_UI_Xaml_Controls_PickerItem;
@class Microsoft_iOS__UIKit_UIPickerViewModel;
@class Microsoft_UI_Xaml_Controls_PickerModel;
@class Microsoft_UI_Xaml_Controls_Primitives_Popup;
@class Microsoft_UI_Xaml_Controls_NativePopupBase;
@class Microsoft_UI_Xaml_Controls_Popover;
@class Microsoft_iOS__UIKit_UITextViewDelegate;
@class Microsoft_UI_Xaml_Controls_MultilineTextBoxDelegate;
@class Microsoft_UI_Xaml_Controls_NativeTimePickerFlyoutPresenter;
@class Microsoft_iOS__WebKit_WKUIDelegate;
@class Microsoft_UI_Xaml_Controls_LocalWKUIDelegate;
@class Microsoft_UI_Xaml_Controls_UnoWKWebView;
@class Microsoft_UI_Xaml_Controls_NativeWebView;
@class Microsoft_UI_Xaml_Controls_WindowView;
@class Microsoft_UI_Xaml_Controls_WrapPanel;
@class Microsoft_UI_Xaml_Controls_StackPanel;
@class Microsoft_UI_Xaml_Controls_Primitives_CarouselPanel;
@class Microsoft_UI_Xaml_Controls_Slider;
@class Microsoft_UI_Xaml_Controls_Primitives_ColorPickerSlider;
@class Microsoft_UI_Xaml_Controls_AppBar;
@class Microsoft_UI_Xaml_Controls_CommandBar;
@class Microsoft_UI_Xaml_Controls_Primitives_CommandBarFlyoutCommandBar;
@class Microsoft_UI_Xaml_Controls_Primitives_GridViewItemPresenter;
@class Microsoft_UI_Xaml_Controls_Primitives_InfoBarPanel;
@class Microsoft_UI_Xaml_Controls_Primitives_LoopingSelectorPanel;
@class Microsoft_UI_Xaml_Controls_Primitives_MonochromaticOverlayPresenter;
@class Microsoft_UI_Xaml_Controls_Primitives_PivotHeaderItem;
@class Microsoft_UI_Xaml_Controls_Primitives_PivotHeaderPanel;
@class Microsoft_UI_Xaml_Controls_Primitives_PivotPanel;
@class Microsoft_UI_Xaml_Controls_Primitives_RepeatButton;
@class Microsoft_UI_Xaml_Controls_Primitives_TabViewListView;
@class Microsoft_UI_Xaml_Controls_Primitives_Thumb;
@class Microsoft_UI_Xaml_Controls_Primitives_TickBar;
@class Uno_UI_Xaml_Islands_XamlIsland;
@class Uno_UI_Xaml_Islands_XamlIslandRootCollection;
@class Uno_UI_Xaml_Core_FullWindowMediaRoot;
@class Uno_UI_Xaml_Core_RootVisual;
@class Uno_UI_Xaml_Controls_NativeRefreshControl;
@class Uno_UI_Xaml_Controls_NativeRefreshVisualizer;
@class Uno_UI_Xaml_Controls_ProgressRingRefreshVisualizer;
@class Uno_UI_Xaml_Controls_WindowChrome;
@class Microsoft_iOS__UIKit_UIGestureRecognizerDelegate;
@class Uno_UI_Helpers_NativeFramePresenterUIGestureRecognizerDelegate;
@class Uno_UI_Views_Controls_DataTemplateSelectorControl;
@class Uno_UI_Controls_AppBarButtonWrapper;
@class Uno_UI_Controls_TitleView;
@class Uno_UI_Controls_LineView;
@class Microsoft_iOS__UIKit_UIViewControllerTransitioningDelegate;
@class Uno_UI_Controls_ViewControllerTransitioningDeligate;
@class Uno_UI_Views_Controls_BindableUICollectionView;
@class Uno_UI_Controls_Legacy_ListViewBase;
@class Uno_UI_Controls_Legacy_GridView;
@class Uno_UI_Controls_Legacy_ListViewBaseSource;
@class Uno_UI_Controls_Legacy_GridViewSource;
@class Uno_UI_Controls_Legacy_ListView;
@class Uno_UI_Controls_Legacy_ListViewSource;
@class Uno_UI_Views_Controls_BindableUIActivityIndicatorView;
@class Uno_UI_Controls_Legacy_NativeProgressRing;
@class Uno_UI_Controls_Legacy_ProgressRing;
@class Microsoft_UI_Xaml_ElementStub;
@class Microsoft_UI_Xaml_Shapes_Polygon;
@class Microsoft_UI_Xaml_Shapes_Polyline;
@class Microsoft_UI_Xaml_Media_RadialGradientBrush_RadialGradientLayer;
@class Microsoft_UI_Xaml_Controls_AnimatedIcon;
@class Microsoft_UI_Xaml_Controls_AppBarButton;
@class Microsoft_UI_Xaml_Controls_AutoSuggestBox;
@class Microsoft_UI_Xaml_Controls_BitmapIcon;
@class Microsoft_UI_Xaml_Controls_BreadcrumbBar;
@class Microsoft_UI_Xaml_Controls_BreadcrumbBarItem;
@class Microsoft_UI_Xaml_Controls_CalendarDatePicker;
@class Microsoft_UI_Xaml_Controls_CalendarView;
@class Microsoft_UI_Xaml_Controls_CalendarViewBaseItem;
@class Microsoft_UI_Xaml_Controls_CalendarViewDayItem;
@class Microsoft_UI_Xaml_Controls_ColorPicker;
@class Microsoft_UI_Xaml_Controls_ComboBox;
@class Microsoft_UI_Xaml_Controls_CommandBarOverflowPresenter;
@class Microsoft_UI_Xaml_Controls_DatePicker;
@class Microsoft_UI_Xaml_Controls_Expander;
@class Microsoft_UI_Xaml_Controls_FontIcon;
@class Microsoft_UI_Xaml_Controls_Frame;
@class Microsoft_UI_Xaml_Controls_HyperlinkButton;
@class Microsoft_UI_Xaml_Controls_IconSourceElement;
@class Microsoft_UI_Xaml_Controls_Image;
@class Microsoft_UI_Xaml_Controls_ItemsPresenter;
@class Microsoft_UI_Xaml_Controls_ItemsRepeater;
@class Microsoft_UI_Xaml_Controls_ItemsRepeaterScrollHost;
@class Microsoft_UI_Xaml_Controls_ItemsStackPanel;
@class Microsoft_UI_Xaml_Controls_ItemsView;
@class Microsoft_UI_Xaml_Controls_ItemsWrapGrid;
@class Microsoft_UI_Xaml_Controls_MediaPlayerElement;
@class Microsoft_UI_Xaml_Controls_MediaPlayerPresenter;
@class Microsoft_UI_Xaml_Controls_MediaTransportControls;
@class Microsoft_UI_Xaml_Controls_MenuBarItem;
@class Microsoft_UI_Xaml_Controls_MenuFlyoutItem;
@class Microsoft_UI_Xaml_Controls_MenuFlyoutPresenter;
@class Microsoft_UI_Xaml_Controls_MenuFlyoutSubItem;
@class Microsoft_UI_Xaml_Controls_NavigationView;
@class Microsoft_UI_Xaml_Controls_NavigationViewItem;
@class Microsoft_UI_Xaml_Controls_NumberBox;
@class Microsoft_UI_Xaml_Controls_TextBox;
@class Microsoft_UI_Xaml_Controls_PasswordBox;
@class Microsoft_UI_Xaml_Controls_PathIcon;
@class Microsoft_UI_Xaml_Controls_PipsPager;
@class Microsoft_UI_Xaml_Controls_Pivot;
@class Microsoft_UI_Xaml_Controls_ProgressRing;
@class Microsoft_UI_Xaml_Controls_RadioButtons;
@class Microsoft_UI_Xaml_Controls_ToggleMenuFlyoutItem;
@class Microsoft_UI_Xaml_Controls_RadioMenuFlyoutItem;
@class Microsoft_UI_Xaml_Controls_RatingControl;
@class Microsoft_UI_Xaml_Controls_RefreshContainer;
@class Microsoft_UI_Xaml_Controls_ScrollView;
@class Microsoft_UI_Xaml_Controls_ScrollViewer;
@class Microsoft_UI_Xaml_Controls_SplitView;
@class Microsoft_UI_Xaml_Controls_SwipeControl;
@class Microsoft_UI_Xaml_Controls_SymbolIcon;
@class Microsoft_UI_Xaml_Controls_TabView;
@class Microsoft_UI_Xaml_Controls_TeachingTip;
@class Microsoft_UI_Xaml_Controls_TimePicker;
@class Microsoft_UI_Xaml_Controls_ToggleSwitch;
@class Microsoft_UI_Xaml_Controls_TreeViewItem;
@class Microsoft_UI_Xaml_Controls_TreeViewList;
@class Microsoft_UI_Xaml_Controls_TwoPaneView;
@class Microsoft_UI_Xaml_Controls_VariableSizedWrapGrid;
@class Microsoft_UI_Xaml_Controls_WebView2;
@class Microsoft_UI_Xaml_Controls_LayoutPanel;
@class Microsoft_UI_Xaml_Controls_PagerControl;
@class Microsoft_UI_Xaml_Controls_CalendarViewItem;
@class Microsoft_UI_Xaml_Controls_DatePickerSelector;
@class Microsoft_UI_Xaml_Controls_ItemsWrapGridLayout;
@class Microsoft_UI_Xaml_Controls_ListViewBaseSource;
@class Microsoft_UI_Xaml_Controls_NativeListViewBase;
@class Microsoft_UI_Xaml_Controls_Picker;
@class Microsoft_UI_Xaml_Controls_NativePivotPresenter;
@class Microsoft_UI_Xaml_Controls_NativeScrollContentPresenter;
@class Microsoft_UI_Xaml_Controls_MultilineTextBoxView;
@class Microsoft_iOS__UIKit_UITextFieldDelegate;
@class Microsoft_UI_Xaml_Controls_SinglelineTextBoxDelegate;
@class Microsoft_UI_Xaml_Controls_SinglelineTextBoxView;
@class Microsoft_UI_Xaml_Controls_TimePickerSelector;
@class Microsoft_iOS__WebKit_WKNavigationDelegate;
@class Microsoft_UI_Xaml_Controls_WebViewNavigationDelegate;
@class Microsoft_UI_Xaml_Controls_WebView;
@class Microsoft_UI_Xaml_Controls_Primitives_CalendarPanel;
@class Microsoft_UI_Xaml_Controls_Primitives_ColorSpectrum;
@class Microsoft_UI_Xaml_Controls_Primitives_LoopingSelector;
@class Microsoft_UI_Xaml_Controls_Primitives_LoopingSelectorItem;
@class Microsoft_UI_Xaml_Controls_Primitives_NavigationViewItemPresenter;
@class Microsoft_UI_Xaml_Controls_Primitives_ScrollBar;
@class Microsoft_UI_Xaml_Controls_Primitives_ScrollPresenter;
@class Microsoft_UI_Xaml_Controls_Primitives_PopupRoot;
@class Uno_UI_WinRT_Extensions_UI_Popups_MessageDialogContentDialog;
@class Uno_UI_Xaml_Controls_SystemFocusVisual;
@class Uno_UI_Views_Controls_BindableUIAlertView;
@class Uno_UI_Views_Controls_BindableUIButton;
@class Uno_UI_Views_Controls_BindableUIProgressView;
@class Uno_UI_Views_Controls_BindableUIScrollView;
@class Uno_UI_Views_Controls_BindableUISwitch;
@class Uno_UI_Views_Controls_StrategyBasedDataTemplateSelectorControl;
@class Uno_UI_Controls_BindableSearchBar;
@class Uno_UI_Controls_BindableUISlider;
@class Uno_UI_Controls_NativeCommandBarPresenter;
@class Uno_UI_Controls_FauxGradientBorderPresenter;
@class Uno_UI_Controls_NativeFramePresenter_PageViewController;
@class Uno_UI_Controls_NativeFramePresenter_ControllerDelegate;
@class Uno_UI_Controls_NativeFramePresenter;
@class Uno_UI_Controls_RootViewController;
@class Uno_UI_Controls_StatePresenter;
@class Uno_UI_Controls_UnoNavigationBar;
@class Uno_UI_Controls_ManagedItemsStackPanel;
@class Uno_UI_Controls_Window;
@class Uno_UI_Controls_Legacy_ListViewBaseLayout;
@class Uno_UI_Controls_Legacy_GridViewWrapGridLayout;
@class LegacyInternalContainer;
@class Uno_UI_Controls_Legacy_ListViewLayout;
@class Uno_UI_Controls_NativeFramePresenter_FrameNavigationController;
@class Uno_Media_Playback_VideoSurface;
@class Microsoft_iOS__UIKit_UIImagePickerControllerDelegate;
@class Windows_Media_Capture_CameraDelegate;
@class Microsoft_iOS__CallKit_CXCallObserverDelegate;
@class Windows_ApplicationModel_Calls_CallObserverDelegate;
@class Uno_AuthenticationBroker_WebAuthenticationBrokerProvider_PresentationContextProviderToSharedKeyWindow;
@class Windows_Storage_Pickers_FileOpenPicker_ImageOpenPickerDelegate;
@class Microsoft_iOS__UIKit_UIAdaptivePresentationControllerDelegate;
@class Windows_Storage_Pickers_FileOpenPicker_FileOpenPickerPresentationControllerDelegate;
@class Microsoft_iOS__UIKit_UIDocumentPickerDelegate;
@class Windows_Storage_Pickers_FolderPicker_FolderPickerDelegate;
@class Windows_Storage_Pickers_FolderPicker_FolderPickerPresentationControllerDelegate;
@class Windows_Media_Playback_MediaPlayer_Observer;
@class Windows_Media_Capture_CameraCaptureUI_LockedOrientationUIImagePickerController;
@class Windows_Devices_Geolocation_Geolocator_CLLocationManagerDelegate;
@class Microsoft_iOS__UIKit_UIActivityItemSource;
@class Windows_ApplicationModel_DataTransfer_DataTransferManager_DataActivityItemSource;
@class Microsoft_iOS__ContactsUI_CNContactPickerDelegate;
@class Windows_ApplicationModel_Contacts_ContactPicker_SingleContactPickerDelegate;
@class Windows_ApplicationModel_Contacts_ContactPicker_MultipleContactPickerDelegate;
@class Microsoft_iOS__PhotosUI_PHPickerViewControllerDelegate;
@class Windows_Storage_Pickers_FileOpenPicker_PhotoPickerDelegate;
@class Windows_Storage_Pickers_FileOpenPicker_FileOpenPickerDelegate;
@class Uno_UI_RemoteControl_RemoteControlStatusView;
@class Microsoft_iOS__MessageUI_MFMailComposeViewControllerDelegate;
@class MessageUI_Mono_MFMailComposeViewControllerDelegate;
@class Foundation_NSDispatcher;
@class __MonoMac_NSActionDispatcher;
@class __MonoMac_NSSynchronizationContextDispatcher;
@class Foundation_NSAsyncDispatcher;
@class __MonoMac_NSAsyncActionDispatcher;
@class __MonoMac_NSAsyncSynchronizationContextDispatcher;
@class Foundation_NSExceptionError;
@class Foundation_InternalNSNotificationHandler;
@class Microsoft_iOS__Foundation_NSUrlSessionDataDelegate;
@class UIKit_UIControlEventProxy;
@class GLKit_GLKView__GLKViewDelegate;
@class __NSObject_Disposer;
@class CoreAnimation_CAAnimation__CAAnimationDelegate;
@class System_Net_Http_NSUrlSessionHandler_WrappedNSInputStream;
@class UIKit_UIActionSheet__UIActionSheetDelegate;
@class UIKit_UIAlertView__UIAlertViewDelegate;
@class UIKit_UIBarButtonItem_Callback;
@class UIKit_UIView_UIViewAppearance;
@class UIKit_UIControl_UIControlAppearance;
@class __UIGestureRecognizerToken;
@class UIKit_UIPopoverController__UIPopoverControllerDelegate;
@class UIKit_UISearchBar__UISearchBarDelegate;
@class UIKit_UITextField__UITextFieldDelegate;
@class UIKit_UIScrollView__UIScrollViewDelegate;
@class UIKit_UITextView__UITextViewDelegate;
@class UIKit_UIDatePicker_UIDatePickerAppearance;
@class UIKit_UITabBar__UITabBarDelegate;
@class System_Net_Http_NSUrlSessionHandler_NSUrlSessionHandlerDelegate;

@interface Microsoft_iOS__UIKit_UIApplicationDelegate : NSObject<UIApplicationDelegate> {
}
	-(id) init;
@end

@interface Uno_UI_Controls_BindableUIView : UIView {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) didAddSubview:(UIView *)p0;
	-(void) addSubview:(UIView *)p0;
	-(void) insertSubview:(UIView *)p0 atIndex:(void *)p1;
	-(void) willRemoveSubview:(UIView *)p0;
	-(void) didMoveToWindow;
	-(void) willMoveToSuperview:(UIView *)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@interface Microsoft_UI_Xaml_UIElement : Uno_UI_Controls_BindableUIView {
}
	-(void) didMoveToWindow;
	-(BOOL) isHidden;
	-(void) setHidden:(BOOL)p0;
	-(void) touchesBegan:(NSSet *)p0 withEvent:(UIEvent *)p1;
	-(void) touchesMoved:(NSSet *)p0 withEvent:(UIEvent *)p1;
	-(void) touchesEnded:(NSSet *)p0 withEvent:(UIEvent *)p1;
	-(void) touchesCancelled:(NSSet *)p0 withEvent:(UIEvent *)p1;
	-(id) init;
@end

@interface Microsoft_UI_Xaml_FrameworkElement : Microsoft_UI_Xaml_UIElement {
}
	-(void) setNeedsLayout;
	-(void) layoutSubviews;
	-(CGSize) sizeThatFits:(CGSize)p0;
	-(void) addSubview:(UIView *)p0;
	-(void) didMoveToWindow;
	-(void) willMoveToSuperview:(UIView *)p0;
	-(CGRect) frame;
	-(void) setFrame:(CGRect)p0;
	-(void) didMoveToSuperview;
	-(UIView *) hitTest:(CGPoint)p0 withEvent:(UIEvent *)p1;
	-(NSString *) getDependencyPropertyValue:(NSString *)p0;
	-(NSString *) setDependencyPropertyValue:(NSString *)p0;
	-(BOOL) accessibilityActivate;
	-(BOOL) isAccessibilityElement;
	-(void) setIsAccessibilityElement:(BOOL)p0;
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_Control : Microsoft_UI_Xaml_FrameworkElement {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_ContentControl : Microsoft_UI_Xaml_Controls_Control {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_UserControl : Microsoft_UI_Xaml_Controls_ContentControl {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_Page : Microsoft_UI_Xaml_Controls_UserControl {
}
	-(void) layoutSubviews;
	-(id) init;
@end

@interface Unoapp1_SplashScreen : Microsoft_UI_Xaml_Controls_Page {
}
	-(id) init;
@end

@interface UnoAppDelegate : NSObject<UIApplicationDelegate> {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(BOOL) application:(UIApplication *)p0 didFinishLaunchingWithOptions:(NSDictionary *)p1;
	-(BOOL) application:(UIApplication *)p0 continueUserActivity:(NSUserActivity *)p1 restorationHandler:(void (^)(id *))p2;
	-(void) application:(UIApplication *)p0 didUpdateUserActivity:(NSUserActivity *)p1;
	-(BOOL) application:(UIApplication *)p0 openURL:(NSURL *)p1 options:(NSDictionary *)p2;
	-(void) application:(UIApplication *)p0 performActionForShortcutItem:(UIApplicationShortcutItem *)p1 completionHandler:(void (^)(BOOL))p2;
	-(NSUInteger) application:(UIApplication *)p0 supportedInterfaceOrientationsForWindow:(UIWindow *)p1;
	-(NSString *) getApplicationDataPath;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@interface UnoApp1_App : UnoAppDelegate<UIApplicationDelegate> {
}
	-(id) init;
@end

@interface UnoApp1_Pages_Registration_RegisterHomePage : Microsoft_UI_Xaml_Controls_Page {
}
	-(id) init;
@end

@interface UnoApp1_Pages_Control_HomeControlPage : Microsoft_UI_Xaml_Controls_Page {
}
	-(id) init;
@end

@interface UnoApp1_Pages_Authentication_EmailConfirmationPage : Microsoft_UI_Xaml_Controls_Page {
}
	-(id) init;
@end

@interface UnoApp1_Pages_Authentication_LoginPage : Microsoft_UI_Xaml_Controls_Page {
}
	-(id) init;
@end

@interface UnoApp1_Pages_Authentication_SignUpPage : Microsoft_UI_Xaml_Controls_Page {
}
	-(id) init;
@end

@interface SkiaSharp_Views_Windows_SKSwapChainPanel : Microsoft_UI_Xaml_FrameworkElement {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_Panel : Microsoft_UI_Xaml_FrameworkElement {
}
	-(void) didAddSubview:(UIView *)p0;
	-(UIView *) hitTest:(CGPoint)p0 withEvent:(UIEvent *)p1;
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_Canvas : Microsoft_UI_Xaml_Controls_Panel {
}
	-(id) init;
@end

@interface SkiaSharp_Views_Windows_SKXamlCanvas : Microsoft_UI_Xaml_Controls_Canvas {
}
	-(void) drawRect:(CGRect)p0;
	-(void) willMoveToWindow:(UIWindow *)p0;
	-(id) init;
@end

@interface Uno_Material_Ripple : Microsoft_UI_Xaml_Controls_ContentControl {
}
	-(id) init;
@end

@interface Microsoft_iOS__UIKit_UIScrollViewDelegate : NSObject<UIScrollViewDelegate> {
}
	-(id) init;
@end

@interface Uno_Toolkit_UI_CardContentControl : Microsoft_UI_Xaml_Controls_ContentControl {
}
	-(id) init;
@end

@interface Uno_Toolkit_UI_Card : Microsoft_UI_Xaml_Controls_Control {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_Primitives_ButtonBase : Microsoft_UI_Xaml_Controls_ContentControl {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_Primitives_ToggleButton : Microsoft_UI_Xaml_Controls_Primitives_ButtonBase {
}
	-(id) init;
@end

@interface Uno_Toolkit_UI_Chip : Microsoft_UI_Xaml_Controls_Primitives_ToggleButton {
}
	-(id) init;
@end

@interface Uno_Toolkit_UI_Divider : Microsoft_UI_Xaml_Controls_Control {
}
	-(id) init;
@end

@interface Uno_Toolkit_UI_DrawerControl : Microsoft_UI_Xaml_Controls_ContentControl {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_Border : Microsoft_UI_Xaml_FrameworkElement {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_Primitives_SelectorItem : Microsoft_UI_Xaml_Controls_ContentControl {
}
	-(id) init;
@end

@interface Uno_Toolkit_UI_TabBarItem : Microsoft_UI_Xaml_Controls_Primitives_SelectorItem {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_RelativePanel : Microsoft_UI_Xaml_Controls_Panel {
}
	-(id) init;
@end

@interface Uno_Toolkit_UI_AutoLayout : Microsoft_UI_Xaml_Controls_RelativePanel {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_ItemsControl : Microsoft_UI_Xaml_Controls_Control {
}
	-(id) init;
@end

@interface Uno_Toolkit_UI_ChipGroup : Microsoft_UI_Xaml_Controls_ItemsControl {
}
	-(id) init;
@end

@interface Uno_Toolkit_UI_DrawerFlyoutPresenter : Microsoft_UI_Xaml_Controls_ContentControl {
}
	-(id) init;
@end

@interface Uno_Toolkit_UI_LoadingView : Microsoft_UI_Xaml_Controls_ContentControl {
}
	-(id) init;
@end

@interface Uno_Toolkit_UI_ExtendedSplashScreen : Uno_Toolkit_UI_LoadingView {
}
	-(id) init;
@end

@interface Uno_Toolkit_UI_CompositeLoadableSource : Microsoft_UI_Xaml_FrameworkElement {
}
	-(id) init;
@end

@interface Uno_Toolkit_UI_LoadableSource : Microsoft_UI_Xaml_FrameworkElement {
}
	-(id) init;
@end

@interface Microsoft_iOS__UIKit_UINavigationControllerDelegate : NSObject<UINavigationControllerDelegate> {
}
	-(id) init;
@end

@interface Uno_Toolkit_UI_NativeFramePresenter : Microsoft_UI_Xaml_FrameworkElement {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_ContentPresenter : Microsoft_UI_Xaml_FrameworkElement {
}
	-(void) layoutSubviews;
	-(id) init;
@end

@interface Uno_Toolkit_UI_NativeNavigationBarPresenter : Microsoft_UI_Xaml_Controls_ContentPresenter {
}
	-(id) init;
@end

@interface Uno_Toolkit_UI_NavigationBar : Microsoft_UI_Xaml_Controls_ContentControl {
}
	-(id) init;
@end

@interface Uno_Toolkit_UI_NavigationBarPresenter : Microsoft_UI_Xaml_Controls_Control {
}
	-(id) init;
@end

@interface Uno_Toolkit_UI_ResponsiveView : Microsoft_UI_Xaml_Controls_ContentControl {
}
	-(id) init;
@end

@interface Uno_Toolkit_UI_SafeArea : Microsoft_UI_Xaml_Controls_ContentControl {
}
	-(id) init;
@end

@interface Uno_Toolkit_UI_TabBar : Microsoft_UI_Xaml_Controls_ItemsControl {
}
	-(id) init;
@end

@interface Uno_Toolkit_UI_TabBarListPanel : Microsoft_UI_Xaml_Controls_Panel {
}
	-(id) init;
@end

@interface Uno_Toolkit_UI_TabBarSelectionIndicatorPresenter : Microsoft_UI_Xaml_Controls_ContentControl {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_Grid : Microsoft_UI_Xaml_Controls_Panel {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_ContentDialog : Microsoft_UI_Xaml_Controls_ContentControl {
}
	-(id) init;
@end

@interface Uno_UI_Toolkit_ElevatedView : Microsoft_UI_Xaml_Controls_Control {
}
	-(id) init;
@end

@interface Uno_Diagnostics_UI_DiagnosticsOverlay : Microsoft_UI_Xaml_Controls_Control {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Shapes_Shape : Microsoft_UI_Xaml_FrameworkElement {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Shapes_Ellipse : Microsoft_UI_Xaml_Shapes_Shape {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Shapes_Line : Microsoft_UI_Xaml_Shapes_Shape {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Shapes_Path : Microsoft_UI_Xaml_Shapes_Shape {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Shapes_Rectangle : Microsoft_UI_Xaml_Shapes_Shape {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Documents_Glyphs : Microsoft_UI_Xaml_FrameworkElement {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_AnimatedVisualPlayer : Microsoft_UI_Xaml_FrameworkElement {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_AnnotatedScrollBar : Microsoft_UI_Xaml_Controls_Control {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_AppBarElementContainer : Microsoft_UI_Xaml_Controls_ContentControl {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_AppBarSeparator : Microsoft_UI_Xaml_Controls_Control {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_AppBarToggleButton : Microsoft_UI_Xaml_Controls_Primitives_ToggleButton {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_Button : Microsoft_UI_Xaml_Controls_Primitives_ButtonBase {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_CheckBox : Microsoft_UI_Xaml_Controls_Primitives_ToggleButton {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_ComboBoxItem : Microsoft_UI_Xaml_Controls_Primitives_SelectorItem {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_DatePickerFlyoutPresenter : Microsoft_UI_Xaml_Controls_Control {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_DropDownButton : Microsoft_UI_Xaml_Controls_Button {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_Primitives_Selector : Microsoft_UI_Xaml_Controls_ItemsControl {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_FlipView : Microsoft_UI_Xaml_Controls_Primitives_Selector {
}
	-(void) layoutSubviews;
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_FlipViewItem : Microsoft_UI_Xaml_Controls_Primitives_SelectorItem {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_FlyoutPresenter : Microsoft_UI_Xaml_Controls_ContentControl {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_ListViewBase : Microsoft_UI_Xaml_Controls_Primitives_Selector {
}
	-(void) didMoveToWindow;
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_GridView : Microsoft_UI_Xaml_Controls_ListViewBase {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_ListViewBaseHeaderItem : Microsoft_UI_Xaml_Controls_ContentControl {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_GridViewHeaderItem : Microsoft_UI_Xaml_Controls_ListViewBaseHeaderItem {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_GridViewItem : Microsoft_UI_Xaml_Controls_Primitives_SelectorItem {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_GroupItem : Microsoft_UI_Xaml_Controls_ContentControl {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_Hub : Microsoft_UI_Xaml_Controls_Control {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_HubSection : Microsoft_UI_Xaml_Controls_Control {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_IconElement : Microsoft_UI_Xaml_FrameworkElement {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_ImageIcon : Microsoft_UI_Xaml_Controls_IconElement {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_InfoBadge : Microsoft_UI_Xaml_Controls_Control {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_InfoBar : Microsoft_UI_Xaml_Controls_Control {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_ListBox : Microsoft_UI_Xaml_Controls_Primitives_Selector {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_ListBoxItem : Microsoft_UI_Xaml_Controls_Primitives_SelectorItem {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_ListPickerFlyoutPresenter : Microsoft_UI_Xaml_Controls_Control {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_ListView : Microsoft_UI_Xaml_Controls_ListViewBase {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_ListViewHeaderItem : Microsoft_UI_Xaml_Controls_ListViewBaseHeaderItem {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_ListViewItem : Microsoft_UI_Xaml_Controls_Primitives_SelectorItem {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_MapControl : Microsoft_UI_Xaml_Controls_Control {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_MenuBar : Microsoft_UI_Xaml_Controls_Control {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_MenuFlyoutItemBase : Microsoft_UI_Xaml_Controls_Control {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_MenuFlyoutSeparator : Microsoft_UI_Xaml_Controls_MenuFlyoutItemBase {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_NavigationViewItemBase : Microsoft_UI_Xaml_Controls_ContentControl {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_NavigationViewItemHeader : Microsoft_UI_Xaml_Controls_NavigationViewItemBase {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_NavigationViewItemSeparator : Microsoft_UI_Xaml_Controls_NavigationViewItemBase {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_ParallaxView : Microsoft_UI_Xaml_FrameworkElement {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_PersonPicture : Microsoft_UI_Xaml_Controls_Control {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_PickerFlyoutPresenter : Microsoft_UI_Xaml_Controls_ContentControl {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_PivotItem : Microsoft_UI_Xaml_Controls_ContentControl {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_Primitives_RangeBase : Microsoft_UI_Xaml_Controls_Control {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_ProgressBar : Microsoft_UI_Xaml_Controls_Primitives_RangeBase {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_RadioButton : Microsoft_UI_Xaml_Controls_Primitives_ToggleButton {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_RefreshVisualizer : Microsoft_UI_Xaml_Controls_Control {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_Primitives_ListViewItemPresenter : Microsoft_UI_Xaml_Controls_ContentPresenter {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_RevealListViewItemPresenter : Microsoft_UI_Xaml_Controls_Primitives_ListViewItemPresenter {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_RichEditBox : Microsoft_UI_Xaml_Controls_Control {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_RichTextBlock : Microsoft_UI_Xaml_FrameworkElement {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_RichTextBlockOverflow : Microsoft_UI_Xaml_FrameworkElement {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_ScrollContentPresenter : Microsoft_UI_Xaml_Controls_ContentPresenter {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_SelectorBar : Microsoft_UI_Xaml_Controls_Control {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_ItemContainer : Microsoft_UI_Xaml_Controls_Control {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_SelectorBarItem : Microsoft_UI_Xaml_Controls_ItemContainer {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_SemanticZoom : Microsoft_UI_Xaml_Controls_Control {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_SwapChainBackgroundPanel : Microsoft_UI_Xaml_Controls_Grid {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_SwapChainPanel : Microsoft_UI_Xaml_Controls_Grid {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_TabViewItem : Microsoft_UI_Xaml_Controls_ListViewItem {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_TimePickerFlyoutPresenter : Microsoft_UI_Xaml_Controls_FlyoutPresenter {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_SplitButton : Microsoft_UI_Xaml_Controls_ContentControl {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_ToggleSplitButton : Microsoft_UI_Xaml_Controls_SplitButton {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_ToolTip : Microsoft_UI_Xaml_Controls_ContentControl {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_TreeView : Microsoft_UI_Xaml_Controls_Control {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_Viewbox : Microsoft_UI_Xaml_FrameworkElement {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_VirtualizingPanel : Microsoft_UI_Xaml_Controls_Panel {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_Primitives_OrientedVirtualizingPanel : Microsoft_UI_Xaml_Controls_VirtualizingPanel {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_VirtualizingStackPanel : Microsoft_UI_Xaml_Controls_Primitives_OrientedVirtualizingPanel {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_WrapGrid : Microsoft_UI_Xaml_Controls_Primitives_OrientedVirtualizingPanel {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_TextBlock : Microsoft_UI_Xaml_FrameworkElement {
}
	-(void) drawRect:(CGRect)p0;
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_ImplicitTextBlock : Microsoft_UI_Xaml_Controls_TextBlock {
}
	-(id) init;
@end

@interface Microsoft_iOS__UIKit_UICollectionViewSource : NSObject<UICollectionViewDataSource, UICollectionViewDelegate, UIScrollViewDelegate> {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_FlipViewSource : NSObject<UICollectionViewDataSource, UICollectionViewDelegate, UIScrollViewDelegate> {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(UICollectionViewCell *) collectionView:(UICollectionView *)p0 cellForItemAtIndexPath:(NSIndexPath *)p1;
	-(void *) collectionView:(UICollectionView *)p0 numberOfItemsInSection:(void *)p1;
	-(void *) numberOfSectionsInCollectionView:(UICollectionView *)p0;
	-(void) scrollViewDidEndDragging:(UIScrollView *)p0 willDecelerate:(BOOL)p1;
	-(void) scrollViewDidEndDecelerating:(UIScrollView *)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_PagedCollectionView : UICollectionView {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) layoutSubviews;
	-(CGSize) contentSize;
	-(void) setContentSize:(CGSize)p0;
	-(BOOL) isDragging;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_NativeFlipView : Microsoft_UI_Xaml_Controls_PagedCollectionView {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_VirtualizingPanelLayout : UICollectionViewLayout {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(NSArray *) layoutAttributesForElementsInRect:(CGRect)p0;
	-(UICollectionViewLayoutAttributes *) layoutAttributesForItemAtIndexPath:(NSIndexPath *)p0;
	-(UICollectionViewLayoutAttributes *) layoutAttributesForSupplementaryViewOfKind:(NSString *)p0 atIndexPath:(NSIndexPath *)p1;
	-(CGSize) collectionViewContentSize;
	-(void) prepareLayout;
	-(void) prepareForCollectionViewUpdates:(NSArray *)p0;
	-(void) finalizeCollectionViewUpdates;
	-(UICollectionViewLayoutAttributes *) initialLayoutAttributesForAppearingItemAtIndexPath:(NSIndexPath *)p0;
	-(UICollectionViewLayoutAttributes *) finalLayoutAttributesForDisappearingItemAtIndexPath:(NSIndexPath *)p0;
	-(BOOL) shouldInvalidateLayoutForBoundsChange:(CGRect)p0;
	-(void) invalidateLayout;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_ListViewBaseScrollContentPresenter : Microsoft_UI_Xaml_Controls_ScrollContentPresenter {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_UnsetLayout : Microsoft_UI_Xaml_Controls_VirtualizingPanelLayout {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_NativePage : UIViewController {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_PickerItem : Microsoft_UI_Xaml_Controls_Primitives_SelectorItem {
}
	-(id) init;
@end

@interface Microsoft_iOS__UIKit_UIPickerViewModel : NSObject<UIPickerViewDataSource, UIPickerViewDelegate> {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_PickerModel : NSObject<UIPickerViewDataSource, UIPickerViewDelegate> {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(NSString *) pickerView:(UIPickerView *)p0 titleForRow:(void *)p1 forComponent:(void *)p2;
	-(void *) numberOfComponentsInPickerView:(UIPickerView *)p0;
	-(void *) pickerView:(UIPickerView *)p0 numberOfRowsInComponent:(void *)p1;
	-(CGFloat) pickerView:(UIPickerView *)p0 rowHeightForComponent:(void *)p1;
	-(CGFloat) pickerView:(UIPickerView *)p0 widthForComponent:(void *)p1;
	-(UIView *) pickerView:(UIPickerView *)p0 viewForRow:(void *)p1 forComponent:(void *)p2 reusingView:(UIView *)p3;
	-(void) pickerView:(UIPickerView *)p0 didSelectRow:(void *)p1 inComponent:(void *)p2;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface Microsoft_UI_Xaml_Controls_Primitives_Popup : Microsoft_UI_Xaml_FrameworkElement {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_NativePopupBase : Microsoft_UI_Xaml_Controls_Primitives_Popup {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_Popover : Microsoft_UI_Xaml_Controls_NativePopupBase {
}
	-(id) init;
@end

@interface Microsoft_iOS__UIKit_UITextViewDelegate : NSObject<UIScrollViewDelegate, UITextViewDelegate> {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_MultilineTextBoxDelegate : NSObject<UIScrollViewDelegate, UITextViewDelegate> {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) textViewDidChange:(UITextView *)p0;
	-(void) textViewDidBeginEditing:(UITextView *)p0;
	-(void) textViewDidEndEditing:(UITextView *)p0;
	-(BOOL) textView:(UITextView *)p0 shouldChangeTextInRange:(NSRange)p1 replacementText:(NSString *)p2;
	-(BOOL) textViewShouldEndEditing:(UITextView *)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface Microsoft_iOS__WebKit_WKUIDelegate : NSObject<WKUIDelegate> {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_UnoWKWebView : WKWebView<WKScriptMessageHandler> {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) didChangeValueForKey:(NSString *)p0;
	-(BOOL) canGoBack;
	-(BOOL) canGoForward;
	-(void) userContentController:(WKUserContentController *)p0 didReceiveScriptMessage:(WKScriptMessage *)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_NativeWebView : Microsoft_UI_Xaml_Controls_UnoWKWebView<WKScriptMessageHandler> {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_WindowView : UIView {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) didMoveToSuperview;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_WrapPanel : Microsoft_UI_Xaml_Controls_Panel {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_StackPanel : Microsoft_UI_Xaml_Controls_Panel {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_Primitives_CarouselPanel : Microsoft_UI_Xaml_Controls_StackPanel {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_Slider : Microsoft_UI_Xaml_Controls_Primitives_RangeBase {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_Primitives_ColorPickerSlider : Microsoft_UI_Xaml_Controls_Slider {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_AppBar : Microsoft_UI_Xaml_Controls_ContentControl {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_CommandBar : Microsoft_UI_Xaml_Controls_AppBar {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_Primitives_CommandBarFlyoutCommandBar : Microsoft_UI_Xaml_Controls_CommandBar {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_Primitives_GridViewItemPresenter : Microsoft_UI_Xaml_Controls_ContentPresenter {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_Primitives_InfoBarPanel : Microsoft_UI_Xaml_Controls_Panel {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_Primitives_LoopingSelectorPanel : Microsoft_UI_Xaml_Controls_Canvas {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_Primitives_MonochromaticOverlayPresenter : Microsoft_UI_Xaml_Controls_Grid {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_Primitives_PivotHeaderItem : Microsoft_UI_Xaml_Controls_ContentControl {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_Primitives_PivotHeaderPanel : Microsoft_UI_Xaml_Controls_Canvas {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_Primitives_PivotPanel : Microsoft_UI_Xaml_Controls_Panel {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_Primitives_RepeatButton : Microsoft_UI_Xaml_Controls_Primitives_ButtonBase {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_Primitives_TabViewListView : Microsoft_UI_Xaml_Controls_ListView {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_Primitives_Thumb : Microsoft_UI_Xaml_Controls_Control {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_Primitives_TickBar : Microsoft_UI_Xaml_FrameworkElement {
}
	-(id) init;
@end

@interface Uno_UI_Xaml_Controls_NativeRefreshControl : UIRefreshControl {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@interface Microsoft_iOS__UIKit_UIGestureRecognizerDelegate : NSObject<UIGestureRecognizerDelegate> {
}
	-(id) init;
@end

@interface Uno_UI_Views_Controls_DataTemplateSelectorControl : Microsoft_UI_Xaml_Controls_ContentControl {
}
	-(id) init;
@end

@interface Uno_UI_Controls_LineView : UIView {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@interface Microsoft_iOS__UIKit_UIViewControllerTransitioningDelegate : NSObject<UIViewControllerTransitioningDelegate> {
}
	-(id) init;
@end

@interface Uno_UI_Controls_ViewControllerTransitioningDeligate : NSObject<UIViewControllerTransitioningDelegate> {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(id) animationControllerForPresentedController:(UIViewController *)p0 presentingController:(UIViewController *)p1 sourceController:(UIViewController *)p2;
	-(id) animationControllerForDismissedController:(UIViewController *)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface Uno_UI_Views_Controls_BindableUICollectionView : UICollectionView {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) didMoveToWindow;
	-(void) willMoveToSuperview:(UIView *)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface Uno_UI_Controls_Legacy_ListViewBase : Uno_UI_Views_Controls_BindableUICollectionView {
}
	-(CGSize) sizeThatFits:(CGSize)p0;
	-(void) setNeedsLayout;
	-(void *) numberOfItemsInSection:(void *)p0;
	-(void) didMoveToWindow;
	-(void) willMoveToSuperview:(UIView *)p0;
	-(CGRect) frame;
	-(void) setFrame:(CGRect)p0;
	-(void) didMoveToSuperview;
	-(BOOL) isHidden;
	-(void) setHidden:(BOOL)p0;
	-(UIView *) hitTest:(CGPoint)p0 withEvent:(UIEvent *)p1;
	-(NSString *) getDependencyPropertyValue:(NSString *)p0;
	-(NSString *) setDependencyPropertyValue:(NSString *)p0;
	-(BOOL) accessibilityActivate;
	-(BOOL) isAccessibilityElement;
	-(void) setIsAccessibilityElement:(BOOL)p0;
@end

@interface Uno_UI_Controls_Legacy_GridView : Uno_UI_Controls_Legacy_ListViewBase {
}
	-(id) init;
@end

@interface Uno_UI_Controls_Legacy_ListViewBaseSource : NSObject<UICollectionViewDataSource, UICollectionViewDelegate, UIScrollViewDelegate> {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void *) numberOfSectionsInCollectionView:(UICollectionView *)p0;
	-(void *) collectionView:(UICollectionView *)p0 numberOfItemsInSection:(void *)p1;
	-(BOOL) collectionView:(UICollectionView *)p0 shouldSelectItemAtIndexPath:(NSIndexPath *)p1;
	-(void) collectionView:(UICollectionView *)p0 didEndDisplayingCell:(UICollectionViewCell *)p1 forItemAtIndexPath:(NSIndexPath *)p2;
	-(UICollectionViewCell *) collectionView:(UICollectionView *)p0 cellForItemAtIndexPath:(NSIndexPath *)p1;
	-(void) collectionView:(UICollectionView *)p0 willDisplayCell:(UICollectionViewCell *)p1 forItemAtIndexPath:(NSIndexPath *)p2;
	-(BOOL) collectionView:(UICollectionView *)p0 shouldHighlightItemAtIndexPath:(NSIndexPath *)p1;
	-(void) collectionView:(UICollectionView *)p0 didUnhighlightItemAtIndexPath:(NSIndexPath *)p1;
	-(void) collectionView:(UICollectionView *)p0 didHighlightItemAtIndexPath:(NSIndexPath *)p1;
	-(UICollectionReusableView *) collectionView:(UICollectionView *)p0 viewForSupplementaryElementOfKind:(NSString *)p1 atIndexPath:(NSIndexPath *)p2;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@interface Uno_UI_Controls_Legacy_GridViewSource : Uno_UI_Controls_Legacy_ListViewBaseSource<UICollectionViewDataSource, UICollectionViewDelegate, UIScrollViewDelegate> {
}
@end

@interface Uno_UI_Controls_Legacy_ListView : Uno_UI_Controls_Legacy_ListViewBase {
}
	-(CGSize) sizeThatFits:(CGSize)p0;
	-(void) didMoveToSuperview;
	-(id) init;
@end

@interface Uno_UI_Controls_Legacy_ListViewSource : Uno_UI_Controls_Legacy_ListViewBaseSource<UICollectionViewDataSource, UICollectionViewDelegate, UIScrollViewDelegate> {
}
@end

@interface Uno_UI_Views_Controls_BindableUIActivityIndicatorView : UIActivityIndicatorView {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) didMoveToWindow;
	-(void) willMoveToSuperview:(UIView *)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@interface Uno_UI_Controls_Legacy_ProgressRing : Microsoft_UI_Xaml_Controls_Control {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_ElementStub : Microsoft_UI_Xaml_FrameworkElement {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Shapes_Polygon : Microsoft_UI_Xaml_Shapes_Shape {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Shapes_Polyline : Microsoft_UI_Xaml_Shapes_Shape {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_AnimatedIcon : Microsoft_UI_Xaml_Controls_IconElement {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_AppBarButton : Microsoft_UI_Xaml_Controls_Button {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_AutoSuggestBox : Microsoft_UI_Xaml_Controls_ItemsControl {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_BitmapIcon : Microsoft_UI_Xaml_Controls_IconElement {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_BreadcrumbBar : Microsoft_UI_Xaml_Controls_Control {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_BreadcrumbBarItem : Microsoft_UI_Xaml_Controls_ContentControl {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_CalendarDatePicker : Microsoft_UI_Xaml_Controls_Control {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_CalendarView : Microsoft_UI_Xaml_Controls_Control {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_CalendarViewBaseItem : Microsoft_UI_Xaml_Controls_Control {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_CalendarViewDayItem : Microsoft_UI_Xaml_Controls_CalendarViewBaseItem {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_ColorPicker : Microsoft_UI_Xaml_Controls_Control {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_ComboBox : Microsoft_UI_Xaml_Controls_Primitives_Selector {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_CommandBarOverflowPresenter : Microsoft_UI_Xaml_Controls_ItemsControl {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_DatePicker : Microsoft_UI_Xaml_Controls_Control {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_Expander : Microsoft_UI_Xaml_Controls_ContentControl {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_FontIcon : Microsoft_UI_Xaml_Controls_IconElement {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_Frame : Microsoft_UI_Xaml_Controls_ContentControl {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_HyperlinkButton : Microsoft_UI_Xaml_Controls_Primitives_ButtonBase {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_IconSourceElement : Microsoft_UI_Xaml_Controls_IconElement {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_Image : Microsoft_UI_Xaml_FrameworkElement {
}
	-(void) layoutSubviews;
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_ItemsPresenter : Microsoft_UI_Xaml_FrameworkElement {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_ItemsRepeater : Microsoft_UI_Xaml_FrameworkElement {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_ItemsRepeaterScrollHost : Microsoft_UI_Xaml_FrameworkElement {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_ItemsStackPanel : Microsoft_UI_Xaml_Controls_Panel {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_ItemsView : Microsoft_UI_Xaml_Controls_Control {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_ItemsWrapGrid : Microsoft_UI_Xaml_Controls_Panel {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_MediaPlayerElement : Microsoft_UI_Xaml_Controls_Control {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_MediaPlayerPresenter : Microsoft_UI_Xaml_Controls_Border {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_MediaTransportControls : Microsoft_UI_Xaml_Controls_Control {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_MenuBarItem : Microsoft_UI_Xaml_Controls_Control {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_MenuFlyoutItem : Microsoft_UI_Xaml_Controls_MenuFlyoutItemBase {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_MenuFlyoutPresenter : Microsoft_UI_Xaml_Controls_ItemsControl {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_MenuFlyoutSubItem : Microsoft_UI_Xaml_Controls_MenuFlyoutItemBase {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_NavigationView : Microsoft_UI_Xaml_Controls_ContentControl {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_NavigationViewItem : Microsoft_UI_Xaml_Controls_NavigationViewItemBase {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_NumberBox : Microsoft_UI_Xaml_Controls_Control {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_TextBox : Microsoft_UI_Xaml_Controls_Control {
}
	-(BOOL) becomeFirstResponder;
	-(UIView *) hitTest:(CGPoint)p0 withEvent:(UIEvent *)p1;
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_PasswordBox : Microsoft_UI_Xaml_Controls_TextBox {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_PathIcon : Microsoft_UI_Xaml_Controls_IconElement {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_PipsPager : Microsoft_UI_Xaml_Controls_Control {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_Pivot : Microsoft_UI_Xaml_Controls_ItemsControl {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_ProgressRing : Microsoft_UI_Xaml_Controls_Control {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_RadioButtons : Microsoft_UI_Xaml_Controls_Control {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_ToggleMenuFlyoutItem : Microsoft_UI_Xaml_Controls_MenuFlyoutItem {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_RadioMenuFlyoutItem : Microsoft_UI_Xaml_Controls_ToggleMenuFlyoutItem {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_RatingControl : Microsoft_UI_Xaml_Controls_Control {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_RefreshContainer : Microsoft_UI_Xaml_Controls_ContentControl {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_ScrollView : Microsoft_UI_Xaml_Controls_Control {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_ScrollViewer : Microsoft_UI_Xaml_Controls_ContentControl {
}
	-(void) willMoveToSuperview:(UIView *)p0;
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_SplitView : Microsoft_UI_Xaml_Controls_Control {
}
	-(void) layoutSubviews;
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_SwipeControl : Microsoft_UI_Xaml_Controls_ContentControl {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_SymbolIcon : Microsoft_UI_Xaml_Controls_IconElement {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_TabView : Microsoft_UI_Xaml_Controls_Control {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_TeachingTip : Microsoft_UI_Xaml_Controls_ContentControl {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_TimePicker : Microsoft_UI_Xaml_Controls_Control {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_ToggleSwitch : Microsoft_UI_Xaml_Controls_Control {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_TreeViewItem : Microsoft_UI_Xaml_Controls_ListViewItem {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_TreeViewList : Microsoft_UI_Xaml_Controls_ListView {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_TwoPaneView : Microsoft_UI_Xaml_Controls_Control {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_VariableSizedWrapGrid : Microsoft_UI_Xaml_Controls_Panel {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_WebView2 : Microsoft_UI_Xaml_Controls_Control {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_LayoutPanel : Microsoft_UI_Xaml_Controls_Panel {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_PagerControl : Microsoft_UI_Xaml_Controls_Control {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_DatePickerSelector : Microsoft_UI_Xaml_Controls_ContentControl {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_ListViewBaseSource : NSObject<UICollectionViewDataSource, UICollectionViewDelegate, UIScrollViewDelegate> {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void *) numberOfSectionsInCollectionView:(UICollectionView *)p0;
	-(void *) collectionView:(UICollectionView *)p0 numberOfItemsInSection:(void *)p1;
	-(void) collectionView:(UICollectionView *)p0 didEndDisplayingCell:(UICollectionViewCell *)p1 forItemAtIndexPath:(NSIndexPath *)p2;
	-(UICollectionViewCell *) collectionView:(UICollectionView *)p0 cellForItemAtIndexPath:(NSIndexPath *)p1;
	-(void) collectionView:(UICollectionView *)p0 willDisplayCell:(UICollectionViewCell *)p1 forItemAtIndexPath:(NSIndexPath *)p2;
	-(UICollectionReusableView *) collectionView:(UICollectionView *)p0 viewForSupplementaryElementOfKind:(NSString *)p1 atIndexPath:(NSIndexPath *)p2;
	-(void) scrollViewDidScroll:(UIScrollView *)p0;
	-(void) scrollViewWillBeginDragging:(UIScrollView *)p0;
	-(void) scrollViewDidEndDragging:(UIScrollView *)p0 willDecelerate:(BOOL)p1;
	-(void) scrollViewDidEndDecelerating:(UIScrollView *)p0;
	-(void) scrollViewDidEndScrollingAnimation:(UIScrollView *)p0;
	-(void) scrollViewDidZoom:(UIScrollView *)p0;
	-(void) scrollViewWillEndDragging:(UIScrollView *)p0 withVelocity:(CGPoint)p1 targetContentOffset:(CGPoint*)p2;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_NativeListViewBase : UICollectionView {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(CGSize) sizeThatFits:(CGSize)p0;
	-(void) insertItemsAtIndexPaths:(NSArray *)p0;
	-(void) insertSections:(NSIndexSet *)p0;
	-(void) deleteItemsAtIndexPaths:(NSArray *)p0;
	-(void) deleteSections:(NSIndexSet *)p0;
	-(void) reloadItemsAtIndexPaths:(NSArray *)p0;
	-(void) reloadSections:(NSIndexSet *)p0;
	-(void) setNeedsLayout;
	-(void) layoutSubviews;
	-(void) setContentOffset:(CGPoint)p0 animated:(BOOL)p1;
	-(void *) numberOfItemsInSection:(void *)p0;
	-(void) touchesBegan:(NSSet *)p0 withEvent:(UIEvent *)p1;
	-(void) touchesMoved:(NSSet *)p0 withEvent:(UIEvent *)p1;
	-(void) touchesEnded:(NSSet *)p0 withEvent:(UIEvent *)p1;
	-(void) touchesCancelled:(NSSet *)p0 withEvent:(UIEvent *)p1;
	-(void) didMoveToWindow;
	-(void) willMoveToSuperview:(UIView *)p0;
	-(CGRect) frame;
	-(void) setFrame:(CGRect)p0;
	-(void) didMoveToSuperview;
	-(BOOL) isHidden;
	-(void) setHidden:(BOOL)p0;
	-(UIView *) hitTest:(CGPoint)p0 withEvent:(UIEvent *)p1;
	-(NSString *) getDependencyPropertyValue:(NSString *)p0;
	-(NSString *) setDependencyPropertyValue:(NSString *)p0;
	-(BOOL) accessibilityActivate;
	-(BOOL) isAccessibilityElement;
	-(void) setIsAccessibilityElement:(BOOL)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_Picker : UIPickerView {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(CGSize) sizeThatFits:(CGSize)p0;
	-(void) willMoveToSuperview:(UIView *)p0;
	-(void) layoutSubviews;
	-(void) setNeedsLayout;
	-(CGRect) frame;
	-(void) setFrame:(CGRect)p0;
	-(void) didMoveToSuperview;
	-(BOOL) isHidden;
	-(void) setHidden:(BOOL)p0;
	-(UIView *) hitTest:(CGPoint)p0 withEvent:(UIEvent *)p1;
	-(NSString *) getDependencyPropertyValue:(NSString *)p0;
	-(NSString *) setDependencyPropertyValue:(NSString *)p0;
	-(BOOL) accessibilityActivate;
	-(BOOL) isAccessibilityElement;
	-(void) setIsAccessibilityElement:(BOOL)p0;
	-(void) didMoveToWindow;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_NativePivotPresenter : Microsoft_UI_Xaml_Controls_Control {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_MultilineTextBoxView : UITextView<UIKeyInput, UITextInput, UITextInputTraits> {
}
	@property (nonatomic, assign) void * selectedTextRange;
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void *) selectedTextRange;
	-(void) setSelectedTextRange:(void *)p0;
	-(void) paste:(NSObject *)p0;
	-(void) pasteAndGo:(NSObject *)p0;
	-(void) pasteAndMatchStyle:(NSObject *)p0;
	-(void) pasteAndSearch:(NSObject *)p0;
	-(void) pasteItemProviders:(NSArray *)p0;
	-(NSString *) text;
	-(void) setText:(NSString *)p0;
	-(CGSize) sizeThatFits:(CGSize)p0;
	-(void) willMoveToSuperview:(UIView *)p0;
	-(void) layoutSubviews;
	-(void) setNeedsLayout;
	-(CGRect) frame;
	-(void) setFrame:(CGRect)p0;
	-(void) didMoveToSuperview;
	-(BOOL) isHidden;
	-(void) setHidden:(BOOL)p0;
	-(UIView *) hitTest:(CGPoint)p0 withEvent:(UIEvent *)p1;
	-(NSString *) getDependencyPropertyValue:(NSString *)p0;
	-(NSString *) setDependencyPropertyValue:(NSString *)p0;
	-(BOOL) accessibilityActivate;
	-(BOOL) isAccessibilityElement;
	-(void) setIsAccessibilityElement:(BOOL)p0;
	-(void) didMoveToWindow;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@interface Microsoft_iOS__UIKit_UITextFieldDelegate : NSObject<UITextFieldDelegate> {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_SinglelineTextBoxDelegate : NSObject<UITextFieldDelegate> {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(BOOL) textField:(UITextField *)p0 shouldChangeCharactersInRange:(NSRange)p1 replacementString:(NSString *)p2;
	-(BOOL) textFieldShouldReturn:(UITextField *)p0;
	-(void) textFieldDidBeginEditing:(UITextField *)p0;
	-(void) textFieldDidEndEditing:(UITextField *)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface Microsoft_UI_Xaml_Controls_SinglelineTextBoxView : UITextField<UIKeyInput, UITextInput, UITextInputTraits> {
}
	@property (nonatomic, assign) void * selectedTextRange;
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void *) selectedTextRange;
	-(void) setSelectedTextRange:(void *)p0;
	-(void) paste:(NSObject *)p0;
	-(void) pasteAndGo:(NSObject *)p0;
	-(void) pasteAndMatchStyle:(NSObject *)p0;
	-(void) pasteAndSearch:(NSObject *)p0;
	-(void) pasteItemProviders:(NSArray *)p0;
	-(NSString *) text;
	-(void) setText:(NSString *)p0;
	-(BOOL) becomeFirstResponder;
	-(CGSize) sizeThatFits:(CGSize)p0;
	-(CGRect) textRectForBounds:(CGRect)p0;
	-(CGRect) placeholderRectForBounds:(CGRect)p0;
	-(CGRect) editingRectForBounds:(CGRect)p0;
	-(void) willMoveToSuperview:(UIView *)p0;
	-(void) layoutSubviews;
	-(void) setNeedsLayout;
	-(CGRect) frame;
	-(void) setFrame:(CGRect)p0;
	-(void) didMoveToSuperview;
	-(BOOL) isHidden;
	-(void) setHidden:(BOOL)p0;
	-(UIView *) hitTest:(CGPoint)p0 withEvent:(UIEvent *)p1;
	-(NSString *) getDependencyPropertyValue:(NSString *)p0;
	-(NSString *) setDependencyPropertyValue:(NSString *)p0;
	-(BOOL) accessibilityActivate;
	-(BOOL) isAccessibilityElement;
	-(void) setIsAccessibilityElement:(BOOL)p0;
	-(void) didMoveToWindow;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_TimePickerSelector : Microsoft_UI_Xaml_Controls_ContentControl {
}
	-(id) init;
@end

@interface Microsoft_iOS__WebKit_WKNavigationDelegate : NSObject<WKNavigationDelegate> {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_WebView : Microsoft_UI_Xaml_Controls_Control {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_Primitives_CalendarPanel : Microsoft_UI_Xaml_Controls_Panel {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_Primitives_ColorSpectrum : Microsoft_UI_Xaml_Controls_Control {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_Primitives_LoopingSelector : Microsoft_UI_Xaml_Controls_Control {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_Primitives_LoopingSelectorItem : Microsoft_UI_Xaml_Controls_ContentControl {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_Primitives_NavigationViewItemPresenter : Microsoft_UI_Xaml_Controls_ContentControl {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_Primitives_ScrollBar : Microsoft_UI_Xaml_Controls_Primitives_RangeBase {
}
	-(id) init;
@end

@interface Microsoft_UI_Xaml_Controls_Primitives_ScrollPresenter : Microsoft_UI_Xaml_FrameworkElement {
}
	-(id) init;
@end

@interface Uno_UI_Views_Controls_BindableUIAlertView : UIAlertView {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) didMoveToWindow;
	-(void) willMoveToSuperview:(UIView *)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@interface Uno_UI_Views_Controls_BindableUIButton : UIButton {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) didMoveToWindow;
	-(void) willMoveToSuperview:(UIView *)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@interface Uno_UI_Views_Controls_BindableUIProgressView : UIProgressView {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(float) progress;
	-(void) setProgress:(float)p0;
	-(void) didMoveToWindow;
	-(void) willMoveToSuperview:(UIView *)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@interface Uno_UI_Views_Controls_BindableUIScrollView : UIScrollView {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) didMoveToWindow;
	-(void) willMoveToSuperview:(UIView *)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@interface Uno_UI_Views_Controls_BindableUISwitch : UISwitch {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) didMoveToWindow;
	-(void) willMoveToSuperview:(UIView *)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@interface Uno_UI_Views_Controls_StrategyBasedDataTemplateSelectorControl : Uno_UI_Views_Controls_DataTemplateSelectorControl {
}
	-(id) init;
@end

@interface Uno_UI_Controls_BindableSearchBar : UISearchBar {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(NSString *) placeholder;
	-(void) setPlaceholder:(NSString *)p0;
	-(NSString *) text;
	-(void) setText:(NSString *)p0;
	-(BOOL) enablesReturnKeyAutomatically;
	-(void) setEnablesReturnKeyAutomatically:(BOOL)p0;
	-(void) didMoveToWindow;
	-(void) willMoveToSuperview:(UIView *)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@interface Uno_UI_Controls_BindableUISlider : UISlider {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(float) value;
	-(void) setValue:(float)p0;
	-(void) didMoveToWindow;
	-(void) willMoveToSuperview:(UIView *)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@interface Uno_UI_Controls_NativeCommandBarPresenter : Microsoft_UI_Xaml_Controls_ContentPresenter {
}
	-(id) init;
@end

@interface Uno_UI_Controls_FauxGradientBorderPresenter : Microsoft_UI_Xaml_Controls_ContentPresenter {
}
	-(id) init;
@end

@interface Uno_UI_Controls_NativeFramePresenter : Microsoft_UI_Xaml_FrameworkElement {
}
	-(id) init;
@end

@interface Uno_UI_Controls_RootViewController : UINavigationController {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) viewSafeAreaInsetsDidChange;
	-(NSUInteger) supportedInterfaceOrientations;
	-(void) motionEnded:(NSInteger)p0 withEvent:(UIEvent *)p1;
	-(BOOL) shouldAutorotate;
	-(void) traitCollectionDidChange:(UITraitCollection *)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@interface Uno_UI_Controls_StatePresenter : UIControl {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) didMoveToWindow;
	-(BOOL) isEnabled;
	-(void) setEnabled:(BOOL)p0;
	-(BOOL) isSelected;
	-(void) setSelected:(BOOL)p0;
	-(BOOL) isHighlighted;
	-(void) setHighlighted:(BOOL)p0;
	-(void) willMoveToSuperview:(UIView *)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@interface Uno_UI_Controls_UnoNavigationBar : UINavigationBar {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(CGRect) frame;
	-(void) setFrame:(CGRect)p0;
	-(CGRect) bounds;
	-(void) setBounds:(CGRect)p0;
	-(void) didMoveToWindow;
	-(void) willMoveToSuperview:(UIView *)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@interface Uno_UI_Controls_ManagedItemsStackPanel : Microsoft_UI_Xaml_Controls_Panel {
}
	-(id) init;
@end

@interface Uno_UI_Controls_Window : UIWindow {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) pressesEnded:(NSSet <UIPress *>*)p0 withEvent:(UIPressesEvent *)p1;
	-(void) pressesBegan:(NSSet <UIPress *>*)p0 withEvent:(UIPressesEvent *)p1;
	-(UIView *) hitTest:(CGPoint)p0 withEvent:(UIEvent *)p1;
	-(CGRect) frame;
	-(void) setFrame:(CGRect)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@interface Uno_UI_Controls_Legacy_ListViewBaseLayout : UICollectionViewLayout {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(NSArray *) layoutAttributesForElementsInRect:(CGRect)p0;
	-(UICollectionViewLayoutAttributes *) layoutAttributesForItemAtIndexPath:(NSIndexPath *)p0;
	-(UICollectionViewLayoutAttributes *) layoutAttributesForSupplementaryViewOfKind:(NSString *)p0 atIndexPath:(NSIndexPath *)p1;
	-(CGSize) collectionViewContentSize;
	-(void) prepareLayout;
	-(BOOL) shouldInvalidateLayoutForBoundsChange:(CGRect)p0;
	-(void) invalidateLayout;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@interface Uno_UI_Controls_Legacy_GridViewWrapGridLayout : Uno_UI_Controls_Legacy_ListViewBaseLayout {
}
	-(id) init;
@end

@interface Uno_UI_Controls_Legacy_ListViewLayout : Uno_UI_Controls_Legacy_ListViewBaseLayout {
}
	-(id) init;
@end

@interface Uno_Media_Playback_VideoSurface : UIView {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) layoutSubviews;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@interface Microsoft_iOS__UIKit_UIImagePickerControllerDelegate : NSObject<UIImagePickerControllerDelegate, UINavigationControllerDelegate> {
}
	-(id) init;
@end

@interface Microsoft_iOS__CallKit_CXCallObserverDelegate : NSObject<CXCallObserverDelegate> {
}
	-(id) init;
@end

@interface Microsoft_iOS__UIKit_UIAdaptivePresentationControllerDelegate : NSObject<UIAdaptivePresentationControllerDelegate> {
}
	-(id) init;
@end

@interface Microsoft_iOS__UIKit_UIDocumentPickerDelegate : NSObject<UIDocumentPickerDelegate> {
}
	-(id) init;
@end

@interface Microsoft_iOS__UIKit_UIActivityItemSource : NSObject<UIActivityItemSource> {
}
	-(id) init;
@end

@interface Microsoft_iOS__ContactsUI_CNContactPickerDelegate : NSObject<CNContactPickerDelegate> {
}
	-(id) init;
@end

@interface Microsoft_iOS__PhotosUI_PHPickerViewControllerDelegate : NSObject<PHPickerViewControllerDelegate> {
}
	-(id) init;
@end

@interface Uno_UI_RemoteControl_RemoteControlStatusView : Microsoft_UI_Xaml_Shapes_Ellipse {
}
	-(id) init;
@end

@interface Microsoft_iOS__MessageUI_MFMailComposeViewControllerDelegate : NSObject<MFMailComposeViewControllerDelegate> {
}
	-(id) init;
@end

@interface Foundation_NSExceptionError : NSError {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface Microsoft_iOS__Foundation_NSUrlSessionDataDelegate : NSObject<NSURLSessionDataDelegate, NSURLSessionDelegate, NSURLSessionTaskDelegate> {
}
	-(id) init;
@end

@interface UIKit_UIView_UIViewAppearance : NSObject {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) setBackgroundColor:(UIColor *)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface UIKit_UIControl_UIControlAppearance : UIKit_UIView_UIViewAppearance {
}
@end

@interface __UIGestureRecognizerToken : NSObject {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface UIKit_UIDatePicker_UIDatePickerAppearance : UIKit_UIControl_UIControlAppearance {
}
@end


