package mt.view;

import javax.servlet.http.*;

import org.apache.struts.action.*;

public class cAction extends Action {

	public ActionForward execute(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest httpServletRequest,
			HttpServletResponse httpServletResponse) {
		/** @todo: complete the business logic here, this is just a skeleton. */
		// throw new java.lang.UnsupportedOperationException("Method perform()
		// not yet implemented.");
		try {
			// System.out.print("aaa");
			// System.err.print("aaa");
		} catch (Exception e) {
		}
		return actionMapping.findForward("aaa");
	}

}
