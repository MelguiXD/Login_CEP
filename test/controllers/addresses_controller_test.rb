require "test_helper"

class AddressesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @address = addresses(:one)
  end

  test "should get index" do
    get addresses_url, as: :json
    assert_response :success
  end

  test "should create address" do
    assert_difference("Address.count") do
      post addresses_url, params: { address: { bairro: @address.bairro, cep: @address.cep, cidade: @address.cidade, complemento: @address.complemento, ddd: @address.ddd, erro: @address.erro, gia: @address.gia, ibge: @address.ibge, logradouro: @address.logradouro, siafi: @address.siafi, uf: @address.uf } }, as: :json
    end

    assert_response :created
  end

  test "should show address" do
    get address_url(@address), as: :json
    assert_response :success
  end

  test "should update address" do
    patch address_url(@address), params: { address: { bairro: @address.bairro, cep: @address.cep, cidade: @address.cidade, complemento: @address.complemento, ddd: @address.ddd, erro: @address.erro, gia: @address.gia, ibge: @address.ibge, logradouro: @address.logradouro, siafi: @address.siafi, uf: @address.uf } }, as: :json
    assert_response :success
  end

  test "should destroy address" do
    assert_difference("Address.count", -1) do
      delete address_url(@address), as: :json
    end

    assert_response :no_content
  end
end
