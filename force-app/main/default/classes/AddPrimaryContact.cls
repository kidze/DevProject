public without sharing class AddPrimaryContact implements Queueable{
    private Contact contact;
    private String state;
    public AddPrimaryContact(Contact c,String st){
        this.contact = c;
        this.state = st;
    }
    
    public void execute(QueueableContext context){
        List<Account> accounts = [SELECT Id FROM Account WHERE BillingState = :state LIMIT 200];
        
        List<Contact> contacts = new List<Contact>();
        
        //for each account of that state, clone the contact
        for(Account acc : accounts){
            Contact clone = this.contact.clone();
            clone.AccountId = acc.Id;
            contacts.add(clone);
        }
        insert contacts;
    }
}