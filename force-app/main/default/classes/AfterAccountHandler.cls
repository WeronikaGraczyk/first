public with sharing class AfterAccountHandler extends TriggerHandler{

    public override void afterInsert(){
        List<Account> newAccounts = Trigger.new;
        CreateNewContact.createContact(newAccounts);
    }
}