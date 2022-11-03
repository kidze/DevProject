public class ContactSearch {
    public static List<Contact> searchForContacts(String s1, String s2){
        List<Contact> r = [SELECT ID, Name From Contact WHERE LastName = :s1 and MailingPostalCode = :s2];
        
        return r;
    }
}