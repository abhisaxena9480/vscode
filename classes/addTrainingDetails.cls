public class addTrainingDetails {
    public static void addDetails(List<Training_Participant__c> Records){//Records is a variable (trigger.new)
        Set<id> conIds = new Set<id>();
        Set<id> accIds = new Set<id>();   
        List<date> newDate = New List<date>();
        List<date> oldDate = New List<date>();
        for(Training_Participant__c tr : Records){
            //Training_Participant__c oldTp = Trigger.oldMap.get(tr.Id);
            conIds.add(tr.contact__c);
            accIds.add(tr.account__c); 
            newDate.add(tr.joining_date__c); 
        }  
        for(Training_Participant__c tp : [Select joining_date__c,contact__r.Training_Date__c from Training_Participant__c where contact__c=:conIds]){
            if((!newDate.contains(tp.joining_date__c)) && (!newDate.contains(tp.contact__r.Training_Date__c))){ 
                populateTrainingParticipant.addDate(conIds);
            } 
        }
        populateTrainingParticipant.listtraining(conIds);
        addTrainingDateAcc.addDate(accIds);
    }
    public static void checkReqTraining(List<Training_Participant__c> Records){ // checking all the requirements before inserting a record
        Set<id> conIds = New Set<id>();
        List<string>clistid= New List<string>();
        List<string>tlistid= New List<string>();  
        for(Training_Participant__c tr :Records){  
            if(tr.Contact__c == null){
                tr.addError('Please Enter Contact in field');
            }
            else{ 
                conIds.add(tr.contact__c); 
            }
            if(tr.Account__c == null ){
                tr.addError('Please Enter Account in field');
            }
            if(tr.TrainingCen__c ==null ){
                tr.addError('Please Enter Training Name in field');
            }
        }   
        Map <Id,Contact> conListWithTP = new Map<Id,Contact>([ Select id,(Select TrainingCen__c,contact__c from Training_Participants__r)from Contact where id in:conIds]);
        
        for(Training_Participant__c t : [Select TrainingCen__c,contact__c from Training_Participant__c where contact__c in:conIds]){
            clistid.add(t.contact__c);
            tlistid.add(t.TrainingCen__c);
        } 
        
        for(Training_Participant__c tr : Records){
            if(conListWithTP.containsKey(tr.Contact__c)){
                if(conListWithTP.get(tr.Contact__c).Training_Participants__r.size()>1){
                    tr.addError('A contact can have only two trainings');
                }
            }
            if(clistid.contains(tr.Contact__c) && tlistid.contains(tr.TrainingCen__c)){  
                tr.addError('Duplicate Record found'); 
            } 
        }
    }
}