import { LightningElement,api } from 'lwc';
import apexClassList from '@salesforce/apex/LWCapexClass.apexClasses';
export default class ShowClasses extends LightningElement {
@api apexList;
@api error;
    connectedCallback(){
        console.log('Inside conncected call back')
        apexClassList()
            .then(result => { 
                this.apexList = result;  
                 console.log('Result:---'+JSON.stringify(this.apexList));
            })
            .catch(error => {
                this.error = error;
            });
    }
}