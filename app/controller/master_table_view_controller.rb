# -*- coding: utf-8 -*-
class MasterTableViewController < UITableViewController
  include CDQ
  
=begin
  def initWithStyle style
    super
    self
  end
=end

  def viewDidLoad
    super
    navigationItem.leftBarButtonItem = editButtonItem;

    addButton = UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemAdd, target:self, action:"insert_new_object:")
    navigationItem.rightBarButtonItem = addButton
    
    @datasource = []
  end

=begin
  def viewDidUnload
    super
  end
=end

  def viewWillAppear animated
    super
    reload_data
  end

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
  
  def tableView tableView, numberOfRowsInSection:section
    @datasource.size
  end

=begin
  def tableView tableView, titleForHeaderInSection:section
    nil
  end
=end  

  CellIdentifier = "Cell"
  def tableView tableView, cellForRowAtIndexPath:indexPath
    cell = tableView.dequeueReusableCellWithIdentifier CellIdentifier, forIndexPath:indexPath
    cell.textLabel.text = @datasource[indexPath.row].time_stamp.to_s
    cell
  end

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

  def prepareForSegue(segue, sender:sender)
    case segue.identifier
    when "showDetail"
      index_path = tableView.indexPathForSelectedRow
      segue.destinationViewController.detail_item = @datasource[index_path.row]
    end
  end
  
  def insert_new_object sender
    event = Event.create(time_stamp:Time.now)
    cdq.save
    reload_data
  end
  
  
  def reload_data
    @datasource = Event.default_scope.to_a
    self.tableView.reloadData
  end
  
end
