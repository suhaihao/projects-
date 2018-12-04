package mt.view.html.view.grid;

import javax.servlet.jsp.tagext.*;
import javax.servlet.jsp.JspWriter;

public class VaddColumn extends BodyTagSupport {

	public int doAfterBody() {
		BodyContent body = getBodyContent();
		String filteredBody = body.getString();

		try {
			byte[] bytes = { 13, 10 };
			filteredBody = filteredBody.trim().replaceAll(new String(bytes), "");
			filteredBody = filteredBody.trim().replaceAll("\n", "");
			String jscript = " <script type=\"text/javascript\">\n";
			jscript += " var ac" + getName() + ";\n";
			jscript += " ac" + getName() + " = '" + filteredBody.replaceAll("'","\"")+"\n";
			
			//jscript += "     ac" + getName() + " =\"" + filteredBody.replaceAll("\"", "¡°") + "\";\n";
			//jscript += "     ac" + getName() + "= ac" + getName() + ".replace(/¡°/g,'\"');";
			jscript += "</script>\n";
			JspWriter out = body.getEnclosingWriter();
			out.print(jscript);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SKIP_BODY;
	}

	protected String name;

	public void setName(String name) {
		this.name = name;
	}

	public String getName() {
		return this.name;
	}
}
