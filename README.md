# Login-CEP

Projeto feito em Ruby on Rails com banco em PostgreSQL como API fazendo autenticação utilizando devise_token_auth.
Busca de CEP salvando em uma base, vinculando o endereço com o usuário logado.

<table>
 <tr>
    <td>Versão Ruby:</td>
    <td>3.1.3</td>
 </tr>
 <tr>
    <td>Versão Rails:</td>
    <td>7.0.4.2</td>
 </tr>
 <tr>
    <td>Database:</td>
    <td>PostgreSQL</td>
 </tr>
</table>

## 1- Configuração
```bash
# instalação das gems
bundle install

# criação do banco
rails db:create
rails db:migrate
rails db:migrate RAILS_ENV=test

# iniciar o servidor
rails s
```
BackEnd disponível no `http://localhost:3000`.

Como o sistema utiliza o PostgreSQL, é necessário que se coloque o usuário e senha para acesso ao banco no arquivo: `database.yml`.

## 2- Feito/Pendência

- [x] Criação de um Login que salva em uma base
- - [x] Update/Delete do Login
- - [x] Autenticação via Token
- - [x] Validação do Token
- [x] Busca por CEP
- - [x] Salvar o endereço consultado em uma base
- - [x] Tratamento do CEP
- - [ ] Vinculo do CEP para o usuário logado em uma base

## 3- Testes

### Testes foram realizados utilizando o Insomnia

Para Login e Logout foram utilizados:
<table>
 <tr>
    <td>Login:</td>
    <td>POST</td>
    <td>http://localhost:3000/api/auth/sign_in</td>
    <td>JSON: {"email": "{{ _.email }}","password": "{{ _.password }}"}</td>
 </tr>
 <tr>
    <td>Logout:</td>
    <td>DELETE</td>
    <td>http://localhost:3000/api/auth/sign_out</td>
    <td>Header: access-token{token} , uid{email} , client</td>
 </tr>
</table>

Para validação do Token foi utilizado:
<table>
 <tr>
    <td>Valida Token:</td>
    <td>GET</td>
    <td>http://localhost:3000/api/auth/validate_token</td>
    <td>Header: access-token{token} , uid{email} , client</td>
 </tr>
</table>

Para criação do usuário/atualização/exclusão foram utilizados:
<table>
 <tr>
    <td>Criação:</td>
    <td>POST</td>
    <td>http://localhost:3000/api/auth</td>
    <td>JSON: {"email": "{{ _.email }}","password": "{{ _.password }}","password_confirmation": "{{ _.password }}"}</td>
 </tr>
 <tr>
    <td>Alteração:</td>
    <td>PUT</td>
    <td>http://localhost:3000/api/auth</td>
    <td>JSON: Qualquer opção que queira alterar</td>
 </tr>
 <tr>
    <td>Exclusão:</td>
    <td>DELETE</td>
    <td>http://localhost:3000/api/auth</td>
    <td>Header: access-token{token} , uid{email} , client</td>
 </tr>
</table>

Para esqueci minha senha/atualização/reset foram utilizados:
<table>
 <tr>
    <td>Esqueci:</td>
    <td>POST</td>
    <td>http://localhost:3000/api/auth/password</td>
    <td>JSON: {"email": "{{ _.email }}"}</td>
 </tr>
 <tr>
    <td>Atualização:</td>
    <td>PUT</td>
    <td>http://localhost:3000/api/auth</td>
    <td>JSON: {"current_password": "{{ _.password }}","password": "{{ _.password }}","password_confirmation": "{{ _.password }}"}</td>
 </tr>
 <tr>
    <td>Reset:</td>
    <td>PUT</td>
    <td>http://localhost:3000/api/auth/password</td>
    <td>JSON: {"password": "{{ _.password }}","password_confirmation": "{{ _.password }}"}</td>
 </tr>
</table>

Para consulta do CEP foi utilizado:
<table>
 <tr>
    <td>ConsultaCEP:</td>
    <td>GET</td>
    <td>http://localhost:3000/api/v1/addresses/{{ _.cep }}</td>
    <td>Retorna um arquivo JSON que é tratado e salvo na base</td>
 </tr>
</table>
