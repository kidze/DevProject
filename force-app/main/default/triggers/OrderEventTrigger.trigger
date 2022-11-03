trigger OrderEventTrigger on Order_Event__e (after insert) {
	List<Task> tasks = new List<Task>();
    Id userid = UserInfo.getUserId();
    for(Order_Event__e event : Trigger.New){
        if(event.Has_Shipped__c == true){
            Task t = new Task(Priority='Medium',Subject='Follow up on shipped order 105',OwnerId=userid,Status='New');
            tasks.add(t);
        }
    }
    insert tasks;
}