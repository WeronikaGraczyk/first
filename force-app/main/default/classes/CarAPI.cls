@RestResource( urlMapping = '/Car/*')
Global class CarAPI {

    @HttpGet
    global static List<Car__c> getCarFromId(){
        RestRequest request = RestContext.request;
        String carId = request.requestURI.substring(request.requestURI.lastIndexOf('/') + 1);

        RestResponse response = new RestResponse();
        List<Car__c> carList;

        if(carId.length() == 0){
            RestContext.response.statusCode = 404;
        }else{
            try{
                carList = [SELECT Id, Name__c, Fuel__c, Value__c FROM Car__c WHERE id =:carId];
            RestContext.response.responseBody = Blob.valueof(JSON.serialize(carList));
            }catch(Exception e){
                System.debug(' Exception '+ e.getMessage());
            }
        }
        return carList;
    }
}