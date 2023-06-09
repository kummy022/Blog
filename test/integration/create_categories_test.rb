require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest
  test "get new category form and create category" do
    get new_category_path
    assert_template 'categories/new'

    assert_difference 'Category.count', 1 do
      post categories_path, params: { category: { name: "sports" } }
    end

    assert_redirected_to categories_path
    follow_redirect!

    assert_template 'categories/index'
    assert_match "sports", response.body
  end

  test "invalid category submission results in failure" do 
    get new_category_path
    assert_template 'categories/new'

    assert_no_difference 'Category.count' do
      post categories_path, params: { category: { name: " " } }
    end

    assert_redirected_to categories_path
    follow_redirect!

    assert_template 'categories/new'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end
end
