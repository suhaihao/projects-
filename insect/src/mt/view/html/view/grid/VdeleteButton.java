package mt.view.html.view.grid;

import mt.view.BaseTag;

public class VdeleteButton extends BaseTag {
  public String front(){
      String tempfront="";
      tempfront+="<input type=\"checkbox\" " ;
      tempfront+=super.getAllAttribute()+" ";
      tempfront+=addclick();
      tempfront+="> \n";
      return tempfront;
   }
  private String addclick(){
   return  " onclick=\"return f_delete_row(this)\" ";
}

}
