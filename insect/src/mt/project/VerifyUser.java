package mt.project;

import mt.controller.InitAction;
import mt.project.share.User;
import javax.servlet.http.*;
public class VerifyUser{
  public boolean verifyUser=false;
  public  VerifyUser(HttpServletRequest httpServletRequest,HttpServletResponse httpServletResponse) {
     javax.servlet.http.HttpSession session = httpServletRequest.getSession(true);
     User user=(User)session.getAttribute("user");
     if (user==null){
           verifyUser=true;

     }else {
           verifyUser=false;
     }
  }

  public boolean isNavigate(){
       return verifyUser;
  }

}
