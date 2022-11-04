public with sharing class ContactTriggerHandler extends TriggerHandler{
    List<Contact> contact=Trigger.new;
    public override void beforeInsert(){
        CheckGenederContact.checkGender(contact);
    }
    public override void beforeUpdate(){
        CheckGenederContact.checkGender(contact);
    }
}
