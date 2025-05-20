Feature: Get transaction by i9d

Scenario: Update transaction by ID
  * def transaction = __arg.transaction
  * def transactionId = transaction.transactionId
  * url 'https://vx5846dgdj.execute-api.us-east-1.amazonaws.com/dev/transactions/' + transactionId
  * method get
  * status 200

# Response validation
  * def response = response
  * print '\n\n' , response , '\n\n'
  * print 'transaction.transactionId = ' , transactionId
  * match response == { id: '#string', name: '#string', title: '#string', currency: '#string', amount: '#number', timestamp: '#string'}
  * def isValidTimestamp =
    """
    function(ts) {
      return /^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}(\\.\\d{3})?Z$/.test(ts);

    }
    """

  * assert isValidTimestamp(response.timestamp)