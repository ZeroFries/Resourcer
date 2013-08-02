class RequirementsHaveSpecificsSources < ActiveRecord::Migration
  def change
  	drop_table :requirements
  	create_table :requirements do |t|
  		t.references :node
  		t.references :source
  	end
  end
end
