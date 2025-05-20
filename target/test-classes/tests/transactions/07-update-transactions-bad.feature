Feature: Update transactions not found

Background:
  * def incorrectKeyData = read('classpath:data/transactions-incorrect-key-data.json')

Scenario: Test update transaction not found
  * def runTests =
    """
    function(list) {
      karate.forEach(list, function(row) {
        karate.call('classpath:tests/transaction/update-transaction-bad.feature', { transaction: row });
      });
    }
    """
  * eval runTests(incorrectKeyData)

