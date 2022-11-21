public with sharing class ContactTriggerHandler extends TriggerHandler{
    
    public override void beforeInsert(){
        List<Contact> contacts = Trigger.new;
        CheckGenederContact.checkGender(contacts);
    }

    public override void beforeUpdate(){
        List<Contact> contacts = Trigger.new;
        CheckGenederContact.checkGender(contacts);
    }

    public override void afterUpdate(){
        Map<Id, Contact> newContacts = (Map<Id, Contact>) Trigger.newMap;
        Map<Id, Contact> oldContacts = (Map<Id, Contact>) Trigger.oldMap;
        ChangeAccountWallet.updateAccountWallet(newContacts, oldContacts);
    }
}
