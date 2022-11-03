public class AccountHandler {
    public static Account insertNewAccount(String str){
        Account acc = new Account(Name = str);
        Database.SaveResult kq = Database.insert(acc,false);
        if(kq.isSuccess())
            return acc;
        else{
            for(Database.Error er : kq.getErrors()){
            	System.debug('Error is: '+er.getMessage());
        	}
            return null;
        }
    }
}