@isTest
private class AddPrimaryContactTest {
	@isTest
    private static void testBatchClass(){
        List<Account> accounts = new List<Account>();
        for(Integer i=0;i<50;i++){
            Account acc1 = new Account(Name='Test NY',BillingState='NY');
            Account acc2 = new Account(Name='Test CA',BillingState='CA');
			accounts.add(acc1);
            accounts.add(acc2);
        }
        insert accounts;
        
        Contact inputcontact = new Contact(FirstName='Yen',LastName='Nguyen');
        insert inputcontact;
        
        Test.startTest();
        Id jobId = System.enqueueJob(new AddPrimaryContact(inputcontact,'CA'));
        Test.stopTest();
                                     
        //check result
        List<Contact> results = [SELECT Id FROM Contact WHERE Account.BillingState = 'CA' AND FirstName = 'Yen' AND LastName = 'Nguyen'];
        System.assertEquals(50,results.size());
    }
}