import UIKit

struct Elements
{
  
  static func createh1(text: String, screen: CGRect, x: CGFloat, y: CGFloat) -> UITextView
  {
    let headerView = UITextView()
    headerView.frame = CGRectMake(x, y, screen.width * 0.8, 30)
    headerView.text = text
    headerView.editable = false
    headerView.selectable = false
    headerView.textAlignment = .Center
    headerView.font = .systemFontOfSize(24, weight: 0.3)
    headerView.textColor = .whiteColor()
    headerView.backgroundColor = .clearColor()
    
    return headerView
  }
  
  static func createH2(text: String, screen: CGRect, x: CGFloat, y: CGFloat) -> UITextView
  {
    let headerView = UITextView()
    headerView.frame = CGRectMake(x, y, screen.width * 0.8, 30)
    headerView.text = text
    headerView.editable = false
    headerView.selectable = false
    headerView.textAlignment = NSTextAlignment.Center
    headerView.font = UIFont.systemFontOfSize(20, weight: 0)
    headerView.textColor = UIColor.whiteColor()
    headerView.backgroundColor = UIColor.clearColor()
    
    return headerView
  }
  
}