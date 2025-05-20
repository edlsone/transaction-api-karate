Feature: Update a transaction

Scenario: Update transaction by ID
  * def transaction = __arg.transaction
  * def transactionId = transaction.transactionId
  * def amount = transaction.amount + 1000
  * transaction.amount = amount
  * url 'https://vx5846dgdj.execute-api.us-east-1.amazonaws.com/dev/transactions/' + transactionId
  * request transaction
  * def transactionId = transaction.transactionId
  * eval delete transaction.transactionId
  * method put
  * status 404
    And match response.message == 'Transaction not found'
