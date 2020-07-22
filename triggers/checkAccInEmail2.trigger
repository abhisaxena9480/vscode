trigger checkAccInEmail2 on Contact ( after insert ){  
    Map<string,Id> conMap = new Map<string,id>();
    Map<String,Id> mapAccount = new Map<String,id>();
    List<Account> Accountlist = new List<Account>();  
    List<contact> updateCon = new List<contact>();
    List<Account> insertAcc = New List<Account>();
    List<contact> conData = New List<contact>();
    Set<String> emailDomains = new Set<string>();  
    for(Contact c : Trigger.New){  
        condata.add(c);
        emailDomains.add(c.Email.split('@').get(1).SubStringBefore('.')); 
        //conMap.put(c.Email.split('@').get(1).SubStringBefore('.'),c.id); 
    }
    System.debug('email:'+emailDomains);
    for(Account ac : [Select id,name from Account where name =: emailDomains]){
        mapAccount.put(ac.Name,ac.Id);
        System.debug('mapAccount:'+mapAccount);
    } 
    for(contact str : conData){
        conMap.put(str.Email.split('@').get(1).SubStringBefore('.'),str.id);
        if(mapAccount.containsKey(str.Email.split('@').get(1).SubStringBefore('.'))){
            System.debug('Inside if part');
            Contact c = New Contact(id=str.id,accountid=mapAccount.get(str.Email.split('@').get(1).SubStringBefore('.')));
            updateCon.add(c);
            System.debug('update con:'+updateCon);
        }
        else{
            System.debug('Inside else part');
            Account ac = New Account(name = str.Email.split('@').get(1).SubStringBefore('.')); 
            insertAcc.add(ac); 
            System.debug('Acc name:'+ac); 
            //Contact c = New Contact(id=conMap.get(str), accountid=ac.Id);
        }
    }  
    try{
        if(!insertAcc.isEmpty()){
            insert insertAcc;
        }
    }
    catch(Exception e){
        System.debug('Exception occurs' + e);
    }
    for(Account ac : insertAcc){
        updatecon.add(new contact(id=conMap.get(ac.name),accountid=ac.id)); 
    }
    try{
        if(!updateCon.isEmpty()){
            update updateCon;
        }
    }
    catch(Exception e){
        System.debug('Exception occurs' + e);
    }
}