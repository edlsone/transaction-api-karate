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
  * status 200

# Response validation
  * def response = response
  * print '\n\n' , response , '\n\n'
  * print 'transaction.transactionId = ' , transactionId
  * match response == { id: '#string', name: '#string', title: '#string', currency: '#string', amount: '#number', timestamp: '#string'}

  * match response.id == transactionId
  * match response.name == transaction.name
  * match response.title == transaction.title
  * match response.currency == transaction.currency
  * match response.amount == transaction.amount
  * def isValidTimestamp =
    """
    function(ts) {
      return /^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}(\\.\\d{3})?Z$/.test(ts);

    }
    """

  * assert isValidTimestamp(response.timestamp)