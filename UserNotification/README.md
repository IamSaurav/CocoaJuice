Its a Xamarin sample project to demonstrate User notification introduced in iOS 10. Its the same push notification jsut the way of implementation got bit changed.

Steps :

  1. Request for authorization of push notification (Local/Remote). You don't need to add any key info.plist for it though.
  2. Once the user authorizes to receive notification call register for remote notification.
  3. Once you receive the token send it to sender to send message.
  4. Implement the delegate method which got bit changed.
  5. Earlier notification delegates were part of UIApplicationDelegate but now it is part of UNUserNotificationCenterDelegate
  
 Thats it! Looking for feedback.
 
 * will demonstrate adding image, gif and actions to notification.

  * Tags
    Xamarin 
    C# 
    UserNotifications
    UNUserNotificationCenter
    UNUserNotificationCenterDelegate
