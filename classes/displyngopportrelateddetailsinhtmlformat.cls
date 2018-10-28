public with sharing class displyngopportrelateddetailsinhtmlformat 
{
  public  Opportunity opp{get;set;}
  public List<OpportunityContactRole>  controle {get;set;}
  public set<string> contactid {get;set;}
  public List<contact> cnt {get;set;}
  public List<OpportunityLineItem> opplineitem {get;set;}
  public list<opportunity> lstopp {get;set;}
  public set<id> accid {get;set;}
  public account acc {get;set;}
  

  public  string oppid {get;set;}
  public boolean rendering {get;set;}
  public boolean Saverend{get;set;}
  public List<opportunity> lstopp1{get;set;}

public displyngopportrelateddetailsinhtmlformat (){
   
      rendering = true ;
      Saverend = false;
      opp = new opportunity ();
      contactid = new set<string>();
      controle = new List<OpportunityContactRole>();
      opplineitem = new List<OpportunityLineItem>();
      cnt = new  List<contact> ();
      lstopp1 = new list<opportunity>();
       accid = new set<id>();
       acc = new account();
        
    
     oppid = Apexpages.currentPage().getParameters().get('id');
     if(oppid!= null)
    {   
      opp = [Select StageName, Owner.Name, OwnerId, Id, CloseDate, Amount, Name,account.name , account.Industry, account.Type,accountid , account.website,account.BillingState,account.BillingCountry,account.BillingStreet, account.Phone     From Opportunity  where id =:oppid ];
      controle = [SELECT Role,opportunityid ,contactid,contact.email,contact.name,contact.leadsource  FROM OpportunityContactRole  where opportunityid=:oppid];
      System.debug('Controle:'+controle.size());
      System.debug('Controle:'+controle);
     
     
     opplineitem = [Select UnitPrice, TotalPrice, PricebookEntryId ,PricebookEntry.name, OpportunityId,ListPrice, LastModifiedDate, LastModifiedById From OpportunityLineItem  where opportunityid =:oppid];
     lstopp1 =[select accountid, id  from opportunity where id =:oppid ];
     if(lstopp1!=null && lstopp1.size()>0){
      for(opportunity opp :lstopp1)
      {
        accid.add(opp.accountid);
      }
     
   acc =[select name ,id, Industry, Type,website,BillingState,BillingCountry,BillingStreet, Phone FROM ACCOUNT  where id =:accid];  
     
     }
}

     
        
     
      
       system.debug('=========>'+opplineitem);
            
}





  public void pgedit()
  {
        rendering = false;
         Saverend= true ;
        
  }

public void pgsave()
{   system.debug('==========>'+opp.account.name);
    update opp;
     system.debug('==========>'+opp.account.name);
    
    rendering = true ;
   
         
      
     
         
}

  public pagereference pgnew()
  {
     pagereference pg = new pagereference('/006/e?retURL=%2F006%2Fo');
      return pg;
  }
  
  public void pgedit1()
  {
        rendering = false ;
  }
public void pgsave1()
  
{ 
update acc;
system.debug('==========>'+opp);

rendering = true ;
               
       
}


public pagereference lineitem()
{
     pagereference pg = new pagereference ('/apex/opportunitylineitempage');

    return pg;

}
public void pgsave2()
  
{
update opplineitem;
rendering = true ;
        
         
         
}






}