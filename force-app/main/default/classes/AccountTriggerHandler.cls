public with sharing class AccountTriggerHandler extends TriggerHandler{

    public override void afterInsert(){
        List<Account> newAccounts = Trigger.new;
        CreateNewContact.createContact(newAccounts);
    }
}