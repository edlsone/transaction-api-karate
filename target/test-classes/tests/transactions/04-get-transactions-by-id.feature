Feature: Get transaction by i9d

Background:
  * def goodData = read('classpath:data/transactions.json')

Scenario: Test get transaction by id
    * def check =
    """
    function(list) {
      karate.forEach(list, function(row) {
        karate.call('classpath:tests/transaction/get-transaction-by-id.feature',{ transaction: row });
      });
    }
    """
  * eval check(goodData)

