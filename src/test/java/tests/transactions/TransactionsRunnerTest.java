package tests.transactions;

import com.intuit.karate.junit5.Karate;

public class TransactionsRunnerTest {

    @Karate.Test
    Karate testTransactions() {
        return Karate.run("create-transactions")
                .outputCucumberJson(true)
                .relativeTo(getClass());
    }
}
