%dw 2.0
output application/json
---
payload map ((item, index) ->{	
	ProductCode: trim(item.FFIITMN),
	IsActive: if(item.FFIARCD?) trim(item.FFIARCD)  default  "" else "KeyToBeRemoved",
	Item_Pack__c: if(item.FFIPCKI?) trim(item.FFIPCKI)  default  "" else "KeyToBeRemoved",
	Item_size__c: if(item.FFISZEI?) trim(item.FFISZEI)  default  "" else "KeyToBeRemoved",
	UPC_Number_case__c: if(item.FFIUPCN?) trim(item.FFIUPCN)  default  "" else "KeyToBeRemoved",
	Name: if(item.FFIIDE1?) trim(item.FFIIDE1)  default  "" else "KeyToBeRemoved",
	Description: if(item.FFIIDE2?) trim(item.FFIIDE2)  default  "" else "KeyToBeRemoved",
	Item_weight__c: if(item.FFIWTIW?) item.FFIWTIW  default null else "KeyToBeRemoved",
	Tare_weight__c: if(item.FFIWTET?) item.FFIWTET  default null else "KeyToBeRemoved",
	Catch_weight_code__c: if(item.FFICWCD?) trim(item.FFICWCD)  default  "" else "KeyToBeRemoved",
	Case_cube__c: if(item.FFICBEC?) item.FFICBEC  default null else "KeyToBeRemoved",
	Item_brand__c: if(item.FFIBRDN?) trim(item.FFIBRDN)  default  "" else "KeyToBeRemoved",
	Height__c: if(item.FFIHGTH?) item.FFIHGTH  default null else "KeyToBeRemoved",
	Width__c: if(item.FFIWDTH?) item.FFIWDTH  default null else "KeyToBeRemoved",
	Depth__c: if(item.FFIDPTH?) item.FFIDPTH  default null else "KeyToBeRemoved",
	Item_brand_code__c: if(item.FFIBNCD?) trim(item.FFIBNCD)  default  "" else "KeyToBeRemoved"
} filterObject ((value, key, index) -> value != "KeyToBeRemoved")
)