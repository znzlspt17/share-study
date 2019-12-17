package vo;

public class ProductVO {
	int pno, price, dcratio, qty;
	String pname, prodesc, imgfile, bigfile;

	public ProductVO() {
		super();
	}

	public ProductVO(int pno, String pname, int price, int dcratio, String prodesc, int qty, String imgfile,
			String bigfile) {
		super();
		this.pno = pno;
		this.price = price;
		this.dcratio = dcratio;
		this.qty = qty;
		this.pname = pname;
		this.prodesc = prodesc;
		this.imgfile = imgfile;
		this.bigfile = bigfile;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getDcratio() {
		return dcratio;
	}

	public void setDcratio(int dcratio) {
		this.dcratio = dcratio;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getProdesc() {
		return prodesc;
	}

	public void setProdesc(String prodesc) {
		this.prodesc = prodesc;
	}

	public String getImgfile() {
		return imgfile;
	}

	public void setImgfile(String imgfile) {
		this.imgfile = imgfile;
	}

	public String getBigfile() {
		return bigfile;
	}

	public void setBigfile(String bigfile) {
		this.bigfile = bigfile;
	}

	@Override
	public String toString() {
		return "productVO [pno=" + pno + ", price=" + price + ", dcratio=" + dcratio + ", qty=" + qty + ", pname="
				+ pname + ", prodesc=" + prodesc + ", imgfile=" + imgfile + ", bigfile=" + bigfile + "]";
	}

}
