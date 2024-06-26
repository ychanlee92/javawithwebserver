package model2.control;

public class ActionForward {
	private String url;
	private boolean redirect;
	
	public ActionForward() {
		this(null, false);
	}

	public ActionForward(String url) {
		this(url, false);
	}

	public ActionForward(String url, boolean redirect) {
		this.url = url;
		this.redirect = redirect;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public boolean isRedirect() {
		return redirect;
	}

	public void setRedirect(boolean redirect) {
		this.redirect = redirect;
	}
	
	
}
