package mt.view.html.view.grid;

import mt.view.*;

public class VaddButton extends BaseTag {
	public String front() {
		String tempfront = "";
		tempfront += "<input type=\"button\" value=\"Ôö ¼Ó\" ";
		tempfront += super.getAllAttribute() + " ";
		tempfront += addclick();
		tempfront += "> \n";
		tempfront += onclick();
		return tempfront;
	}

	private String onclick() {
		String jscript = "<script type=\"text/javascript\">\n";
		jscript += " function  button" + getName() + "_onclick(){\n";
		/*jscript += "     var tableHtml=" + table + ".outerHTML.replace(/\\r\\n/g,''); \n";
		jscript += "     var tbodyHtml=" + tablebody + ".outerHTML.replace(/\\r\\n/g,'');\n ";
		jscript += "     var findPod= tableHtml.toLowerCase().indexOf(tbodyHtml.toLowerCase()); \n";
		jscript += "     var newTableHtml=tableHtml.substr(0,findPod); \n";
		jscript += "         newTableHtml+=\"<TBODY id='" + tablebody + "' name='" + tablebody + "'>\"; \n";
		jscript += "     try { \n";
		jscript += "     for (var i=0;i<" + tablebody + ".rows.length;i++) {\n";
		jscript += "        newTableHtml+=" + tablebody + ".rows[i].outerHTML; \n ";
		jscript += " } \n";
		jscript += " } catch(e){ \n";
		jscript += " }  \n";
		jscript += "         newTableHtml+=ac" + addobject + "; \n";
		jscript += "         newTableHtml+=\"</tbody>\"; \n";
		jscript += "         newTableHtml+=tableHtml.substr(findPod + tbodyHtml.length ); \n";
		jscript += table + ".outerHTML=newTableHtml; \n";*/
		// depend on jquery\
		jscript += "    $(\"#" + tablebody + "\").append(ac" + addobject + ");\n";
		jscript += "    f_adjust_seq(" + tablebody + ");\n";
		jscript += "}\n";
		jscript += "</script>\n";
		return jscript;
	}

	private String addclick() {
		return " onclick=\"return button" + getName() + "_onclick()\" ";
	}

	public String tablebody;

	public String getTablebody() {
		return tablebody;
	}

	public void setTablebody(String tablebody) {
		this.tablebody = tablebody;
	}

	public String table;

	public String getTable() {
		return table;
	}

	public void setTable(String table) {
		this.table = table;
	}

	public String addobject;

	public String getAddobject() {
		return addobject;
	}

	public void setAddobject(String addobject) {
		this.addobject = addobject;
	}

}
