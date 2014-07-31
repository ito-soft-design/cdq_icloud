class AppDelegate
  include CDQ

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    stores = CDQStoreManager.new(iCloud:true)
    CDQ.cdq.setup(stores:stores)

    # iCloud notification
    # It will be posted when the data was synced.
    NSNotificationCenter.defaultCenter.addObserver(self, selector:"did_finish_import:", name:CDQ::CDQContextManager::DID_FINISH_IMPORT_NOTIFICATION, object:nil)

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

  # Pop to the root view controller when the data was sycned.
  def did_finish_import notification
    @window.rootViewController.popToRootViewControllerAnimated true
  end

end
