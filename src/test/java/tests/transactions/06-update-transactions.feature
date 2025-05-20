Feature: Update  transactions

Background:
  * def goodData = read('classpath:data/transactions.json')

Scenario: Test update valid transactions
  * def runTests =
    """
    function(list) {
      karate.forEach(list, function(row) {
        karate.call('classpath:tests/transaction/update-transaction.feature', { transaction: row });
      });
    }
    """
  * eval runTests(goodData)

