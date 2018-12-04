package mt.view.html.view;

public class PrintSheet extends Sheet  {
  protected PrintHeader printHeader;
  public int doStartTag() {
   int curpage=0;

   super.printStart();
  try {
     session= this.pageContext.getSession();
     initdivPage();
     printHeader= (PrintHeader)this.getParent();
     curpage=printHeader.curPage;
//     System.out.print(curpage);
     pjdo.move( this.pagesize * ( curpage -1) );
     if (pjdo.getRow() > 0 ){
       return EVAL_BODY_INCLUDE;
     }
   }catch(Exception e) {
       qc.close();
       e.printStackTrace();
   }
      qc.close();
     return SKIP_BODY;
 }

  public int doAfterBody(){
   try {
     if (pjdo.next())  {
          return EVAL_BODY_AGAIN; }
        pjdo.close();
        qc.close();
   } catch(Exception e) {
       qc.close();
       new mt.tools.customException(e,this.toString());
   }
       return SKIP_BODY;
 }
}
