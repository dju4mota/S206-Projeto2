Feature: Testando API Pokemon.

Background:  Executa antes de cada teste 
    * def url_base = "https://pokeapi.co/api/v2/"
    
Scenario: Testando retorno ditto.
    Given url "https://pokeapi.co/api/v2/pokemon/ditto"
    When method get
    Then status 200 

Scenario: Testando retorno aleatorio. 
    Given url "https://pokeapi.co/api/v2/pokemon/12412421"
    When method get
    Then status 404

Scenario: Testando retorno pikachu e json 
    Given url url_base
    And path 'pokemon/pikachu'
    When method get
    Then status 200
    And match response.name == 'pikachu' 
    And match response.id == 25


Scenario: Testando retorno pokemon Red, verificando o array e o json 
    Given url url_base
    And path 'version/1'
    When method get
    Then status 200
    And def idioma = $.names[5].language.url 
    And print idioma 
    And url idioma 
    When method get
    Then status 200
    And match response.name == 'es'
    And match response.id == 7