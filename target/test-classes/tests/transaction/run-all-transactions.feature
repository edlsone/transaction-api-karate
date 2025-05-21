Feature: Run all transaction tests from JSON files

Background:
  * def goodData = read('classpath:data/transactions.json')
  * def badData = read('classpath:data/transactions-bad.json')
  * def incorrectKeyData = read('classpath:data/transactions-incorrect-key-data.json')

Scenario: Test  create valid transactions
    * def check =
    """
    function(list) {
      karate.forEach(list, function(row) {
        karate.call('classpath:tests/transactions/create-transaction.feature',{ transaction: row });
      });
    }
    """
  * eval check(goodData)

Scenario: Test create invalid transactions
    * def check =
    """
    function(list) {
      karate.forEach(list, function(row) {
        karate.call('classpath:tests/transactions/create-transaction-bad.feature',{ transaction: row });
      });
    }
    """
  * eval check(badData)

Scenario: Test list all transactions
  * call read('classpath:tests/transactions/get-all-transactions.feature')


Scenario: Test update valid transactions
  * def runTests =
    """
    function(list) {
      karate.forEach(list, function(row) {
        karate.call('classpath:tests/transactions/update-transactions.feature', { transaction: row });
      });
    }
    """
  * eval runTests(goodData)

Scenario: Test update transaction not found
  * def runTests =
    """
    function(list) {
      karate.forEach(list, function(row) {
        karate.call('classpath:tests/transactions/update-transactions-bad.feature', { transaction: row });
      });
    }
    """
  * eval runTests(incorrectKeyData)

Scenario: Test get transaction by id
    * def check =
    """
    function(list) {
      karate.forEach(list, function(row) {
        karate.call('classpath:tests/transactions/get-transaction-by-id.feature',{ transaction: row });
      });
    }
    """
  * eval check(goodData)

Scenario: Test get transaction by id not found
    * def check =
    """
    function(list) {
      karate.forEach(list, function(row) {
        karate.call('classpath:tests/transactions/get-transaction-by-id-bad.feature',{ transaction: row });
      });
    }
    """
  * eval check(incorrectKeyData)

Scenario: Test delete transaction by id
    * def check =
    """
    function(list) {
      karate.forEach(list, function(row) {
        karate.call('classpath:tests/transactions/delete-transaction.feature',{ transaction: row });
      });
    }
    """
  * eval check(goodData)

Scenario: Test delete transaction by id not found
    * def check =
    """
    function(list) {
      karate.forEach(list, function(row) {
        karate.call('classpath:tests/transactions/delete-transaction-bad.feature',{ transaction: row });
      });
    }
    """
  * eval check(incorrectKeyData)