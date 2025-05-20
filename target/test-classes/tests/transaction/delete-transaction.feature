Feature: Delete a transactions by id

Scenario: Update transaction by ID
  * def transaction = __arg.transaction
  * def transactionId = transaction.transactionId
  * url 'https://vx5846dgdj.execute-api.us-east-1.amazonaws.com/dev/transactions/' + transactionId
  * method delete
  * status 200
    And match response.message == 'Transaction deleted'
