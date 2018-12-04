package com.ssh.user.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

public class Tree_jd {
private String BM;
private String Text;

public String getBM() {
	return BM;
}
public void setBM(String bM) {
	BM = bM;
}
public String getText() {
	return Text;
}
public void setText(String text){
	Text = text;
}

}
