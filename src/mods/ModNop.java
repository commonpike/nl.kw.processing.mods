package nl.kw.processing.portmods;

public class ModNop extends Mod  {
  
   public ModNop() {
     super();
     debug(this,"setup");
     addPort("in"); 
     addPort("out"); 
   }

   protected void calc() {
     debug(this,"calc");
     set("out",get("in"));
   }
}