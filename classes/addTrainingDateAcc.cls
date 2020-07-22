public class addTrainingDateAcc {
    public static void addDate(Set<id> accid){
        List<Training_Participant__c> TrainingNames = [select name, Account__c,joining_date__c from Training_Participant__c where account__c =:accid  order by joining_date__c desc];
        Map<id,date> targetMap = New Map<id,date>(); 
        List<Account> result = New List<Account>();
          List<date> checkDate = New List<date>();
           for(Account ac : [Select TrainingDate__c from account where id =:accid]){
               checkdate.add(ac.TrainingDate__c);
          }
        if(!TrainingNames.isEmpty()){
            for(Training_Participant__c tr : TrainingNames){  
                targetMap.put(tr.account__c,tr.joining_date__c); 
            } 
            for(id tid :targetMap.keySet()){
                Account ac = new Account(id = tid);
                if(!checkDate.contains(targetMap.get(tid))){
                    ac.TrainingDate__c = targetMap.get(tid);
                    result.add(ac);
                    System.debug('Result:'+result);
                }
            }
        }
        else{
            for(Account ac:[Select id,TrainingDate__c from account where id =: accid]){
                Account a = New Account(id=ac.id,TrainingDate__c = null );
                result.add(a);
            }
        }
        try{
            if(!result.isEmpty()){
                System.debug('aarha ha :'+result);
                update result;
            }
        }      
        catch(Exception e){
            System.debug('Exception occurs' + e);
        }
    }
}