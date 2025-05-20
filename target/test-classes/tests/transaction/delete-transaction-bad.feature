Feature: Delete transaction by id not found

Scenario: Update transaction by ID
  * def transaction = __arg.transaction
  * def transactionId = transaction.transactionId
  * url 'https://vx5846dgdj.execute-api.us-east-1.amazonaws.com/dev/transactions/' + transactionId
  * method delete
  * status 404
    And match response.message == 'Transaction not found'
