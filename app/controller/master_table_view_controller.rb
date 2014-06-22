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


    # iCloud notification
    
    # It will be posted when the managed object context for iCloud was initialized.
    NSNotificationCenter.defaultCenter.addObserver(self, selector:"did_initialize:", name:CDQ::CDQStoreManager::STORE_DID_INITIALIZE_NOTIFICATION, object:nil)
    
    # It will be posted when the data was synced.
    NSNotificationCenter.defaultCenter.addObserver(self, selector:"did_finish_import:", name:CDQ::CDQContextManager::DID_FINISH_IMPORT_NOTIFICATION, object:nil)
  end

  def dealloc
    NSNotificationCenter.defaultCenter.removeObserver(self)
    super
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
  
  def tableView tableView, commitEditingStyle:editingStyle, forRowAtIndexPath:indexPath
    case  editingStyle
    when UITableViewCellEditingStyleDelete
      @datasource[indexPath.row].destroy
      cdq.save
      reload_datasource
      tableView.deleteRowsAtIndexPaths [indexPath], withRowAnimation:UITableViewRowAnimationTop
    when UITableViewCellEditingStyleInsert
      # 
    end
  end

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
    reload_datasource
    tableView.insertRowsAtIndexPaths [NSIndexPath.indexPathForRow(0,inSection:0)], withRowAnimation:UITableViewRowAnimationTop
  end
  
  
  def did_initialize notification
    reload_data
  end
  
  def did_finish_import notification
    reload_data
  end
  
  
  private
  
  def reload_datasource
    @datasource = Event.default_scope.to_a
  end
  
  def reload_data
    reload_datasource
    self.tableView.reloadData
  end
  

end
