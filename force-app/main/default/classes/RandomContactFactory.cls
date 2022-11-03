public class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer no, String lastName){
        List<Contact> cons = new List<Contact>();
        for(Integer i=0;i<no;i++) {
            Contact c = new Contact(FirstName = 'Test '+i, LastName = lastName);
            cons.add(c);
        }
        return cons;
    }
}