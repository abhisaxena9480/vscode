trigger replyCaseCustomer on Case (after insert) {
    Set<id>caseID = New Set<id>();
    for(Case c : Trigger.New){
        caseID.add(c.Id);
    }
    List<Case> allCase = [Select id,SuppliedEmail from case where id =:caseID ];
    for(Case c : allCase){
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        string[] toaddress = New String[]{c.SuppliedEmail};
            email.setSubject('Regarding Case Issue');
        email.setPlainTextBody('We Have received your query and will get back to you soon.');
        email.setToAddresses(toaddress);
        Messaging.sendEmail(New Messaging.SingleEmailMessage[]{email});
    }
}