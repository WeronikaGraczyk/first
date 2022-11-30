import { LightningElement, api, track } from 'lwc';
import fetchWrapperData from '@salesforce/apex/Wrapper.fetchWrapperData';
export default class carList extends LightningElement {
	@track COLUMNS = [
    { label: 'Name', fieldName: 'Car_name' },
    { label: 'Fuel', fieldName: 'Car_Fuel'},
	{ label: 'Contact Name', fieldName: 'Contact_Name' }
	];

	@api recordId;
    @track error;
    @track data;

	async connectedCallback() {
		await this.loadCars();
	}

	async loadCars() {
		fetchWrapperData({AccountId : this.recordId})
			.then(result => {
				this.data = result;
			})
			.catch(error => {
				this.error = error;
			});
	}
}