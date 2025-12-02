public with sharing class HD_LWC_PlatformEventSpinner {
    @AuraEnabled
    public static void processCountSpinner(){
        try {
            new BATCH_TEST_Platform_Events().launchBatch();
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}