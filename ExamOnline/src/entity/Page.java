package entity;

public class Page {
	private int page=1;//当前页数
	private int rows=5;//每页大小
	private int shang;//上一页
	private int xia;//下一页
	private int pagecount;//总页数
	private int pianyi=-1;//偏移量
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}
	public int getShang() {
		return shang;
	}
	public void setShang(int shang) {
		this.shang = shang;
	}
	public int getXia() {
		return xia;
	}
	public void setXia(int xia) {
		this.xia = xia;
	}
	public int getPagecount() {
		return pagecount;
	}
	public void setPagecount(int pagecount) {
		this.pagecount = pagecount;
	}
	public int getPianyi() {
		return pianyi;
	}
	public void setPianyi(int pianyi) {
		this.pianyi = pianyi;
	}
	public Page(int page, int rows, int shang, int xia, int pagecount,
			int pianyi) {
		super();
		this.page = page;
		this.rows = rows;
		this.shang = shang;
		this.xia = xia;
		this.pagecount = pagecount;
		this.pianyi = pianyi;
	}
	public Page() {
		super();
	}
	@Override
	public String toString() {
		return "Page [page=" + page + ", rows=" + rows + ", shang=" + shang
				+ ", xia=" + xia + ", pagecount=" + pagecount + ", pianyi="
				+ pianyi + "]";
	}
	
}
