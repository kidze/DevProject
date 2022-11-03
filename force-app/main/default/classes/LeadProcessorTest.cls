@isTest
private class LeadProcessorTest {
	@isTest
    private static void testBatchClass(){
        List<Lead> total = [SELECT Id FROM Lead];
        System.debug('truoc khi insert: '+total.size());
        
        List<Lead> leads = new List<Lead>();
        for(Integer i=0;i<200;i++){
            leads.add(New Lead(LastName='Yen',Company='Gimasys'));
        }
        insert leads;
        total = [SELECT Id FROM Lead];
        System.debug('sau khi insert: '+total.size());
        
        //test
     	Test.startTest();
        LeadProcessor lp = new LeadProcessor();
        Id batchId = Database.executeBatch(lp,200);
        Test.stopTest();
        
        //check result
        List<Lead> results = [SELECT Id FROM Lead WHERE LeadSource='Dreamforce'];
        System.assertEquals(200,results.size());
    }
}