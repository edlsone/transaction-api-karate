package tests.transactions;

import com.intuit.karate.junit5.Karate;

public class TransactionsRunner {

    @Karate.Test
    Karate testTransactions() {
        return Karate.run("run-all-transactions").relativeTo(getClass());
    }
}
