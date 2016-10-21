using System;
using Foundation;
using UIKit;
using UserNotifications;

namespace UserNotification
{

	[Register("AppDelegate")]
	public class AppDelegate : UIApplicationDelegate
	{
		public override UIWindow Window
		{
			get;
			set;
		}

		public override bool FinishedLaunching(UIApplication application, NSDictionary launchOptions)
		{
			ConfigureUserNotification();
			return true;
		}

		private void ConfigureUserNotification()
		{
			UNUserNotificationCenter center = UNUserNotificationCenter.Current;
			center.Delegate = new NotificationDelegate();
			UNAuthorizationOptions options = UNAuthorizationOptions.Sound | UNAuthorizationOptions.Alert | UNAuthorizationOptions.Badge;
			center.RequestAuthorization(options, (bool granted, NSError error) =>
			 {
				 if(granted && error == null)
				 {
					 Console.WriteLine("Will register");
					 UIApplication.SharedApplication.RegisterForRemoteNotifications();
				 }
			 });
		}

		public override void RegisteredForRemoteNotifications(UIApplication application, NSData deviceToken)
		{
			string token = deviceToken.Description.Trim('<').Trim('>');
			Console.WriteLine("Token : " + token);
		}
	}


	public class NotificationDelegate : UNUserNotificationCenterDelegate
	{
		public override void WillPresentNotification(UNUserNotificationCenter center, UNNotification notification, System.Action<UNNotificationPresentationOptions> completionHandler)
		{
			Console.WriteLine("WillPresentNotification" + notification.Description);
			ShowAlert("UserNotification", notification.Description);
			ClearNotifications();
		}

		public override void DidReceiveNotificationResponse(UNUserNotificationCenter center, UNNotificationResponse response, System.Action completionHandler)
		{

			Console.WriteLine("DidReceiveNotificationResponse : " + response.Notification.Description);
			ShowAlert("UserNotification", response.Notification.Description);
		}

		public void ClearNotifications()
		{
			//Clear all old notification from notification pane 
			UIApplication.SharedApplication.ApplicationIconBadgeNumber = 0;
			UIApplication.SharedApplication.CancelAllLocalNotifications();
		}

		private void ShowAlert(string title, string message)
		{
			UIAlertController alert = UIAlertController.Create(title, message, UIAlertControllerStyle.Alert);
			alert.AddAction(UIAlertAction.Create("Ok", UIAlertActionStyle.Cancel, null));
			AppDelegate appDelegate = UIApplication.SharedApplication.Delegate as AppDelegate;
			appDelegate.Window.RootViewController.PresentViewController(alert, true, null);
		}
	}


}
