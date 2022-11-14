public without sharing class ChangeAccountBudget {
    public static void increaseBudget(List<Car__c> cars){
        List<Account> accountList = new List<Account>();
        List<id> idList = new List<id>();
        for(Car__c car:cars){
            idList.add(car.Contacts__c);
        }
        List<Contact> contacts = [SELECT Id, Account.Budget__c, (SELECT Value__c, Purchase_price__c FROM Cars__r) FROM Contact WHERE id =: idList];
        System.debug(contacts.Value__c);
        System.debug(contacts.Purchase_price__c);
        // for(Car__c car:cars){
            // Contact carContact=[SELECT AccountId FROM Contact WHERE id=:car.Contacts__c];
            // Account carAccount=[SELECT, (SELECT Id FROM Contacts) Budget__c FROM Account WHERE Id=:carContact.AccountId];
            // Car__r.Contact__r.Accounta (SELECT Value__c, Purchase_price__c from Cars),

            //[SELECT Id, (SELECT Id .... from car__r), FROM Contact WHERE Id =: car.Contact__c];
            // Car__c car = [SELECT Id, Contact__r.Id, Contact__r.AccountId FROM Car__c WHERE Id =: ]
            //carAccount.Budget__c = carAccount.Budget__c + car.Value__c;
            
            //accountList.add(carAccount);
        // }
        // update(accountList);
    }
    public static void reductionBudget(List<Car__c> cars){
        List<Account> accountList=new List<Account>();
        //List<Contact> contacts = [SELECT Id, (SELECT Value__c, Purchase_price__c from Car__r), (SELECT Budget__c FROM Account) FROM Contact WHERE Id IN :cars.Contacts__c];
        //System.debug(contacts);
        for(Car__c car:cars){
            Contact carContact=[SELECT AccountId FROM Contact WHERE id=:car.Contacts__c];
            Account carAccount=[SELECT Budget__c FROM Account WHERE Id=:carContact.AccountId];

            carAccount.Budget__c = carAccount.Budget__c - car.Purchase_price__c;
            
            accountList.add(carAccount);
        }
        update(accountList);
    }
}