Feature: Try to create invalid transaction

Background:
  * def badData = read('classpath:data/transactions-bad.json')

Scenario: Test create invalid transactions
    * def check =
    """
    function(list) {
      karate.forEach(list, function(row) {
        karate.call('classpath:tests/transaction/create-transaction-bad.feature',{ transaction: row });
      });
    }
    """
  * eval check(badData)

