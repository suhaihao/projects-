package mt.view.html.view;
import mt.project.share.*;
public class RoleInput extends Input  {
  public String front(){
     String tempfront="";
     tempfront+="<input"+" " ;
     tempfront+=type()+" ";
     tempfront+=getAuthority()+" ";
     tempfront+=super.getAllAttribute()+" ";
     tempfront+=value();
     tempfront+=">";
     return tempfront;
}

protected String getAuthority(){
  String authority="";
  String localPath="";
  String returnHtml="";
  localPath= ((javax.servlet.http.HttpServletRequest)this.pageContext.getRequest()).getServletPath();
  javax.servlet.http.HttpSession session = this.pageContext.getSession();
  User user=null;
  try {
     user= (User) session.getAttribute("user");
  }catch(Exception e){
    e.printStackTrace();
  }
  if (user==null){
  try{
    ( (javax.servlet.http.HttpServletResponse)this.pageContext.getResponse()).
        sendRedirect("/struts/login.jsp");
  }catch(Exception e){
      e.printStackTrace();
  }
  }
  RoleAuthority  ra=new RoleAuthority();
  authority=ra.getAuthority(localPath,user.userId);
  switch (Integer.parseInt(authority)) {
  case 0:
       returnHtml=" style='display: none' ";
       break;
  case 1:
       if ( this.name.startsWith("Q_")){}
       else {
         returnHtml=" style='display: none' ";
       }
       break;
  case 2:
       if ( this.name.startsWith("U_") ||this.name.startsWith("Q_") ){

       } else {
         returnHtml=" style='display: none' ";
       }
       break;
  case 5:
       break;
  }
  return returnHtml;
}
}
