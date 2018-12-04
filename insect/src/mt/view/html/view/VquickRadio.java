package mt.view.html.view;
import mt.view.html.Vobject;
import mt.view.html.DataValue;
public class VquickRadio
    extends Vobject {
  public String front(){
    String tempfront="";
    tempfront+="<input type=\"radio\" " ;
    tempfront+=super.getAllAttribute()+" ";
    tempfront+="onclick=\"";
    tempfront+=onSelect();
    tempfront+=paremeters();
    tempfront+="\"";
    tempfront+=">";
    return tempfront;
}

 private String onSelect;
 public void setOnSelect(String onSelect) {
   this.onSelect = onSelect;
 }
 private String paremeters;
 public void setParemeters(String paremeters) {
   this.paremeters = paremeters;
 }

 public String paremeters() {
   if(onSelect().equals("")) {
     return "";
   }
   DataValue dv=new DataValue();
   String tempreturn = "(";
   String[] paremeters = this.paremeters.split(",");
   for(int i=0;i<paremeters.length;) {
     tempreturn+="'" + dv.getValueBySheet(paremeters[i],this) + "'";
     i++;
     if(i<paremeters.length) {
       tempreturn+=",";
     }
   }
   tempreturn+=")";
   return tempreturn;
}

 public String onSelect(){
   if(onSelect==null) {
     return "";
   }
   return onSelect.trim();
 }
}
