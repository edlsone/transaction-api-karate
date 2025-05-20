Feature: Validate all transaction objects from GET /transactions

Background:
  * url 'https://vx5846dgdj.execute-api.us-east-1.amazonaws.com/dev'
  * header Content-Type = 'application/json'
  * header Accept = 'application/json'

Scenario: Validate each transaction object in response
  Given path 'transactions'
  When method get
  Then status 200

  * def response = response

  # Define the timestamp validation function
  * def isValidTimestamp =
    """
    function(ts) {
      return /^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}(\\.\\d{3})?Z$/.test(ts);
    }
    """

  # Validate each item in the response array
    * def validateEach = 
      """
      function(response) {
        var isValidTimestamp = function(ts) {
          return /^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}(\\.\\d{3})?Z$/.test(ts);
        };

        response.forEach(function(t) {
          var keys = ['amount', 'currency', 'id', 'name', 'title', 'timestamp'];
          keys.forEach(function(k) {
            if (!t.hasOwnProperty(k)) karate.fail('Missing key: ' + k);
          });

          if (typeof t.amount !== 'number' || t.amount < 0) {
            karate.fail('Invalid amount: ' + t.amount);
          }

          if (!isValidTimestamp(t.timestamp)) {
            karate.fail('Invalid timestamp: ' + t.timestamp);
          }

       
        });
      }
      """

    * eval validateEach(response)
