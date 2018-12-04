package com.ssh.user.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
public class Tree_qx {
private String BM;
private String Text;
private List<Tree_jd> nodes;
public String getText() {
	return Text;
}
public void setText(String text) {
	Text = text;
}
public List<Tree_jd> getNodes() {
	return nodes;
}
public void setNodes(List<Tree_jd> nodes) {
	this.nodes = nodes;
}
public String getBM() {
	return BM;
}
public void setBM(String bM) {
	BM = bM;
}

}
