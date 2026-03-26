%dw 2.0
output application/json
---
payload map ((item, index) ->{
	"Account__r.Customer_Number__c": if(item.HHICUSN?) trim(item.HHICUSN) default "" else "KeyToBeRemoved",
	"Sales_Order__r.Order_Number__c": if(item.HHIORNR?) trim(item.HHIORNR) default "" else "KeyToBeRemoved",
	Order_Number_Line_External__c: if(item.HHIORNR? and item.HHILNOI?) trim(item.HHIORNR) ++ "_" ++ trim(item.HHILNOI) default "" else "KeyToBeRemoved",
	Line_number__c: trim(item.HHILNOI),
	Memo_billing_code__c: if(item.HHIMEMO?) trim(item.HHIMEMO)  default  "" else "KeyToBeRemoved",
	Credit_order_Flag__c: if(item.HHICRIN?) trim(item.HHICRIN)  default  "" else "KeyToBeRemoved",
	Ship_Date__c: if(item.HHIDTES?) (if(!isEmpty(item.HHIDTES)) ((item.HHIDTES[0 to 3]++'-' ++ item.HHIDTES[4 to 5]++'-' ++ item.HHIDTES[6 to 7]) as Date {format: "yyyy-MM-dd"}  default null) else null) else "KeyToBeRemoved",
	Order_Date__c: if(item.HHIDTET?) (if(!isEmpty(item.HHIDTET)) ((item.HHIDTET[0 to 3]++'-' ++ item.HHIDTET[4 to 5]++'-' ++ item.HHIDTET[6 to 7]) as Date {format: "yyyy-MM-dd"}  default null) else null) else "KeyToBeRemoved",
	Route_number__c: if(item.HHIRTEN?) trim(item.HHIRTEN)  default  "" else "KeyToBeRemoved",
	"Product__r.Product_Code_External__c": if(item.HHIITMN?) trim(item.HHIITMN)  default  "" else "KeyToBeRemoved",
	Quantity_ordered__c: if(item.HHIQYOA?) item.HHIQYOA default  null else "KeyToBeRemoved",
	Quantity_shipped__c: if(item.HHIQYSA?) item.HHIQYSA default  null else "KeyToBeRemoved",
	Item_price__c: if(item.HHIPRCN?) item.HHIPRCN default  null else "KeyToBeRemoved",
	Item_price_gross__c: if(item.HHIPRCG?) item.HHIPRCG default  null else "KeyToBeRemoved",
	Salesrep_cost__c: if(item.HHICSTS?) item.HHICSTS default  null else "KeyToBeRemoved",
	Order_Gross_Cost__c: if(item.HHICSTY?) item.HHICSTY default  null else "KeyToBeRemoved",
	Actual_cost__c: if(item.HHICSTZ?) item.HHICSTZ default  null else "KeyToBeRemoved",
	Market_cost__c: if(item.HHICSTM?) item.HHICSTM default  null else "KeyToBeRemoved",
	O_E_Sales_rep_cost__c: if(item.HHICSTR?) item.HHICSTR default  null else "KeyToBeRemoved",
	Price_book_heading_n__c: if(item.HHIPBHN?) trim(item.HHIPBHN)  default  "" else "KeyToBeRemoved",
	Price_book_heading_f__c: if(item.HHIPBHF?) trim(item.HHIPBHF)  default  "" else "KeyToBeRemoved",
	Warehouse_area_id__c: if(item.HHIWHNA?) trim(item.HHIWHNA)  default  "" else "KeyToBeRemoved",
	Vendor_number__c: if(item.HHIVNDN?) trim(item.HHIVNDN)  default  "" else "KeyToBeRemoved",
	Class_code__c: if(item.HHICLSN?) trim(item.HHICLSN)  default  "" else "KeyToBeRemoved",
	OE_Credit_code__c: if(item.HHICRDC?) trim(item.HHICRDC)  default  "" else "KeyToBeRemoved",
	Ext_sales_gross__c: if(item.HHIEXSG?) item.HHIEXSG default  null else "KeyToBeRemoved",
	Ext_sales_net__c: if(item.HHIEXSN?) item.HHIEXSN default  null else "KeyToBeRemoved",
	Ext_salesrep_cost_gr__c: if(item.HHIEXCG?) item.HHIEXCG default  null else "KeyToBeRemoved",
	Ext_salesrep_cost_ne__c: if(item.HHIEXCR?) item.HHIEXCR default  null else "KeyToBeRemoved",
	Ext_actual_cost__c: if(item.HHIEXAC?) item.HHIEXAC default  null else "KeyToBeRemoved"
} filterObject ((value, key, index) -> value != "KeyToBeRemoved")
)