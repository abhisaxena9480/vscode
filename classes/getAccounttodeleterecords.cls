@RestResource(urlMapping='/getAccountOnExternalIdtodeleterecords/*')
global with sharing class getAccounttodeleterecords {
    @Httpdelete
    global static string deleteAccount(){
        account obj=new account();
        RestRequest req = RestContext.request;
        RestResponse res = Restcontext.response;
        string accId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        obj=[Select id , name from Account where id=:accId];
        delete obj;
        return 'success';
    }
}