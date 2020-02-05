package semi.intranet.daily.model.vo;

import java.io.Serializable;

public class PageInfo implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int currentPage; 	// ���� ������
	private int listCount;		// �� �Խñ� ��
	private int limitContent;	// �������� �Խñ� ��
	private int limitPage;		// �ѹ��� ������ ������ ��
	private int maxPage;		// ��ü ������ �� ������ ������
	private int startPage;		// �ѹ��� ǥ���� ������ �� �� ������
	private int endPage;		// �ѹ��� ǥ���� ������ �� ������ ������
	
	
	
	public PageInfo() {}



	public PageInfo(int currentPage, int listCount, int limitContent, int limitPage, int maxPage, int startPage,
			int endPage) {
		super();
		this.currentPage = currentPage;
		this.listCount = listCount;
		this.limitContent = limitContent;
		this.limitPage = limitPage;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
	}



	public int getCurrentPage() {
		return currentPage;
	}



	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}



	public int getListCount() {
		return listCount;
	}



	public void setListCount(int listCount) {
		this.listCount = listCount;
	}



	public int getLimitContent() {
		return limitContent;
	}



	public void setLimitContent(int limitContent) {
		this.limitContent = limitContent;
	}



	public int getLimitPage() {
		return limitPage;
	}



	public void setLimitPage(int limitPage) {
		this.limitPage = limitPage;
	}



	public int getMaxPage() {
		return maxPage;
	}



	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}



	public int getStartPage() {
		return startPage;
	}



	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}



	public int getEndPage() {
		return endPage;
	}



	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}



	@Override
	public String toString() {
		return "PageInfo [currentPage=" + currentPage + ", listCount=" + listCount + ", limitContent=" + limitContent
				+ ", limitPage=" + limitPage + ", maxPage=" + maxPage + ", startPage=" + startPage + ", endPage="
				+ endPage + "]";
	}


}