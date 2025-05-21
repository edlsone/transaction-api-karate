package tests;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.MethodOrderer.OrderAnnotation;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;

import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;

@TestMethodOrder(OrderAnnotation.class)
class ParallelRunnerTest {
    
    public static void generateReport(String karateOutputPath) {
        // Only include JSONs under a specific report folder (like target/cucumber-report-json)
        File reportDir = new File(karateOutputPath);
        Collection<File> jsonFiles = FileUtils.listFiles(reportDir, new String[]{"json"}, false);

        List<String> jsonPaths = new ArrayList<>(jsonFiles.size());

        System.out.println("\n********** Files used to generate report **********");
        jsonFiles.forEach(file -> {
            String path = file.getAbsolutePath();
            System.out.println("Using JSON file: " + path);
            jsonPaths.add(path);
        });
        System.out.println("****************************************************");

        Configuration config = new Configuration(new File("target"), "Transaction API");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }


    @Test
    @Order(1)       
    void createTransactions() {
        Results results = Runner.path("classpath:tests/transactions/01-create-transactions.feature")
                .outputCucumberJson(true)
                .reportDir("target/cucumber-report-json")
                .parallel(1);
                generateReport(results.getReportDir());
                assertEquals(0, results.getFailCount(), results.getErrorMessages());
                
                // 👇 Print where Karate is writing the report (to verify)
                System.out.println("\n\n\n\n\n\n\n****************************************************");                
                System.out.println("Report Dir: " + results.getReportDir());
    }
    
    @Test
    @Order(2)       
    void createTransactionsBad() {
        Results results = Runner.path("classpath:tests/transactions/02-create-transactions-bad.feature")
                .outputCucumberJson(true)
                .reportDir("target/cucumber-report-json")
                .parallel(1);
                generateReport(results.getReportDir());
                assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
    
    @Test
    @Order(3)
    void getAllTransactions() {
        Results results = Runner.path("classpath:tests/transactions/03-get-all-transactions.feature")
                .outputCucumberJson(true)
                .reportDir("target/cucumber-report-json")
                .parallel(1);
                generateReport(results.getReportDir());
                assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
    
   @Test
    @Order(4)
    void getTransactionsById() {
        Results results = Runner.path("classpath:tests/transactions/04-get-transactions-by-id.feature")
                .outputCucumberJson(true)
                .reportDir("target/cucumber-report-json")
                .parallel(1);
                generateReport(results.getReportDir());
                assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
    
    @Test
    @Order(5)
    void getTransactionsByIdBad() {
        Results results = Runner.path("classpath:tests/transactions/05-get-transactions-by-id-bad.feature")
                .outputCucumberJson(true)
                .reportDir("target/cucumber-report-json")
                .parallel(1);
                generateReport(results.getReportDir());
                assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
    
    @Test
    @Order(6)
    void updateTransactions() {
        Results results = Runner.path("classpath:tests/transactions/06-update-transactions.feature")
                .outputCucumberJson(true)
                .reportDir("target/cucumber-report-json")
                .parallel(1);
                generateReport(results.getReportDir());
                assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
    
    @Test
    @Order(7)
    void updateTransactionsBad() {
        Results results = Runner.path("classpath:tests/transactions/07-update-transactions-bad.feature")
                .outputCucumberJson(true)
                .reportDir("target/cucumber-report-json")
                .parallel(1);
                generateReport(results.getReportDir());
                assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
    
    @Test
    @Order(8)
    void deleteTransactionsFail() {
        Results results = Runner.path("classpath:tests/transactions/08-delete-transactions-bad.feature")
                .outputCucumberJson(true)
                .reportDir("target/cucumber-report-json")
                .parallel(1);
                generateReport(results.getReportDir());
                assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
    
    @Test
    @Order(9)
    void deleteTransactions() {
        Results results = Runner.path("classpath:tests/transactions/09-delete-transactions.feature")
                .outputCucumberJson(true)
                .reportDir("target/cucumber-report-json")
                .parallel(1);
                generateReport(results.getReportDir());
                assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

}