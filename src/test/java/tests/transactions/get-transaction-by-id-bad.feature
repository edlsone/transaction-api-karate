Feature: Get transaction by id

Scenario: Update transaction by ID
  * def transaction = __arg.transaction
  * def transactionId = transaction.transactionId
  * url 'https://vx5846dgdj.execute-api.us-east-1.amazonaws.com/dev/transactions/' + transactionId
  * request transaction
  * method get
  * status 404
    And match response.message == 'Transaction not found'