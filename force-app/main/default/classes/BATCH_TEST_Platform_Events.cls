global with sharing class BATCH_TEST_Platform_Events implements Database.Batchable<Object>,Database.Stateful {

    private SettingsBatch sb = new SettingsBatch();

    public BATCH_TEST_Platform_Events(){}

    public BATCH_TEST_Platform_Events(SettingsBatch sb){
        sb.setCountSpinner();
        this.sb = sb;
    }

    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator( this.sb.getMapSoql().get( this.sb.getCountSpinner() ) );
    }

    public void execute(Database.BatchableContext bc, List<Object> scope){
    }

    public void finish(Database.BatchableContext bc){
        if( this.sb.getCountSpinner() <= (this.sb.getMapSoql().size()-1) ){
            launchBatch();
        }
    }

    public void launchBatch(){
        BATCH_TEST_Platform_Events batchTest = new BATCH_TEST_Platform_Events( this.sb );
        
        EventBus.publish( 
            new SCPC_Spinner__e( Progress_count__c = ( Decimal.valueOf(this.sb.getCountSpinner()) / this.sb.getMapSoql().size() ) * 100 ) 
        );

        System.debug('>>>>this.sb.getCountSpinner(): '+this.sb.getCountSpinner());
        System.debug('>>>>this.sb.getMapSoql().size(): '+this.sb.getMapSoql().size());
        System.debug('>>>>count: '+( Decimal.valueOf(this.sb.getCountSpinner()) / this.sb.getMapSoql().size() ) * 100);
        
        Database.executeBatch(batchTest);
    }

    public class SettingsBatch {
        public Integer countSpinner = 0;

        public Integer getCountSpinner(){
            return this.countSpinner;
        }

        public Integer setCountSpinner(){
            return ++this.countSpinner;
        }

        public Map<Integer,String> getMapSoql() {

            Map<Integer,String> map_soql = new Map<Integer,String>{
                1=>'SELECT Id, Name FROM Account',
                2=>'SELECT Id, Name FROM Account',
                3=>'SELECT Id, Name FROM Account',
                4=>'SELECT Id, Name FROM Account',
                5=>'SELECT Id, Name FROM Account'
            };

            return map_soql;
                
        }
    }

}