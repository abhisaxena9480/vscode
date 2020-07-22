global class SendReminderEmail implements Database.Batchable<sObject>, Database.Stateful{
    global List<string> ostring = New List<string>();
    global Database.QueryLocator start(Database.BatchableContext BC) {
        String query = 'SELECT id, Name, StageName  FROM Opportunity ';
        return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext BC, List<Opportunity> scope) {
        
        for(Opportunity op :scope) {        
            if(op.StageName=='Closed Won'){
                ostring.add(op.StageName);
            }
        }   
    }
    global void finish(Database.BatchableContext BC) {
        integer size = ostring.size();
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {'jastabhi.com'};
            mail.setToAddresses(toAddresses);
        mail.setSubject('closed opp');
        mail.setPlainTextBody('Total opp closed are:'+size);
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });   
    }
}