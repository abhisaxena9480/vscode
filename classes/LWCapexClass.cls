public class LWCapexClass {
    @AuraEnabled(Cacheable=true)
    public static List<apexClass> apexClasses(){
        return [SELECT Id, Name from Apexclass];   
    }
}