package mt.view.html.view;

public class VTitleInput extends Vinput{
  String value = "";
  private String maxlength;
  public String front(){
    int maxlength_i = 8;
    try {
      maxlength_i = Integer.parseInt(maxlength);
    }
    catch (NumberFormatException ex) {
    }
    value = getValue();
    String tempfront="";
    tempfront+="<input"+" " ;
    tempfront+=type()+" ";
    tempfront+=super.getAllAttribute()+" ";
    tempfront+="value=\""+chop(value,Math.min(maxlength_i,value.getBytes().length),"...")+"\" ";
    tempfront+="title1=\" " + titleWrap(value,",") + " \"";
    tempfront+=">";
    return tempfront;
}
  public String titleWrap(String title,String regex){
    String titleWraped = title;
    titleWraped = titleWraped.trim().replaceAll(regex,", &#13;&#10; ");
    return titleWraped;
  }

    public static String chop(String orignalString,int length,String chopedString) {
      if (orignalString==null||orignalString.length()==0) {
        return orignalString;
      }
      orignalString=orignalString.replaceAll(" "," ");
      if (orignalString.length()<length) {
        return orignalString;
      }
      StringBuffer buffer=new StringBuffer(length);
      length=length*2;
      int count=0;
      int stringLength=orignalString.length();
      int i=0;
      int p = 0;
      int pp = 0;
      for (;count<length&&i<stringLength;i++) {
        pp = p;
        p = i;
        char c=orignalString.charAt(i);
        if (c<'\u00ff') {
          count++;
        } else {
          count+=2;
        }
        buffer.append(c);
      }
      if (i<stringLength) {
        return buffer.substring(0,pp)+chopedString;
      }
      return buffer.toString();
    }


  public void setMaxlength(String maxlength) {
    if(maxlength==null||maxlength.equals("null"))maxlength="";
    this.maxlength = maxlength.trim();
  }

}
