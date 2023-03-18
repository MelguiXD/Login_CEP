require "test_helper"

class VinculosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vinculo = vinculos(:one)
  end

  test "should get index" do
    get vinculos_url, as: :json
    assert_response :success
  end

  test "should create vinculo" do
    assert_difference("Vinculo.count") do
      post vinculos_url, params: { vinculo: { address_id: @vinculo.address_id, user_id: @vinculo.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show vinculo" do
    get vinculo_url(@vinculo), as: :json
    assert_response :success
  end

  test "should update vinculo" do
    patch vinculo_url(@vinculo), params: { vinculo: { address_id: @vinculo.address_id, user_id: @vinculo.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy vinculo" do
    assert_difference("Vinculo.count", -1) do
      delete vinculo_url(@vinculo), as: :json
    end

    assert_response :no_content
  end
end
