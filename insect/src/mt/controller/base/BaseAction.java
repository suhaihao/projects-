package mt.controller.base;

/**
 * <p>Title:基类（最基础的action）</p>
 * <p>Description:标注（通用）ACTION,用于其它action来继承
 * </p>
 * <p>Copyright: Copyright (c) 2005</p>
 * <p>Company: </p>
 * @author not attributable
 * @version 1.0
 */
//三方包
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
 * 继承apache.struts.action.*
 * 同时创建自己的增加、删除、修改、分页查询、查询，还有其它的数据处理框架结构
 * 是本套系统所有action的基类
 */
public class BaseAction extends Action {
	public BaseAction() {
		try {
			jbInit();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	// 通过日志测试连接释放（测试开了多少连接，关闭多少连接。需要测试时放开）
	// protected static Logger _log = Logger.getLogger("sb");
	/*
	 * 声明公共变量
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
	 * struts 标准框架 分1、2、3步
	 */
	public ActionForward execute(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest httpServletRequest,
			HttpServletResponse httpServletResponse) {
		// 1.初始化 Request，Response，session

		/*
		 * 用于同步令牌 用于确保数据只提交一次的情况，现在把它注释掉，需要调用时，在子类中增加这段代码
		 * 因为查询，分页查询功能不能调用此方法，所以没有放在基类中 if (!isPageRefresh()){ return null; }
		 */
		ServletObject servletObject = null;
		try {
			// 2.清除通过action跳转页面的缓存，屏蔽后退功能（为了安去起见，有些系统不许要时，可以删除）
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

			// 3.此方法非常重要，通过此方法来展开数据增删改查结构（只是一个父结构，核心是做了数据连接和关闭）
			// 对数据的增、删、改、查都在此方法的分支方法中具体实现功能
			dataProcess(servletObject);
		} catch (Exception e) {
			new mt.tools.customException(e, this.toString());
		}
		// struts标准结构，控制页面跳转，这是最后一个步骤，此类数据流转结束！！！
		return actionMapping.findForward(switchForward(servletObject
				.getActForward()));
	}

	// 用于分页跳转，将分页跳转方向转换为查询页面（将DIVPAGE转为QUERY）
	// 此方法可用于子类的重载
	protected String switchForward(String forward) {
		if (forward.trim().equals("DIVPAGE")) {
			forward = "QUERY";
		}
		return forward;
	}

	// 装载分析数据
	protected FormData dataLoad(HttpServletRequest httpServletRequest,
			HttpServletResponse httpServletResponse) {
		return new FormData(httpServletRequest, httpServletResponse);
	}

	/*
	 * 此是isPageRefresh方法源码 令牌刷新 用于确保数据只提交一次的情况，现在把它注释掉，需要调用时，在子类中增加这段代码
	 * 因为查询，分页查询功能不能调用此方法，所以没有放在基类中,子类可以继承它的方法
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
	 * 从execute分支的核心方法（也是地层的核心方法），只针对数据处理 主要有 INSERT UPDATE DELETE QUERY
	 * QUERYSINGLE DIVPAGE PRINT（空方法）供子类继承重载 是控制（创建）数据连接和数据连接关闭的基类方法，是子类的框架标注。
	 * 分1、2、3步
	 */
	public void dataProcess(ServletObject servletObject) {
		// 1、取数据（此方法非常重要是处理数据的核心方法）
		servletObject.formData = dataLoad(servletObject.httpServletRequest,
				servletObject.httpServletResponse);
		// 用于调试代码用，主要功能是显示收取的数据内容，需要调试时可以放开（现时注释掉了）
		// new mt.model.ViewDataObject(formData.dataObject).view();
		try {
			// 2、建立数据连接（对于连接连接时间比较长的时候，可以在具体模块中自定义连接方式,
			// （要求必须有finally方法，在自定义方法中必须要自己关闭数据连接））
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
		// 3、关闭数据连接，（调用finally 方法关闭）
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
	 * //通过日志测试连接释放（测试开了多少连接，关闭多少连接。需要测试时放开）
	 * 
	 * private void createLog() { try { if (fh == null) { fh = new
	 * FileHandler("dbc.log"); } if (_log.getHandlers().length < 1) {
	 * _log.addHandler(fh); } } catch (Exception e) { e.printStackTrace(); } }
	 */
}
