Feature: Run all transaction tests from JSON files

Background:
  * def goodData = read('classpath:data/transactions.json')

Scenario: Test  create valid transactions
    * def check =
    """
    function(list) {
      karate.forEach(list, function(row) {
        karate.call('classpath:tests/transaction/create-transaction.feature',{ transaction: row });
      });
    }
    """
  * eval check(goodData)
