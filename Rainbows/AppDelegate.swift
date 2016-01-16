import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{

  var window: UIWindow?

  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
  {
    let userOnBoarded = NSUserDefaults.standardUserDefaults().boolForKey("userOnBoarded")
    
    if !userOnBoarded
    {
      self.window?.rootViewController = OnboardingController()
    }
    
    return true
  }

}