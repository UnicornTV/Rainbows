import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{

  var window: UIWindow?

  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
  {
    let userOnBoarded = NSUserDefaults.standardUserDefaults().boolForKey("userOnboarded")
    
    if userOnBoarded
    {
      let workshops = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Workshops")
      self.window?.rootViewController = workshops
    }
    else
    {
      self.window?.rootViewController = OnboardingController()
    }
    
    return true
  }

}