public with sharing class CarController {
    @AuraEnabled//(cacheable = true)
    public static void connectWithApi(String recordId){
    
        Car__c car = new Car__c(Id= recordId);
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://myfakeapi.com/api/cars/1');
        request.setHeader('Content-Type','application/json');
        request.setMethod('GET');

        HttpResponse response = http.send(request);

        if(response.getStatusCode() == 200){
            String respondeText = response.getBody();
            car.TextArea__c = respondeText;
        }else{
            System.debug('Error');
        } 
        update car;
    }
}