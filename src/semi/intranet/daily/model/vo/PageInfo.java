package semi.intranet.daily.model.vo;

import java.io.Serializable;

public class PageInfo implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int currentPage; 	// 현재 페이지
	private int listCount;		// 총 게시글 수
	private int limitContent;	// 페이지당 게시글 수
	private int limitPage;		// 한번에 보여줄 페이지 수
	private int maxPage;		// 전체 페이지 중 마지막 페이지
	private int startPage;		// 한번에 표시할 페이지 중 앞 페이지
	private int endPage;		// 한번에 표시할 페이지 중 마지막 페이지
	
	
	
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