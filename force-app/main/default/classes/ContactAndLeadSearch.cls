public class ContactAndLeadSearch {
    public static List<List<sObject>> searchContactsAndLeads(String para){
        List<List<sObject>> r = [FIND :para IN ALL FIELDS RETURNING Contact(FirstName,LastName),Lead(FirstName,LastName)];
        
        return r;
    }
}