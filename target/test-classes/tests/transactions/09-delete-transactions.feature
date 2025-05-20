Feature: Delete transaction by id

Background:
  * def goodData = read('classpath:data/transactions.json')

Scenario: Test delete transaction by id
    * def check =
    """
    function(list) {
      karate.forEach(list, function(row) {
        karate.call('classpath:tests/transaction/delete-transaction.feature',{ transaction: row });
      });
    }
    """
  * eval check(goodData)

