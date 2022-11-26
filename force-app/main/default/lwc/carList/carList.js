import { LightningElement, wire } from 'lwc';
import getAllCars from '@salesforce/apex/CarController.getAllCars';
export default class carList extends LightningElement {
    @wire(getAllCars)
    error;
    cars;
	connectedCallback() {
		this.loadCars();
	}
	loadCars() {
		getAllCars()
			.then(result => {
				this.cars = result;
			})
			.catch(error => {
				this.error = error;
			});
	}
}