public with sharing class AfterAccountHandler extends TriggerHandler{
    
    public override void afterInsert(){
        CreateNewContact.createContact(Trigger.new);
    }
}