public class populateTrainingParticipant {
    public static void listtraining(Set<id> conids){ 
        String temp='';
        Map<id,string> targetDesc = new Map<id,string>();
        List<contact> result = new List<contact>();
        List<Training_Participant__c> allTrainingNames = [select Contact__c,TrainingCen__r.Name from Training_Participant__c where contact__c=:conids];
        if(!allTrainingNames.isEmpty()){
            for(Training_Participant__c tr : allTrainingNames){
                System.debug('Inside for loop current  name :'+tr.TrainingCen__r.name); 
                if(targetDesc.containsKey(tr.Contact__c)){ 
                    if(!targetdesc.get(tr.Contact__c).contains(tr.TrainingCen__r.name) ){ 
                        targetdesc.put(tr.Contact__c,targetdesc.get(tr.Contact__c)+tr.TrainingCen__r.name+';');
                    }
                    System.debug('Inside if'+targetdesc.get(tr.Contact__c));
                }else{
                    System.debug('Inside else');
                    temp = tr.TrainingCen__r.name+';';
                    System.debug('First tym name here:'+temp);
                    targetDesc.put(tr.Contact__c,temp);
                    System.debug('Inside else'+targetdesc);
                }
                
            } 
        }
        else{
            for(Contact con:[Select id,Current_Training_Names__c from contact where id =: conIds]){
                contact c = New contact(id=con.id,Current_Training_Names__c = null );
                result.add(c);
            }
        }
        for(id tid :targetDesc.keySet()){
            contact c = new contact(id = tid, Current_Training_Names__c = targetDesc.get(tid));
            result.add(c);
            System.debug('Result:'+result);
        }
        try{
            if(!result.isEmpty()){
                update result;
            }
        }      
        catch(Exception e){
            System.debug('Exception occurs' + e);
        }
        
    }
    public static void addDate(Set<id> conIds){
        List<Training_Participant__c> TrainingNames = [select Contact__c,joining_date__c from Training_Participant__c where Contact__c =:conIds  order by joining_date__c desc];
        List<date> checkDate = New List<date>(); 
        Map<id,date> targetMap = New Map<id,date>(); 
        List<Contact> result = New List<Contact>();
        for(Contact c : [select Training_Date__c from contact where id =:conIds ]){
            checkDate.add(c.Training_Date__c);
        }
        if(!TrainingNames.isEmpty()){
            for(Training_Participant__c tr : TrainingNames){ 
                targetMap.put(tr.Contact__c,tr.joining_date__c); 
            }  
            for(id tid :targetMap.keySet()){
                Contact con = new Contact(id = tid);
                if(!checkDate.contains(targetMap.get(tid))){    
                    con.Training_Date__c = targetMap.get(tid);
                    result.add(con);
                    System.debug('Result:'+result); 
                }
            }
        }
        else{
            for(Contact con:[Select id,Training_Date__c from contact where id =: conIds]){
                contact c = New contact(id=con.id,Training_Date__c = null );
                result.add(c);
            }
        }
        try{
            if(!result.isEmpty()){
                update result;
            }
        }      
        catch(Exception e){
            System.debug('Exception occurs' + e);
        }
    }
}