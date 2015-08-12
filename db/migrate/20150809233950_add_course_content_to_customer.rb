class AddCourseContentToCustomer < ActiveRecord::Migration
  def change
  	add_column :customers, :course_content ,:text   #疗程内容
  	add_column :customers, :place_of_origin, :string  #籍贯
  end
end
