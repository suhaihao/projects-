package com.ssh.user.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
public class Tree_bj {
private String BM;
private String Text;
private List<Tree_qx> nodes;
public String getText() {
	return Text;
}
public String getBM() {
	return BM;
}
public void setBM(String bM) {
	BM = bM;
}
public void setText(String text) {
	Text = text;
}
public List<Tree_qx> getNodes() {
	return nodes;
}
public void setNodes(List<Tree_qx> nodes) {
	this.nodes = nodes;
}

}
