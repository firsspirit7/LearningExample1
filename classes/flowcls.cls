public class flowcls{
public Flow.Interview.Mytestflow myTcFlow {get;set;}
public boolean isrender{get;set;}
public string recordid{get;set;}
public boolean getBackToAddendum(){

        if(myTcFlow != null) {
            isrender= myTcFlow.isrender;
            recordid=myTcFlow.Recordid;
           return isrender;
        }
        else{
            return isrender;
        }
       

    }

}