class Footer < ActiveAdmin::Component
 
  def build
    super :id => "footer"
 
    span "Copyright #{Date.today.year} Meh dsfs"
  end
 
end