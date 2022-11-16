trigger ContactTrigger on Contact (before insert, before update,after Update) {
    new ContactTriggerHandler().run();
}