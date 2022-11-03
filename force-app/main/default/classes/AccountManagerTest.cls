@isTest
public class AccountManagerTest {
    @isTest static void testGetAccount(){
        Account tacc = new Account(Name='Test Account');
        insert tacc;
        Contact tcon1 = new Contact(LastName='Test Contact 1',AccountId = tacc.Id);
        Contact tcon2 = new Contact(LastName='Test Contact 2',AccountId = tacc.Id);
        insert tcon1;
        insert tcon2;
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://yourInstance.my.salesforce.com/services/apexrest/Accounts/'
            + tacc.Id + '/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        
        // Call the method to test
        Account thisAccount = AccountManager.getAccount();
        
        Contact[] contacts = [SELECT LastName FROM Contact WHERE AccountId= :thisAccount.Id];
        // Verify results
        System.assert(thisAccount != null);
        System.assertEquals('Test Account', thisAccount.Name);
        
        System.assertEquals('Test Contact 1', thisAccount.Contacts[0].LastName);
        System.assertEquals('Test Contact 2', contacts[1].LastName);
        
    }
}