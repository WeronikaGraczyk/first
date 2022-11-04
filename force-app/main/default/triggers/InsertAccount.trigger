trigger InsertAccount on Account (after insert) {
    new AfterAccountHandler().run();
}