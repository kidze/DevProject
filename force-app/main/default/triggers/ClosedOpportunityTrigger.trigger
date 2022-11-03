trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    List<Opportunity> newopps = [SELECT Id,StageName FROM Opportunity WHERE Id IN :Trigger.New];
	List<Task> t = new List<Task>();
    for(Opportunity o : newopps){
        if(o.StageName == 'Closed Won'){
            t.add(new Task(Subject = 'Follow Up Test Task',
                          WhatId = o.Id));
        }
    }
    if(t.size() > 0)
        insert t;
}