public with sharing class ResourceDataTable {
   
       // This method will return Resource to LWC
 @AuraEnabled(cacheable=true)
public static List<Resource__c> retriveResourceRecords() {
 List<Resource__c> resourceList = [SELECT Name, Availability_in__c, Availability_status__c, Highest_education__c, Location__c, Looking_for__c, Relavent_Experience__c, Relavent_skill_set__c, Total_IT_experience__c FROM Resource__c WHERE Total_IT_experience__c != null];
return resourceList;
 }
    
    // This method will return Resource-Details to LWC
     @AuraEnabled(cacheable=true)
     public static List<Resource_Detail__c> retriveResourceDetailRecords(String recId) {
     List<Resource_Detail__c> rdObj = new List<Resource_Detail__c>();
    
     List<Resource_Detail__c> resourceDetailsList = [SELECT Name, Availability_in__c, End_date__c, Project__c,Location__c, Served_company__c, Start_date__c, Worked_skill_set__c FROM Resource_Detail__c WHERE Resource__c = :recId];
     for(Resource_Detail__c rdr:resourceDetailsList) {
     rdObj.add(rdr);
     }
    
     return rdObj;
     }
}