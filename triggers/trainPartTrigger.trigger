trigger trainPartTrigger on Training_Participant__c (after insert,after update,before insert,before update,after delete) { 
    if(Trigger.isAfter){
        if(Trigger.isInsert){
            //Code for after insert
            addTrainingDetails.addDetails(trigger.new); 
        }
        if(Trigger.isUpdate){ 
            //Code for after update 
            addTrainingDetails.addDetails(trigger.new); 
        }
        if(Trigger.isDelete){ 
            //Code for after delete
            addTrainingDetails.addDetails(trigger.old); 
        }
    }
    if(Trigger.isBefore){
        if(Trigger.isInsert){
            //Code for after insert
            addTrainingDetails.checkReqTraining(trigger.new);  
        } 
    }
}