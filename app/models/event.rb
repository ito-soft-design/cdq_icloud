class Event < CDQManagedObject

  scope :default_scope, sort_by(:time_stamp, order: :descending)
  
end
