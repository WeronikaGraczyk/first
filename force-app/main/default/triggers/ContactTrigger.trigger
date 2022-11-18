trigger ContactTrigger on Contact (before insert, before update, after update) {
    new ContactTriggerHandler().run();
}