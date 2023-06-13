Feature: Testando API Pokemon.

Background:  Executa antes de cada teste 
    * def url_base = https: 'https://dummyjson.com/'
    
Scenario: Teste inicial padrão da API.
    Given url url_base
    When method get
    Then status 200 

Scenario: Testando tipo, primeiro do array, depois dos elementos do array.
    Given url url_base
    And path '/products'
    When method get
    Then status 200 
    And match $.products == '#[]'
    And match each $.products contains {title: '#string', id: '#number'}

Scenario: Testando se os usuarios possuem nomes com mais de 5 caracteres.
    Given url url_base
    And path '/users'
    When method get
    Then status 200 
    And match each $.users contains {username: "#string? _.length >= 5"}

Scenario: Testando url invalida. 
    Given url url_base
    And path '/users/cart'
    When method get
    Then status 400

Scenario: Testando retorno aleatorio. 
    Given url url_base
    And path '/products/101012'
    When method get
    Then status 404


Scenario: criando um novo usuario. 
    Given url url_base
    And path '/users/add'
    And request {"firstName":"Dju","lastName":"*****","maidenName":"Smitham","age":23,"gender":"male","email":"inatel@inatel.com","phone":"+63 791 675 8914","username":"atuny0","password":"9uQFF1Lh"}
    When method post
    Then status 200
    And match $.id == 101
    And match $.firstName == 'Dju'


Scenario: atualizando um produto. 
    Given url url_base
    And path '/product/1'
    And request {title: "Iphone 15"}
    When method put
    Then status 200
    
