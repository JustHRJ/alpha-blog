require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest
   
   def setup
     @user = User.create(username: "something", email: 'something@gmail.com', password: 'password', admin: true)
   end
   
   
   test "Get new Category Form and create Category" do
       sign_in_as(@user, 'password')
       get new_category_path
       assert_template 'categories/new'
       assert_difference 'Category.count', 1 do
        post_via_redirect categories_path, category: {name: "Sports"}
       end
       assert_template 'categories/index'
       assert_match "Sports", response.body
   end
   
   test "Get new category form and create invalid category" do
          sign_in_as(@user, 'password')
        get new_category_path
       assert_template 'categories/new'
       assert_no_difference 'Category.count' do
        post categories_path, category: {name: " "}
       end
       assert_template 'categories/new'
       assert_select 'h2.panel-title'
       assert_select 'div.panel-body'
   end
   
   
    
end