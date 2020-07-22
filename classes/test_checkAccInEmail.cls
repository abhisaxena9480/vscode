@isTest 
public class test_checkAccInEmail {
    @testSetup static void setup() { 
        Account ac = new Account(name = 'ac1');
        insert ac;
        List<contact> con = New List<contact>();
        for(integer i =1; i<=4; i++){
            contact c = new contact(lastName = 'con'+i ,email = 'con'+i+'@ac'+i+'.com'); 
            con.add(c);
        }
        insert con; 
        contact c = new contact(lastName = 'con6',email='con6@ac1.com');
        insert c;
    }
    static testMethod void  method1() {
        contact con = [ Select id,name,email,account.name From contact where lastname ='con1' ];   
        System.assertEquals('ac1', con.account.name); 
        contact con1 = [ Select id,name,email,account.name From contact where lastname ='con6' ];   
        System.assertEquals('ac1', con1.account.name); 
        
    } 
    static testMethod void  method() {
        contact con = [ Select id,name,email,account.name From contact where lastname = 'con2'];   
        System.assertEquals('ac2', con.account.name);  
        contact con1 = [ Select id,name,email,account.name From contact where lastname = 'con3'];   
        System.assertEquals('ac3', con1.account.name); 
    } 
}