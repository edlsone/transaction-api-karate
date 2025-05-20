Feature: Create a transaction by id

Background:
  * url 'https://vx5846dgdj.execute-api.us-east-1.amazonaws.com/dev'
  * header Content-Type = 'application/json'
  * header Accept = 'application/json'

  # Define the timestamp validation function
  * def isValidTimestamp =
  """
  function(ts) {
    return /^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}(\\.\\d{3})?Z$/.test(ts);
  }
  """

Scenario: Post valid transaction
  Given path 'transactions'
  And request transaction
  When method post
  Then status 201

  * def body = response

  # Validate structure and types
  * match body == { amount: '#number', currency: '#string', id: '#string', name: '#string', title: '#string', timestamp: '#string', message: '#string' }

  # Validate field logic
  * assert body.amount >= 0
  * if (!isValidTimestamp(body.timestamp)) karate.fail('Invalid timestamp: ' + body.timestamp)
