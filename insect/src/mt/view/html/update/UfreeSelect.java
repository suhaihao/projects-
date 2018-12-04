package mt.view.html.update;

public class UfreeSelect extends Uselect {

	protected String opttext;

	public void setOpttext(String opttext) {
		this.opttext = (new mt.tools.CustString()).nullToString(opttext);
	}

	protected String optvalue;

	public void setOptvalue(String optvalue) {
		this.optvalue = optvalue;
	}

	protected String getDataTable() {

		if (!getValue().trim().equals("")) {
			this.defaultValue = getValue();
		} else {
			this.defaultValue = getDefaultvalue();
		}

		String strData = "";
		String sql = "";
		boolean state = false;

		String listname[] = this.opttext.split(":");
		String listvalue[] = this.optvalue.split(":");
		for (int i = 0; i < listname.length; i++) {
			if (defaultValue.equals(listvalue[i])) {
				state = true;
				strData += "<option selected value='" + listvalue[i] + "'>"
						+ listname[i] + "</option>";
			} else {
				strData += "<option value='" + listvalue[i] + "'>"
						+ listname[i] + "</option>";
			}
		}
		if (state == true) {
			strData += "<option value=\"\"></option>";
		} else {
			strData += "<option selected value=\"\"></option>";
		}
		return strData;
	}

}
