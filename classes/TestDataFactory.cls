@isTest
public class TestDataFactory {
    public static Account createAccount(String Name, Boolean create){
        Account acc = new account();
        acc.name=name;
        if(create)insert acc; 
        return acc;
    }    
    public static Contact createContact(String name,String email,Boolean create ) {
        Contact con = new Contact();
        con.Email = email;
        con.LastName = name;
        if(create)insert con;  
        return con;
    }
    public static TrainingCen__c createTR(String name,Integer participants,Integer days,Boolean create){  
        TrainingCen__c tr = new TrainingCen__c(); 
        tr.name = name;
        tr.Total_Participants__c = participants;
        tr.Training_Period_in_days__c = days;  
        if(create)insert tr;  
        return tr;
    }
    public static Training_Participant__c createTP(id acc,id con,id train,date dat,Boolean create) { 
        Training_Participant__c tp = new Training_Participant__c(); 
        tp.Account__c = acc;
        tp.Contact__c = con;
        tp.TrainingCen__c = train;
        tp.joining_date__c = dat;
        if(create)insert tp;  
        return tp;
    } 
}