Feature: Delete transaction by id not found

Background:
  * def incorrectKeyData = read('classpath:data/transactions-incorrect-key-data.json')

Scenario: Test delete transaction by id not found
    * def check =
    """
    function(list) {
      karate.forEach(list, function(row) {
        karate.call('classpath:tests/transaction/delete-transaction-bad.feature',{ transaction: row });
      });
    }
    """
  * eval check(incorrectKeyData)
