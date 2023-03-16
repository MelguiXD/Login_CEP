class AddressSerializer < ActiveModel::Serializer
  attributes :id, :cep, :logradouro, :complemento, :bairro, :cidade, :uf, :ibge, :gia, :ddd, :siafi, :erro
end
