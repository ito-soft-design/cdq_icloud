# -*- coding: utf-8 -*-
class DetailViewController < UIViewController

  attr_accessor :detailDescriptionLabel # IBOutlet UILabel
  attr_accessor :detail_item
  
=begin
  def initWithNibName nibNameOrNil, bundle:nibBundleOrNil
    super
    self
  end
=end

  def viewDidLoad
    super
    configure_view
  end

=begin
  def viewDidUnload
    super
  end
=end

=begin
  def viewWillAppear animated
    super
  end
=end

=begin
  def viewDidAppear animated
    super
  end
=end

=begin  
  def viewWillDisappear animated
    super
  end
=end
  
=begin
  def viewDidDisappear animated
    super
  end
=end

=begin
  def shouldAutorotateToInterfaceOrientation interfaceOrientation
    interfaceOrientation == UIInterfaceOrientationPortrait
  end
=end

=begin
  def shouldAutorotate
    true
  end
=end

=begin
  def supportedInterfaceOrientations
    UIInterfaceOrientationMaskPortrait
  end
=end

  def detail_item= item
    @detail_item = item
    configure_view
  end
  
  
  private
  
  def configure_view
    return unless detail_item && detailDescriptionLabel
    detailDescriptionLabel.text = detail_item.time_stamp.to_s
  end
  

end
