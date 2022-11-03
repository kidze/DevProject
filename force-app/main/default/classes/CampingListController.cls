public without sharing class CampingListController {
    @AuraEnabled
    public static List<Camping_Item__c> getItems(){
        return [SELECT Id,Name,Quantity__c,Price__c,Packed__c,CreatedDate FROM Camping_Item__c WITH SECURITY_ENFORCED];
    }

    @AuraEnabled
    public static Camping_Item__c saveItem(Camping_Item__c item){
        upsert item;
        return item;
    }
    
}