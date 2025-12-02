import { LightningElement } from 'lwc';
import { subscribe, unsubscribe, onError } from 'lightning/empApi';
import processCountSpinner from '@salesforce/apex/HD_LWC_PlatformEventSpinner.processCountSpinner';

export default class PlatformEventSpinner extends LightningElement {
    countSpinner = 0;
    subscription = null;

    get countSpinnerWith() {
        return `width: ${this.countSpinner}% !important;`;
    }

    connectedCallback(){
        this.subscribeToPlatformEvent();
        processCountSpinner()
        .then(() => {
            console.log('Fatto', 'Processo Avviato !');
        })
        .catch(error => {
            console.error("Errore durante la chiamata Apex: ", error);
        });
    }

    subscribeToPlatformEvent() {
        const channel = '/event/SCPC_Spinner__e';
        subscribe(channel, -1, (event) => {
            const eventData = event.data.payload;

            const incrementGradually = async (target) => {
                while (this.countSpinner < target) {
                    this.countSpinner++;
                    await new Promise(resolve => setTimeout(resolve, 200));
                }
            };
            
            incrementGradually(eventData.Progress_count__c);
            
            if (this.countSpinner === 100) {
                unsubscribe(this.subscription);
                
                console.log('Completato', 'Elaborazione completata!');
            }
        }).then(response => {
            this.subscription = response;
            console.log('Monitoragggio Event Avviato');
        }).catch(error => {
            console.error('Errore nella sottoscrizione:', error);
        });
    }
}