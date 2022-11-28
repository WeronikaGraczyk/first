import { LightningElement, wire, api, track } from 'lwc';
import getAllCars from '@salesforce/apex/CarController.getAllCars';
export default class carList extends LightningElement {
	@api recordId;
 	@track cars;
    @track error;
    
	connectedCallback() {
		this.loadCars();
	}
	loadCars() {
		getAllCars({AccountId : this.recordId})
			.then(result => {
				this.cars = result;
			})
			.catch(error => {
				this.error = error;
			});
	}
}