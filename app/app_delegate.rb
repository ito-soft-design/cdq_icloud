class AppDelegate
  include CDQ

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    cdq.setup

    # iCloud notification
    NSNotificationCenter.defaultCenter.addObserver(self, selector:"did_finish_import:", name:CDQ::CDQContextManager::DID_FINISH_IMPORT, object:nil)

    storyboard = UIStoryboard.storyboardWithName "Main", bundle:nil
    @window = UIWindow.alloc.initWithFrame UIScreen.mainScreen.bounds
    @window.rootViewController = storyboard.instantiateInitialViewController
    @window.makeKeyAndVisible
    true
  end

  def dealloc
    NSNotificationCenter.defaultCenter.removeObserver(self)
    super
  end

  def did_finish_import notification
NSLog "did_finish_import"
    @window.rootViewController.popToRootViewControllerAnimated true
  end

end
