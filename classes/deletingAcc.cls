@RestResource(urlMapping='/v1/getAccounts1/*')
global with sharing class deletingAcc {
    @HttpDelete
    global static void fetchAccount(){
        account obj=new account();
        RestRequest req = RestContext.request;
        RestResponse res = Restcontext.response;
       	string accId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        obj=[Select id , name from Account where id=:accId];
        delete obj; 
    }
}