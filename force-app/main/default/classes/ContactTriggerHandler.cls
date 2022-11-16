public with sharing class ContactTriggerHandler extends TriggerHandler{
    
    public override void beforeInsert(){
        List<Contact> contacts=Trigger.new;
        CheckGenederContact.checkGender(contacts);
    }
    public override void beforeUpdate(){
        List<Contact> contacts=Trigger.new;
        CheckGenederContact.checkGender(contacts);
    }
    public override void afterUpdate(){
        List<Contact> newContacts = Trigger.new;
        List<Contact> oldContacts = Trigger.old;
        ChangeAccountBudgets.changeBudget(newContacts, oldContacts);
    }
}
