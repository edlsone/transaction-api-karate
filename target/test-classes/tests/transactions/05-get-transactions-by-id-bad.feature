Feature: Get transactions by id not found

Background:
  * def incorrectKeyData = read('classpath:data/transactions-incorrect-key-data.json')

Scenario: Test get transaction by id not found
    * def check =
    """
    function(list) {
      karate.forEach(list, function(row) {
        karate.call('classpath:tests/transaction/get-transaction-by-id-bad.feature',{ transaction: row });
      });
    }
    """
  * eval check(incorrectKeyData)

