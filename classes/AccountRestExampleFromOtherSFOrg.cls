public class AccountRestExampleFromOtherSFOrg{
    
    public static string AccountRestExampleFromOtherSFOrg(){
        
        String endpoint='https://ap17.salesforce.com/services/oauth2/token';
        
        String username = 'jastabhi@ab.com'; 
        String password = 'abhi@1234tOMFJawEJF1Ls50LupYWIPg7c';
        String ClientId= '3MVG97quAmFZJfVxDVsgWNtfp5sSnGh1GxDwzImxM9fgL.0HjXhVbJZK6FPd0_5bnNsuVLbVGetalE6R2W._S';
        String ClientSecret = 'AE2F7107DDD82B2735944C14BFB87755102CF9A2F456F95E9AAF50090DB029C3'; 
        
        Httprequest req = new HttpRequest();    
        req.setMethod('POST');     
		req.setBody('grant_type=password + &client_id=' + ClientId + '&client_secret=' + ClientSecret + '&username=' + username +'&password=' + password); 
        req.setEndpoint(endpoint); 
        Http http = new Http();
        HttpResponse res;       
        String Access_Token;
        try {
            res = http.send(req);                
            system.debug('body:'+res.getBody());  
            JSONParser parser = JSON.createParser(res.getBody());
            while (parser.nextToken() != null) {
                if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && (parser.getText() == 'access_token')) {
                    parser.nextToken();
                    Access_Token = parser.getText();    
                } 
            }            
        }catch(system.CalloutException e){            
            system.debug('error:'+e);
        }
        String Access_Token1='00D2x000004tcRQ!AQ0AQMNV_8CZJAF16mN45VplSvBAbDP40.iVeNWVcEq0r2_9qGOYKEBAf6il4wo3WsLuE40BhfpKA.tBtGIxcgpWGYZJKMJx';
        system.debug('access token:'+Access_Token);
        Httprequest req1 = new HttpRequest();  
        req1.setEndpoint('https://ap17.salesforce.com/services/apexrest/v1/getAccounts');  
        req1.setMethod('GET');    
        req1.setHeader('Content-Type','application/x-www-form-urlencoded');
        req1.setHeader('Authorization','Bearer '+Access_Token);            
        Http http1 = new Http();
        HttpResponse res1 = http1.send(req1);                 
        system.debug('body:'+res1.getBody()); 
        return res1.getBody();
    }
}