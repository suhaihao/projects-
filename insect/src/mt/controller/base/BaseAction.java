package mt.controller.base;

/**
 * <p>Title:���ࣨ�������action��</p>
 * <p>Description:��ע��ͨ�ã�ACTION,��������action���̳�
 * </p>
 * <p>Copyright: Copyright (c) 2005</p>
 * <p>Company: </p>
 * @author not attributable
 * @version 1.0
 */
//������
import java.util.logging.FileHandler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mt.controller.FormData;
import mt.tools.customException;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/*
 * �̳�apache.struts.action.*
 * ͬʱ�����Լ������ӡ�ɾ�����޸ġ���ҳ��ѯ����ѯ���������������ݴ����ܽṹ
 * �Ǳ���ϵͳ����action�Ļ���
 */
public class BaseAction extends Action {
	public BaseAction() {
		try {
			jbInit();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	// ͨ����־���������ͷţ����Կ��˶������ӣ��رն������ӡ���Ҫ����ʱ�ſ���
	// protected static Logger _log = Logger.getLogger("sb");
	/*
	 * ������������
	 */
	public static FileHandler fh;

	// public String actForward;
	// public FormData formData;
	// public ActionMapping actionMapping;
	// public ActionForm actionForm;
	// public HttpServletRequest httpServletRequest;
	// public HttpServletResponse httpServletResponse;
	// public javax.servlet.http.HttpSession session;
	/*
	 * struts ��׼��� ��1��2��3��
	 */
	public ActionForward execute(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest httpServletRequest,
			HttpServletResponse httpServletResponse) {
		// 1.��ʼ�� Request��Response��session

		/*
		 * ����ͬ������ ����ȷ������ֻ�ύһ�ε���������ڰ���ע�͵�����Ҫ����ʱ����������������δ���
		 * ��Ϊ��ѯ����ҳ��ѯ���ܲ��ܵ��ô˷���������û�з��ڻ����� if (!isPageRefresh()){ return null; }
		 */
		ServletObject servletObject = null;
		try {
			// 2.���ͨ��action��תҳ��Ļ��棬���κ��˹��ܣ�Ϊ�˰�ȥ�������Щϵͳ����Ҫʱ������ɾ����
			httpServletResponse.setHeader("Pragma", "no-cache");
			httpServletResponse.setHeader("Cache-Control", "no-cache");
			httpServletResponse.setHeader("Cache-Control", "no-store");
			httpServletRequest.setCharacterEncoding("GBK");
			servletObject = new ServletObject();
			String actForward = httpServletRequest.getParameter("ACT_TYPE");
			servletObject.httpServletRequest = httpServletRequest;
			servletObject.httpServletResponse = httpServletResponse;
			servletObject.actionMapping = actionMapping;
			servletObject.setActForward(actForward);

			// 3.�˷����ǳ���Ҫ��ͨ���˷�����չ��������ɾ�Ĳ�ṹ��ֻ��һ�����ṹ�������������������Ӻ͹رգ�
			// �����ݵ�����ɾ���ġ��鶼�ڴ˷����ķ�֧�����о���ʵ�ֹ���
			dataProcess(servletObject);
		} catch (Exception e) {
			new mt.tools.customException(e, this.toString());
		}
		// struts��׼�ṹ������ҳ����ת���������һ�����裬����������ת����������
		return actionMapping.findForward(switchForward(servletObject
				.getActForward()));
	}

	// ���ڷ�ҳ��ת������ҳ��ת����ת��Ϊ��ѯҳ�棨��DIVPAGEתΪQUERY��
	// �˷������������������
	protected String switchForward(String forward) {
		if (forward.trim().equals("DIVPAGE")) {
			forward = "QUERY";
		}
		return forward;
	}

	// װ�ط�������
	protected FormData dataLoad(HttpServletRequest httpServletRequest,
			HttpServletResponse httpServletResponse) {
		return new FormData(httpServletRequest, httpServletResponse);
	}

	/*
	 * ����isPageRefresh����Դ�� ����ˢ�� ����ȷ������ֻ�ύһ�ε���������ڰ���ע�͵�����Ҫ����ʱ����������������δ���
	 * ��Ϊ��ѯ����ҳ��ѯ���ܲ��ܵ��ô˷���������û�з��ڻ�����,������Լ̳����ķ���
	 */
	private boolean isPageRefresh(HttpServletRequest httpServletRequest) {
		boolean isNew = true;
		if (isTokenValid(httpServletRequest, true)) {
			resetToken(httpServletRequest);
		} else {
			isNew = false;
			saveToken(httpServletRequest);
		}
		return isNew;
	}

	/*
	 * ��execute��֧�ĺ��ķ�����Ҳ�ǵز�ĺ��ķ�������ֻ������ݴ��� ��Ҫ�� INSERT UPDATE DELETE QUERY
	 * QUERYSINGLE DIVPAGE PRINT���շ�����������̳����� �ǿ��ƣ��������������Ӻ��������ӹرյĻ��෽����������Ŀ�ܱ�ע��
	 * ��1��2��3��
	 */
	public void dataProcess(ServletObject servletObject) {
		// 1��ȡ���ݣ��˷����ǳ���Ҫ�Ǵ������ݵĺ��ķ�����
		servletObject.formData = dataLoad(servletObject.httpServletRequest,
				servletObject.httpServletResponse);
		// ���ڵ��Դ����ã���Ҫ��������ʾ��ȡ���������ݣ���Ҫ����ʱ���Էſ�����ʱע�͵��ˣ�
		// new mt.model.ViewDataObject(formData.dataObject).view();
		try {
			// 2�������������ӣ�������������ʱ��Ƚϳ���ʱ�򣬿����ھ���ģ�����Զ������ӷ�ʽ,
			// ��Ҫ�������finally���������Զ��巽���б���Ҫ�Լ��ر��������ӣ���
			servletObject.dc = new mt.model.DataChannel();
			if (servletObject.getActForward().trim().toUpperCase().equals(
					"INSERT")) {
				insert(servletObject);
			} else if (servletObject.getActForward().trim().toUpperCase()
					.equals("UPDATE")) {
				update(servletObject);
			} else if (servletObject.getActForward().trim().toUpperCase()
					.equals("DELETE")) {
				delete(servletObject);
			} else if (servletObject.getActForward().trim().toUpperCase()
					.equals("QUERY")) {
				query(servletObject);
			} else if (servletObject.getActForward().trim().toUpperCase()
					.equals("QUERYSINGLE")) {
				querySingle(servletObject);
			} else if (servletObject.getActForward().trim().toUpperCase()
					.equals("DIVPAGE")) {
				divPage(servletObject);
			} else if (servletObject.getActForward().trim().toUpperCase()
					.equals("PRINT")) {
				printPage(servletObject);
			} else {
				other(servletObject);
			}
		} catch (Exception e) {
			new customException(e, this.toString());
		}
		// 3���ر��������ӣ�������finally �����رգ�
		finally {
			servletObject.dc.close();
		}
	}

	protected void insert(ServletObject so) {
	}

	protected void update(ServletObject so) {
	}

	protected void delete(ServletObject so) {
	}

	protected void query(ServletObject so) {
	}

	protected void other(ServletObject so) {
	}

	protected void querySingle(ServletObject so) {
	}

	protected void divPage(ServletObject so) {
	}

	protected void printPage(ServletObject so) {
	}

	private void jbInit() throws Exception {
	}
	/*
	 * //ͨ����־���������ͷţ����Կ��˶������ӣ��رն������ӡ���Ҫ����ʱ�ſ���
	 * 
	 * private void createLog() { try { if (fh == null) { fh = new
	 * FileHandler("dbc.log"); } if (_log.getHandlers().length < 1) {
	 * _log.addHandler(fh); } } catch (Exception e) { e.printStackTrace(); } }
	 */
}
