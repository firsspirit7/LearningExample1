@isTest
private class testclassondisplyngoppdetailsinhtml {

    static testMethod void myUnitTest() {
        
         
            
        
         
          Account acc = new Account();
          acc.name ='sruthikaaccount';
           acc.Type ='Prospect';
           acc.Industry='HealthCare';           
           acc.BillingCity= 'visakhapatnam';
           acc.BillingCountry= 'India';
           acc.Website = 'www.sruthimail.com';
           acc.BillingStreet=' iskhathota';
           acc.BillingPostalCode= 'D:no : 54-11-8/4';          
           acc.BillingState='Andhra Pradesh';
          insert acc ; 
         
         
         
        Opportunity oppnew = new Opportunity();
        oppnew.Name ='sruthika5445';
        oppnew.StageName='ClosedName';
         oppnew.CloseDate=date.parse('2/27/1990');       
         oppnew.AccountId =acc.id;
         oppnew.Amount = 40000;
                           
               insert oppnew;
          Apexpages.currentpage().getParameters().put('id',oppnew.id);
         
           
          
         
          
          Contact cnt = new Contact();
          cnt.LastName = 'sruthikatest';
         
          cnt.Email = 'sruthi.pelleti1990@gmail.com';
          cnt.Phone = '9440527104';
          
          insert cnt ;
          
          
         
          OpportunityContactRole  oppcnt =new opportunityContactRole();
                oppcnt.ContactId = cnt.id ;             
                oppcnt.Role ='Decision Maker';
                oppcnt.OpportunityId = oppnew.Id;               
               insert oppcnt;
               
               
           Product2 prdt = new Product2();
                    prdt.Name ='keyboards';
                   
           insert prdt;
           
        List<Pricebook2>  lstpri = new List<Pricebook2>();  
         lstpri = [ Select IsStandard ,Id From Pricebook2 where IsStandard = true  ];
         
         
        priceBookEntry prbentry = new pricebookEntry();
            prbentry.Product2Id = prdt.Id;
            prbentry.Pricebook2Id= lstpri[0].id;
             prbentry.UnitPrice = 200;
             prbentry.IsActive = true;
             insert prbentry;
        
        
         
         
        OpportunityLineItem oppline  = new OpportunityLineItem();
         
          oppline.TotalPrice=5000;
          oppline.Quantity= 25;        
          oppline.OpportunityId = oppnew.id;
          oppline.PricebookEntryId = prbentry.id;
           
           insert oppline ;
           
          
          displyngopportrelateddetailsinhtmlformat  obj = new displyngopportrelateddetailsinhtmlformat();
                  
            obj.lineitem();
           obj.pgedit();
           obj.pgedit1();
           obj.pgnew();
          obj.pgsave1();
         obj.pgsave();
          
           obj.pgsave2();
        
          
         
          
          
          
          
         
        
    }
}