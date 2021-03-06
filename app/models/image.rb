class Image < ActiveRecord::Base
  has_attached_file :image_file, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  belongs_to :snippet
# faking acts_as_paranoid since its no longer supported
# note: this breaks before_delete call backs, but since we aren't using them...
default_scope :conditions => {:deleted_at => nil}
  def destroy
    self.update_attribute(:deleted_at, Time.zone.now)
  end

  validates_presence_of :image_file_file_name
               
  def deleted?
    !!self.deleted_at
  end
end
