trigger conttrigger on Contact (after insert) {
  for(Contact cont:Trigger.new){
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {cont.email}; 
        mail.setTargetObjectId(cont.id);
     
        mail.setToAddresses(toAddresses);
 
        mail.setReplyTo('support@acme.com');
         
        mail.setSenderDisplayName('Salesforce Support');
                    
        mail.setBccSender(false);
        mail.setUseSignature(false);
        mail.setTemplateId('00X90000000j49k');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
   
}

}