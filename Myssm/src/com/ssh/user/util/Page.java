package com.ssh.user.util;

public class Page {
	// ҳ������
	int pagesize = 0;
	// �ܼ�¼��
	int allSize = 0;
	// ��ҳ��
	int totalPage =0 ;
	//��ǰҳ��
	int page;
	//��ѯ�������
	int max=0;
	//��ѯ��С����
	int min=0;
	public Page(int pagesize,int allSize,int page) {
		this.pagesize=pagesize;
		this.allSize=allSize;
		if(page<1)
		{
			this.page=1;
		}
		else
		{
			this.page=page;
		}
		this.totalPage=(allSize + this.pagesize - 1) / this.pagesize;
		if(this.totalPage==0)
		{
			this.totalPage=1;
		}
		if(page>totalPage)
		{
			this.page=totalPage;
		}
		this.max=this.page*this.pagesize;
		if(this.page==1||this.page<1)
		{
		 this.min=1;
		}
		else
		{
		 this.min=(this.page-1)*this.pagesize+1;
		}
	}

	public int getMax() {
		return max;
	}

	public void setMax(int max) {
		this.max = max;
	}

	public int getMin() {
		return min;
	}

	public void setMin(int min) {
		this.min = min;
	}

	public int getPagesize() {
		return pagesize;
	}

	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}
	public int getAllSize() {
		return allSize;
	}

	public void setAllSize(int allSize) {
		this.allSize = allSize;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

}
