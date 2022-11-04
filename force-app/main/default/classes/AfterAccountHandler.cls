public with sharing class AfterAccountHandler extends TriggerHandler{
    List<Account> account = Trigger.new;
    public override void afterInsert(){
        CreateNewContact.createContact(account);
    }
}