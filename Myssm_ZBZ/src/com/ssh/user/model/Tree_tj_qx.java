package com.ssh.user.model;

import java.util.List;

public class Tree_tj_qx {
	private String BM;
	private String Text;
	private List<Tree_tj_jd> nodes;
	public String getBM() {
		return BM;
	}
	public void setBM(String bM) {
		BM = bM;
	}
	public String getText() {
		return Text;
	}
	public void setText(String text) {
		Text = text;
	}
	public List<Tree_tj_jd> getNodes() {
		return nodes;
	}
	public void setNodes(List<Tree_tj_jd> nodes) {
		this.nodes = nodes;
	}
	
}
