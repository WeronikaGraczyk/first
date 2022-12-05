public with sharing class Wrapper {

    @AuraEnabled(cacheable=true)
    public static List<ContactWrapperClass> fetchWrapperData(String recordId){

        List<ContactWrapperClass> wrapperList = new List<ContactWrapperClass>();
        List<Car__c> carList = [SELECT Name__c, Fuel__c, Contacts__c, Contacts__r.Name FROM Car__c WHERE Contacts__r.AccountId =: recordId];
        System.debug(carList);
        for(Car__c car : carList){
        System.debug(car+' '+car.Contacts__r.Name );
            wrapperList.add(new ContactWrapperClass(car, car.Contacts__r.Name));
        }
        return wrapperList;
    }

    public class ContactWrapperClass {
        @AuraEnabled
        public Car__c car;
        @AuraEnabled 
        public String Contact_Name;
        @AuraEnabled
        public String Car_name;
        @AuraEnabled
        public String Car_Fuel;
 
        public ContactWrapperClass(Car__c car, String  name){
            this.car = car;
            this.Contact_Name = name;
            this.Car_name = car.Name__c;
            this.Car_Fuel = car.Fuel__c;
        }
    }
}