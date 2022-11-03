@isTest
public class TestVerifyDate {
    @isTest static void testCheckDatesWithin(){
        Date pri = VerifyDate.CheckDates(System.today(), System.today() + 29);
        System.assertEquals(System.today()+29, pri);
    }
    @isTest static void testCheckDatesEndOfMonth(){
        Date pri = VerifyDate.CheckDates(System.today(), System.today()-1);
        System.assertEquals(Date.newInstance(2022, 10, 31), pri);
    }
}