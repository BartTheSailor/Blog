require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  setup do # to się wykona przed kazdym przypadkiem testowym wywołanym poleceniem 'test'
    @article = create :article
    @user = create :user
  end
  
  test 'GET #index shows articles' do
    get articles_path
    assert_response :success
    assert_includes(assigns[:articles], @article)
    assert_template 'index' 

  end

  test 'POST #create when not signed in' do
    post articles_path, params: {
      article: {title: 'test title', text: 'texttexttext',
                terms_of_service: '1'}
    }
    assert_redirected_to new_user_session_path
    
  end
end


