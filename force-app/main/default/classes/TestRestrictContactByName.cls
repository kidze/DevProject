@isTest
private class TestRestrictContactByName{
	@isTest static void TestRestrictContactInsert(){
		Contact c = new Contact(FirstName = 'Yen',LastName = 'INVALIDNAME');
	    Test.startTest();
	    Database.SaveResult r = Database.insert(c,false);
	    Test.stopTest();
	    System.assert(!r.isSuccess());
	    System.assert(r.getErrors().size() > 0);
	    System.assertEquals('The Last Name "'+c.LastName+'" is not allowed for DML', r.getErrors()[0].getMessage());
	}
    @isTest static void TestRestrictContactUpdate(){
        Contact c = new Contact(FirstName = 'Phat',LastName = 'Nguyen');
        insert c;
        c.LastName = 'INVALIDNAME';
        Test.startTest();
        Database.SaveResult r = Database.update(c,false);
        Test.stopTest();
	    System.assert(!r.isSuccess());
	    System.assert(r.getErrors().size() > 0);
	    System.assertEquals('The Last Name "'+c.LastName+'" is not allowed for DML', r.getErrors()[0].getMessage());
    }
}