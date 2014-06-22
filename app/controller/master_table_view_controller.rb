# -*- coding: utf-8 -*-
class MasterTableViewController < UITableViewController

=begin
  def initWithStyle style
    super
    self
  end
=end

=begin
  def viewDidLoad
    super
    # navigationItem.rightBarButtonItem = editButtonItem;
  end
=end

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


=begin
  def numberOfSectionsInTableView tableView
    1
  end
=end
  
=begin
  def tableView tableView, numberOfRowsInSection:section
    1
  end
=end

=begin
  def tableView tableView, titleForHeaderInSection:section
    nil
  end
=end  

=begin
  CellIdentifier = "Cell"
  def tableView tableView, cellForRowAtIndexPath:indexPath
    cell = tableView.dequeueReusableCellWithIdentifier CellIdentifier, forIndexPath:indexPath
    cell.textLabel.text = "Ruby Motion"
    cell
  end
=end

=begin
  def tableView tableView, didSelectRowAtIndexPath:indexPath
    tableView.deselectRowAtIndexPath indexPath, animated:true
  end
=end

=begin
  def tableView tableView, canEditRowAtIndexPath:indexPath
    true
  end
=end

=begin
  def tableView tableView, editingStyleForRowAtIndexPath:indexPath
    UITableViewCellEditingStyleDelete
  end
=end

=begin
  def tableView tableView, canMoveRowAtIndexPath:indexPath
    true
  end
=end

=begin
  def tableView tableView, moveRowAtIndexPath:fromIndexPath, toIndexPath:toIndexPath
    toIndexPath
  end
=end
  
=begin
  def tableView tableView, commitEditingStyle:editingStyle, forRowAtIndexPath:indexPath
    case  editingStyle
    when UITableViewCellEditingStyleDelete
      tableView.deleteRowsAtIndexPaths [indexPath], withRowAnimation:UITableViewRowAnimationFade
    when UITableViewCellEditingStyleInsert
      # 
    end
  end
=end
  
end
