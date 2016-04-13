using System;
using UIKit;
using Paypal;
using ObjCRuntime;
using Foundation;

namespace PayPalDemo
{
	public partial class ViewController : UIViewController
	{
		private readonly NSString PayPalClientId = new NSString ("Ad3lW6npyXQ3zg4HQ_wxU8kDk0KHeUN9i1uzdxesJdIaAnvwu245UPy5kUDM0mhFoYjDL3eH0y93cSDH");
		private readonly NSString PayPalSandboxClientId = new NSString ("ssen@wbhq.com");
		private PayPalPaymentViewController _paymentViewController;
		private PaymentDelegate paymentDelegate;
		private PayPalFuturePaymentViewController futurePaymentViewController;
		private FuturePaymentDelegate futurePaymentDelegate;
		private PayPalConfiguration payPalConfig;
		private string environment;
		private bool AcceptCreditCards = true;


		public ViewController (IntPtr handle) : base (handle)
		{
			AcceptCreditCards = true;
		}

		public override void ViewDidLoad ()
		{
			base.ViewDidLoad ();
			Title = "PayPal Demo";

			// Initialize PayPal
			NSMutableDictionary clientIdDict = new NSMutableDictionary ();
			clientIdDict.Add (Paypal.Constants.PayPalEnvironmentProduction, PayPalClientId);
			clientIdDict.Add (Paypal.Constants.PayPalEnvironmentSandbox, PayPalSandboxClientId);
			PayPalMobile.InitializeWithClientIdsForEnvironments (clientIdDict);

			payPalConfig = new PayPalConfiguration { 
				AcceptCreditCards = AcceptCreditCards, 
				LanguageOrLocale = NSLocale.PreferredLanguages [0],
				MerchantName = @"BigOrg Inc.",
				MerchantPrivacyPolicyURL = new NSUrl (@"https://www.paypal.com/webapps/mpp/ua/privacy-full"),
				MerchantUserAgreementURL = new NSUrl (@"https://www.paypal.com/webapps/mpp/ua/useragreement-full")
			};
			environment = Paypal.Constants.PayPalEnvironmentNoNetwork;
		}

		public override void ViewWillAppear (bool animated)
		{
			base.ViewWillAppear (animated);
			PayPalMobile.PreconnectWithEnvironment (environment);
		}


		partial void PayNow (NSObject sender)
		{
			PayPalPayment payment = this.CreatePayment ();
			// Needs to be checked if payment is negative or anything which can't be paid through Paypal.
			if (!payment.Processable) {
				//TODO Show alert
			} else {
				payPalConfig.AcceptCreditCards = AcceptCreditCards;
				paymentDelegate = new PaymentDelegate ();
				paymentDelegate.PaymentCancelled += PaymentCanceled;
				paymentDelegate.PaymentCompleted += PaymentCompleted;
				_paymentViewController = new PayPalPaymentViewController (payment, payPalConfig, paymentDelegate);

				if (_paymentViewController.Handle == IntPtr.Zero) {
					//TODO Show alert
					return;
				}
				this.PresentModalViewController (_paymentViewController, true);
			}
		}

		partial void PayInFuture (Foundation.NSObject sender)
		{
			futurePaymentDelegate = new FuturePaymentDelegate ();
			futurePaymentViewController = new PayPalFuturePaymentViewController (payPalConfig, futurePaymentDelegate);
			futurePaymentDelegate.FuturePaymentCancelled += FuturePaymentCanceled;
			futurePaymentDelegate.FuturePaymentAuthorized += FuturePaymentAuthorized;
			if (futurePaymentViewController.Handle == IntPtr.Zero) {
				//TODO Show alert
				return;
			}
			this.PresentModalViewController (futurePaymentViewController, true);
		}


		//Sample Payment
		private PayPalPayment CreatePayment ()
		{
			PayPalPayment payment = new PayPalPayment {
				Amount = new NSDecimalNumber ("$100"),
				CurrencyCode = "USD",
				ShortDescription = "BigBurger",
				Intent = PayPalPaymentIntent.Sale,
			};
			return payment;
		}

		// Payments
		private void PaymentCanceled ()
		{
			this.Dismiss ();
		}

		private void PaymentCompleted (PayPalPayment payment)
		{
			// TODO User paid it 
			this.Dismiss ();
		}


		// Future Payments
		private void FuturePaymentCanceled ()
		{
			this.Dismiss ();
		}

		private void FuturePaymentAuthorized (NSDictionary futurePaymentAuthorization)
		{
			// The user has successfully logged into PayPal, and has consented to future payments.
			// TODO Send data to own server
			UIAlertView alert = new UIAlertView ("Future Payment Authorization Successful", futurePaymentAuthorization.Description, null, "Ok", null);
			alert.Show ();
			this.Dismiss ();
		}






		public void Dismiss ()
		{
			this.DismissModalViewController (true);
		}

		public override void DidReceiveMemoryWarning ()
		{
			base.DidReceiveMemoryWarning ();
		}

	}



	public class PaymentDelegate : PayPalPaymentDelegate
	{
		public delegate void PaymentCancelledDelegate ();

		public event PaymentCancelledDelegate PaymentCancelled;

		public delegate void PaymentCompletedDelegate (PayPalPayment payment);

		public event PaymentCompletedDelegate PaymentCompleted;

		#region implemented abstract members of PayPalPaymentDelegate

		public override void PayPalPaymentDidCancel (Paypal.PayPalPaymentViewController paymentViewController)
		{
			if (PaymentCancelled != null) {
				PaymentCancelled ();
			}
		}

		public override void PayPalPaymentViewController (Paypal.PayPalPaymentViewController paymentViewController, PayPalPayment completedPayment)
		{
			if (PaymentCompleted != null) {
				PaymentCompleted (completedPayment);
			}
		}

		#endregion
	}

	public class FuturePaymentDelegate : PayPalFuturePaymentDelegate
	{
		public delegate void FuturePaymentCancelledDelegate ();

		public event FuturePaymentCancelledDelegate FuturePaymentCancelled;

		public delegate void FuturePaymentAuthorizedDelegate (NSDictionary futurePaymentAuthorization);

		public event FuturePaymentAuthorizedDelegate FuturePaymentAuthorized;

		#region implemented abstract members of PayPalFuturePaymentDelegate

		public override void PayPalFuturePaymentDidCancel (Paypal.PayPalFuturePaymentViewController futurePaymentViewController)
		{
			if (FuturePaymentCancelled != null) {
				FuturePaymentCancelled ();
			}
		}

		public override void PayPalFuturePaymentViewController (Paypal.PayPalFuturePaymentViewController futurePaymentViewController, NSDictionary futurePaymentAuthorization)
		{
			if (FuturePaymentAuthorized != null) {
				FuturePaymentAuthorized (futurePaymentAuthorization);
			}
		}

		#endregion
	}


}

