package mt.view.html.view;

import mt.view.html.*;
import javax.servlet.jsp.PageContext;

public class DefaultFreeSelect
    extends FreeSelect {
  private String defaultParameter;
  public void setDefaultparameter(String defaultParameter){
    this.defaultParameter = defaultParameter;
  }
  public void setDefaultvalue(String defaultValue) {
    this.defaultValue = defaultValue;
  }
  protected String getDataTable() {
    defaultValue =(String) pageContext.getRequest().getAttribute(defaultParameter);
    return super.getDataTable();
  }
}
