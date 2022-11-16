public without sharing class ChangeAccountBudgets {

    public static void isBudgetUpdate(List<Contact> newContacts, List<Contact> oldContacts){
        Map<Contact, Double> contactsAfterBudgetUpdate = new Map<Contact, double>();
        List<Account> allAccounts = [SELECT Budget__c, id FROM Account];
        List<Account> accountsToUpdate = new List<Account>();
        for(Contact newContact : newContacts){
            for(Contact oldContact : oldContacts){
                if(oldContact.id == newContact.id && oldContact.Contact_budget__c != newContact.Contact_budget__c){
                    contactsAfterBudgetUpdate.put(newContact, newContact.Contact_budget__c - oldContact.Contact_budget__c);
                }
            }   
        }

        for(Account account : allAccounts){
            for(Contact contact : contactsAfterBudgetUpdate.keySet()){
                if(account.id == contact.AccountId){
                    System.debug(contactsAfterBudgetUpdate.get(contact));
                    System.debug(account.Budget__c);
                    account.Budget__c = account.Budget__c + contactsAfterBudgetUpdate.get(contact);
                    System.debug(account.Budget__c);
                    accountsToUpdate.add(account);
                }
            }
        }
        update accountsToUpdate;
    }
}
