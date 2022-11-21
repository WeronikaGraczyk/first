public without sharing class ChangeAccountWallet {

    public static void updateAccountWallet(Map<Id, Contact> newContacts, Map<Id, Contact> oldContacts){

        Set<id> accountIds = filterAccountIdWhereWalletWasChangedOnContact(newContacts, oldContacts);
        List<Account> accountsWithContacts = [SELECT Id, Account_Wallet__c, (SELECT Id, Contact_Wallet__c FROM Contacts) FROM Account WHERE Id IN :accountIds];
        List<Account> accountsToUpdate = new List<Account>();

        for(Account accountTemp : accountsWithContacts) {
            Double newAccountWallet = 0;
            for(Contact contactTemp : accountTemp.Contacts) {
                newAccountWallet += contactTemp.Contact_Wallet__c ;
            }
            if(newAccountWallet != accountTemp.Account_Wallet__c) {
                accountTemp.Account_Wallet__c = newAccountWallet;
                accountsToUpdate.add(accountTemp);
            }
        }
        if(!accountsToUpdate.isEmpty()) {
            update accountsToUpdate;
        }
    }

    private static Set<id> filterAccountIdWhereWalletWasChangedOnContact(Map<Id, Contact> newContacts, Map<Id, Contact> oldContacts) {
        Set<Id> accountsIds = new Set<Id>();
         for(Contact newContact : newContacts.values()) {
            if(oldContacts.get(newContact.Id).Contact_Wallet__c  != newContact.Contact_Wallet__c ) {
                accountsIds.add(newContact.AccountId);
            }
        }
        return accountsIds;
    }
}
