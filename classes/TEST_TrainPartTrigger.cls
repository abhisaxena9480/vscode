@isTest
public class TEST_TrainPartTrigger {
    // @testSetup static void setup() {  
    static TestMethod void trainingScenario(){
        Account acObj  = TestDataFactory.createAccount('TestAccount',True);
        Contact conObj = TestDataFactory.createContact('TestContact','con@mail.com',True);
        TrainingCen__c trObj1 = TestDataFactory.createTR('JAVA1',2,30,True);
        TrainingCen__c trObj2 = TestDataFactory.createTR('JAVA2',2,60,True);
        Training_Participant__c tpObj1 = TestDataFactory.createTP(acObj.id,conObj.Id,trObj1.Id,System.today().addDays(30),True); 
        Training_Participant__c tpObj2 = TestDataFactory.createTP(acObj.id,conObj.Id,trObj2.Id,System.today().addDays(45),True); 
        Training_Participant__c tpObj3 = TestDataFactory.createTP(null,null,null,System.today().addDays(30),false); 
        Training_Participant__c tpObj4 = TestDataFactory.createTP(acObj.id,conObj.Id,trObj2.Id,System.today().addDays(30),False);
        
        //Test for populating the trainingNames and date in Contact fields
        Contact con = [ Select Current_Training_Names__c,Training_Date__c from Contact where id=:conObj.Id];
        System.assertEquals('JAVA1;JAVA2;',con.Current_Training_Names__c );
        System.assertEquals(System.today().addDays(30),con.Training_Date__c );
        
        //Test for populating date in Account field
        Account ac = [Select TrainingDate__c from account where id=:acObj.Id];
        System.assertEquals(System.today().addDays(30),ac.TrainingDate__c );
        
        //Update case when we update the joining date with older date then the previous date
        tpObj1.joining_date__c = System.today();
        update tpObj1;
        
        Contact con3 = [ Select Current_Training_Names__c,Training_Date__c from Contact where id=:conObj.Id]; 
        System.assertEquals(System.today(),con3.Training_Date__c );
        Account ac2 = [Select TrainingDate__c from account where id=:acObj.Id];
        System.assertEquals(System.today(),ac2.TrainingDate__c );
        
        
        //Test to check error message when inserting inserting duplicate record.
        try { 
            insert tpObj4;
        }
        catch(Exception e) { 
            System.assert(e.getMessage().contains('Duplicate Record found'));
        }
        //Test to check error message when inserting trainingparticipant with null values
        try {
            insert tpObj3; 
        }
        catch(Exception e) {
            System.assert(e.getMessage().contains('Please Enter Training Name in field')); 
        }
        
        delete tpObj1;
        delete tpObj2; 
        
        //Test for populating the trainingNames and date in Contact fields after deletion of training participant
        Contact con1 = [ Select Current_Training_Names__c,Training_Date__c from Contact where id=:conObj.Id];
        System.assertEquals(null,con1.Current_Training_Names__c );
        System.assertEquals(null,con1.Training_Date__c );
        
        //Test for populating date in Account field after deletion of training participant
        Account ac1 = [Select TrainingDate__c from account where id=:acObj.Id];
        System.assertEquals(null,ac1.TrainingDate__c );
        
    } 
}