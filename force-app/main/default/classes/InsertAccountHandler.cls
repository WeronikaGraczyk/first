public with sharing class InsertAccountHandler extends TriggerHandler{
    
    public override void beforeInsert(){
        CreateNewContact.createContact(Trigger.new);
    }
}
