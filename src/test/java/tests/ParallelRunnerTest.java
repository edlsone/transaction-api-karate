package tests;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.MethodOrderer.OrderAnnotation;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;


@TestMethodOrder(OrderAnnotation.class)
class ParallelRunnerTest {

    @Test
    @Order(1)       
    void createTransactions() {
        Results results = Runner.path("classpath:tests/transactions/01-create-transactions.feature")
                .outputCucumberJson(true)
                .parallel(0);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
    
    @Test
    @Order(2)       
    void createTransactionsBad() {
        Results results = Runner.path("classpath:tests/transactions/02-create-transactions-bad.feature")
                .outputCucumberJson(true)
                .parallel(0);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
    
    @Test
    @Order(3)
    void getAllTransactions() {
        Results results = Runner.path("classpath:tests/transactions/03-get-all-transactions.feature")
                .outputCucumberJson(true)
                .parallel(0);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
    
   @Test
    @Order(4)
    void getTransactionsById() {
        Results results = Runner.path("classpath:tests/transactions/04-get-transactions-by-id.feature")
                .outputCucumberJson(true)
                .parallel(0);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
    
    @Test
    @Order(5)
    void getTransactionsByIdBad() {
        Results results = Runner.path("classpath:tests/transactions/05-get-transactions-by-id-bad.feature")
                .outputCucumberJson(true)
                .parallel(0);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
    
    @Test
    @Order(6)
    void updateTransactions() {
        Results results = Runner.path("classpath:tests/transactions/06-update-transactions.feature")
                .outputCucumberJson(true)
                .parallel(0);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
    
    @Test
    @Order(7)
    void updateTransactionsBad() {
        Results results = Runner.path("classpath:tests/transactions/07-update-transactions-bad.feature")
                .outputCucumberJson(true)
                .parallel(0);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
    
    @Test
    @Order(8)
    void deleteTransactionsFail() {
        Results results = Runner.path("classpath:tests/transactions/08-delete-transactions-bad.feature")
                .outputCucumberJson(true)
                .parallel(0);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
    
    @Test
    @Order(9)
    void deleteTransactions() {
        Results results = Runner.path("classpath:tests/transactions/09-delete-transactions.feature")
                .outputCucumberJson(true)
                .parallel(0);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

}