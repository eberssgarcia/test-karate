package bdd;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static util.reportsUtil.generateCucumberReport;

public class RunnerParallel {
    private static final Logger logger = LoggerFactory.getLogger(RunnerParallel.class);

    @BeforeAll
    static void beforeClass() {
        logger.info("BEFORE >>");
    }

    @AfterAll
    static void afterClass() {
        logger.info("AFTER >>");
    }

    @Test
    void testParallel() {
        Results results = Runner.path("src/test/java/bdd/booker/listBooker.feature")
//                        .tags("@test-request")
                .outputCucumberJson(true).parallel(2);
        generateCucumberReport(results.getReportDir());
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
}
