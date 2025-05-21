Feature: Delete a transaction

Background:
  * url 'https://vx5846dgdj.execute-api.us-east-1.amazonaws.com/dev'
  * header Content-Type = 'application/json'
  * header Accept = 'application/json'

Scenario: Post invalid transaction

  Given path 'transactions'
  And request transaction
  When method post
  Then status 400
  And match response.message == 'Missing required fields'
