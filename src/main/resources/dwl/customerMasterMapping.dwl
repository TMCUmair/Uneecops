%dw 2.0
output application/json
---
payload map ((item, index) ->{
    Company_Number__c : if(item.FFCCMPN?) trim(item.FFCCMPN)  default  "" else "KeyToBeRemoved",
    Customer_Number__c : trim(item.FFCCUSN),
    Active__c:if(item.FFCARCD?) trim(item.FFCARCD)  default  "" else "KeyToBeRemoved",
    Name: if(item.FFCCNMB?) trim(item.FFCCNMB)  default  "" else "KeyToBeRemoved",
    BillingStreet : if(item.FFCCA1B? or item.FFCCA2B?) trim(item.FFCCA1B  default  "" ++ " " ++ item.FFCCA2B  default "") else "KeyToBeRemoved",
    BillingCity : if(item.FFCCTYB?) trim(item.FFCCTYB)  default  "" else "KeyToBeRemoved",
    BillingState : if(item.FFCSTEB?) trim(item.FFCSTEB)  default  "" else "KeyToBeRemoved",
    BillingPostalCode :if(item.FFCZPCB?) trim(item.FFCZPCB)  default  "" else "KeyToBeRemoved",
    Bill_To_Customer_Email__c : if(item.FFCBCEM?) trim(item.FFCBCEM)  default  "" else "KeyToBeRemoved",
    Bill_To_Customer_Website__c : if(item.FFCBCWS?) trim(item.FFCBCWS)  default  "" else "KeyToBeRemoved",
    Bill_To_Customer_a_r_Contact__c : if(item.FFCBCAC?) trim(item.FFCBCAC)  default  "" else "KeyToBeRemoved",
    Bill_To_Customer_a_r_Email__c : if(item.FFCBAEM?) trim(item.FFCBAEM)  default  "" else "KeyToBeRemoved",
    Bill_To_Customer_Purch_Agent__c : if(item.FFCBCPA?) trim(item.FFCBCPA)  default  "" else "KeyToBeRemoved",
    Bill_To_Purch_Agent_Email__c : if(item.FFCBPEM?) trim(item.FFCBPEM)  default  "" else "KeyToBeRemoved",
    Phone : if(item.FFCPHNB?) trim(item.FFCPHNB)  default  "" else "KeyToBeRemoved",
    NCR_Created_Date__c : if(item.FFCCDTE?) (if(!isEmpty(item.FFCCDTE)) ((item.FFCCDTE[0 to 3]++'-' ++ item.FFCCDTE[4 to 5]++'-' ++ item.FFCCDTE[6 to 7]) as Date {format: "yyyy-MM-dd"}  default null) else null) else "KeyToBeRemoved",
    NCR_Last_Modified_Date__c : if(item.FFCDTEM?) (if(!isEmpty(item.FFCDTEM)) ((item.FFCDTEM[0 to 3]++'-' ++ item.FFCDTEM[4 to 5]++'-' ++ item.FFCDTEM[6 to 7]) as Date {format: "yyyy-MM-dd"}  default null) else null) else "KeyToBeRemoved",
    Fax: if(item.FFCPHNF?) trim(item.FFCPHNF)  default  "" else "KeyToBeRemoved"
} filterObject ((value, key, index) -> value != "KeyToBeRemoved")
)