public with sharing class Wrapper {

    @AuraEnabled(cacheable=true)
    public static List<ContactWrapperClass> fetchWrapperData(String AccountId){

        Account AccountIds = [SELECT id FROM Account WHERE id=:AccountId];
        List<ContactWrapperClass> wrapperList = new List<ContactWrapperClass>();
        List<Contact> ContactNameList = [SELECT id, name FROM Contact WHERE AccountId =:AccountIds.id];

        Set<id> contactsIds = new Set<id>();
        for(Contact contact: ContactNameList){
            contactsIds.add(contact.id);
        }

        List<Car__c> carList = [SELECT Name__c, Fuel__c,Contacts__c FROM Car__c WHERE Contacts__c IN :contactsIds];
        
        for(Car__c car : carList){
            for(Contact contact : ContactNameList){
                if(car.Contacts__c == contact.id){
                    wrapperList.add(new ContactWrapperClass(car, contact.name));
                }
            }
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