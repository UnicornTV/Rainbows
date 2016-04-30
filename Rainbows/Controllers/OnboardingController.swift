import UIKit

class OnboardingController : UIViewController, UIScrollViewDelegate
{
  
  let slides = [
    [
      "image": "onboarding-1",
      "header": "Welcome 1",
      "text": "some filler text for now"
    ],
    [
      "image": "onboarding-2",
      "header": "Welcome 2",
      "text": "some filler text for now"
    ],
    [
      "image": "onboarding-3",
      "header": "Welcome 3",
      "text": "some filler text for now"
    ]
  ]

  let screen = UIScreen.mainScreen().bounds
  var scroll = UIScrollView()
  var pagination = UIPageControl()
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    
    scroll.frame = CGRectMake(0, 0, screen.width, screen.height)
    scroll.showsHorizontalScrollIndicator = false
    scroll.showsVerticalScrollIndicator = false
    scroll.pagingEnabled = true
    scroll.contentSize = CGSizeMake(CGFloat(Int(screen.width) * slides.count), screen.height / 2)
    scroll.delegate = self
    view.addSubview(scroll)
    
    if slides.count > 1
    {
      pagination.frame = CGRectMake(0, screen.height - 50, screen.width , 50)
      pagination.numberOfPages = slides.count
      pagination.addTarget(self, action: #selector(self.swipe(_:)), forControlEvents: .ValueChanged)
      view.addSubview(pagination)
    }
    
    for (i, slide) in slides.enumerate()
    {
      let offsetX = CGFloat(i) * screen.width + (screen.width * 0.1)
      let background = UIImageView(frame: CGRectMake(screen.width * CGFloat(i), 0, screen.width, screen.height))
      background.image = UIImage(named: slides[i]["image"]!)
      background.layer.zPosition = -1
      scroll.addSubview(background)
      scroll.addSubview(Elements.createBlur(screen, x: screen.width * CGFloat(i)))
      
      if let header = slide["header"]
      {
        let h1 = Elements.createh1(header, screen: screen, x: offsetX, y: screen.height / 2 - 20)
        h1.frame.size = CGSizeMake(screen.width * 0.8, 100)
        scroll.addSubview(h1)
      }
      
      if let text = slide["text"]
      {
        let h2 = Elements.createH2(text, screen: screen, x: offsetX, y: screen.height / 2 + 20)
        h2.frame.size = CGSizeMake(screen.width * 0.8, 100)
        scroll.addSubview(h2)
      }
    }
    
    let button = Elements.createButton("Got it!", screen: screen)
    button.addTarget(self, action: #selector(self.next), forControlEvents: .TouchUpInside)
    view.addSubview(button)
  }
  
  func swipe(sender: AnyObject)
  {
    let offsetX = CGFloat(pagination.currentPage) * scroll.frame.size.width
    scroll.setContentOffset(CGPointMake(offsetX, 0), animated: true)
  }
  
  func scrollViewDidEndDecelerating(scrollView: UIScrollView)
  {
    let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
    pagination.currentPage = Int(pageNumber)
  }
  
  func next()
  {
    let workshops = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Workshops")
    self.showViewController(workshops, sender: nil)
    
    NSUserDefaults.standardUserDefaults().setBool(true, forKey: "userOnboarded")
  }
  
}