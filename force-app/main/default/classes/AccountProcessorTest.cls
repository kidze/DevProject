@isTest
private class AccountProcessorTest {
	@isTest
    private static void countContactsTest(){
        //create test accounts
        List<Account> accounts = new List<Account>();
        for(Integer i=0;i<200;i++){
            accounts.add(new Account(Name='Test Account '+i));
        }
        insert accounts;
        //create test contacts
        List<Contact> contacts = new List<Contact>();
        List<Id> idlist = new List<Id>();
        for(Account acc : accounts){
            contacts.add(new Contact(FirstName=acc.Name,LastName='Test Contact 1',AccountId=acc.Id));
            contacts.add(new Contact(FirstName=acc.Name,LastName='Test Contact 2',AccountId=acc.Id));
            idlist.add(acc.Id);
        }
        insert contacts;
        
        
        Test.startTest();
        AccountProcessor.countContacts(idlist);
        Test.stopTest();
        
        List<Account> results = [SELECT Id,Number_of_Contacts__c FROM Account WHERE Id IN :idlist];
        
        System.debug(results[0].Contacts.size());
        System.debug(results[0].Number_of_Contacts__c);
        for(Account acc : results){
        	System.assertEquals(2,acc.Number_of_Contacts__c);
        }
    }
}