@isTest
private class DailyLeadProcessorTest {
    private static String cron = '0 0 0 1/1 * ? *';
	@isTest
	private static void testLead(){
		List<Lead> leads = new List<Lead>();
        for(Integer i=0;i<200;i++){
            leads.add(New Lead(LastName='Yen',Company='Gimasys'));
        }
        insert leads;
        
        Test.startTest();
        String jobId = System.schedule('Lead Processor',cron,new DailyLeadProcessor());
        Test.stopTest();
        
        //check results
        List<Lead> results = [SELECT Id,LeadSource FROM Lead WHERE LeadSource='Dreamforce'];
        System.assertEquals(200,results.size());
        
        List<CronTrigger> cts = [SELECT Id,TimesTriggered,NextFireTime FROM CronTrigger WHERE Id=:jobId];
        System.debug('Next Fire Time: '+cts[0].NextFireTime);
    }
}