trigger InsertAccount on Account (before insert) {
    new InsertAccountHandler().run();
}