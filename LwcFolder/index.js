import { LightningElement,wire,track } from 'lwc';
import retriveResourceDetailRecords from '@salesforce/apex/ResourceDataTable.retriveResourceDetailRecords';
export default class ResourceDetailsComp extends LightningElement {

    @track resourceId;
    @track records;
    @track errorMsg;    

    @wire (retriveResourceDetailRecords, {recId:'$resourceId'})
      wireresdetRecord({error,data}){
        if(data){
          this.records = data;     
          this.errorMsg = undefined;    
        }else{         
          this.errorMsg = error;
          this.records = undefined;
        }
      }

      handleChangeresourcedetailsAction(event){
        console.log('Inside the action');
        this.resourceId = event.detail;
        console.log('resourceId ' + this.resourceId);
    }

}