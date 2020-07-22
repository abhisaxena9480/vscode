@RestResource(urlMapping='/v1/getAccounts/*')
global with sharing class FetchAccount {
    @HttpGet
    global static list<account> fetchAccount(){
        RestRequest req = RestContext.request;
        RestResponse res = Restcontext.response;
        List<account> listAccount =[Select Id , Name from Account order by createddate desc limit:10 ];
        System.debug('Names of the account:'+listAccount);
        return listAccount ;
    }
    @HttpDelete
    global static void deleteAccount(){
        account obj=new account();
        RestRequest req = RestContext.request;
        RestResponse res = Restcontext.response;
        string accId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        obj=[Select id , name from Account where id=:accId];
        delete obj;   
    } 
    
}