import { LightningElement, api, track } from 'lwc';
import connectWithApi from '@salesforce/apex/CarController.connectWithApi';
export default class CarButton extends LightningElement {
    @api recordId;
    @track error;
    @track response;
    async handleClick() {
        connectWithApi({carId : this.recordId})
    }
}