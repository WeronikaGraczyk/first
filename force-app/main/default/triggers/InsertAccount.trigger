trigger InsertAccount on Accouunt (before insert) {
    new InsertAccountHandler.run(Trigger.new);
}