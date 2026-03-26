%dw 2.0
output application/json
---
payload map ((item, index) -> {
    ProductCode: item.FFIITMN,
    Product_Code_External__c: item.FFIITMN,
    Active_Code__c: if (item.FFIARCD?) item.FFIARCD else null,
    Item_Pack__c: if (item.FFIPCKI?) item.FFIPCKI else null,
    Item_size__c: if (item.FFISZEI?) item.FFISZEI else null,
    UPC_Number_case__c: if (item.FFIUPCN?) item.FFIUPCN else null,
    Name: if (item.FFIIDE1?) item.FFIIDE1 else null,
    Description: if (item.FFIIDE2?) item.FFIIDE2 else null,
    Item_weight__c: if (item.FFIWTIW?) item.FFIWTIW else null,
    Tare_weight__c: if (item.FFIWTET?) item.FFIWTET else null,
    Catch_weight_code__c: if (item.FFICWCD?) item.FFICWCD else null,
    Case_cube__c: if (item.FFICBEC?) item.FFICBEC else null,
    Item_brand__c: if (item.FFIBRDN?) item.FFIBRDN else null,
    Height__c: if (item.FFIHGTH?) item.FFIHGTH else null,
    Width__c: if (item.FFIWDTH?) item.FFIWDTH else null,
    Depth__c: if (item.FFIDPTH?) item.FFIDPTH else null,
    Item_brand_code__c: if (item.FFIBNCD?) item.FFIBNCD else null
} filterObject ((value, key, index) -> value != null))