trigger oppStageWon on Opportunity (after insert,after update) {
    Set<id> oppsId = New Set<id>();
    List<opportunity>trList =  New List<opportunity>();
    for(opportunity op : Trigger.new){
        oppsId.add(op.Id);
        trList.add(op);
    }
    System.debug('dekhiye:'+trList);
    for(Opportunity op : trList){
        System.debug('dekho acc name:'+op.account.name);
    }
    List<string> ostring = New List<string>();
    List<opportunity> oppList = New List<opportunity>([Select id,name,StageName from opportunity where id=:oppsId]);
    for(opportunity op : oppList){
        if(op.StageName == 'Closed Won'){
            ostring.add(op.stagename);
        }
    }
    integer size = ostring.size();
    //adding logic to send the email here 
    Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
    string[] toaddress = New String[]{'jastabhi@gmail.com'};
        email.setSubject('Opportunity stage is Closed won');
    email.setPlainTextBody('Size of Opportunity stage set to Closed won :'+size);
    email.setToAddresses(toaddress);
    Messaging.sendEmail(New Messaging.SingleEmailMessage[]{email});
    
}