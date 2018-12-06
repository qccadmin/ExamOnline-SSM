package entity;

import java.util.List;

public class EchartSeries {
	private String name;
	private String type="line";
	private List<String> data;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public List<String> getData() {
		return data;
	}
	public void setData(List<String> data) {
		this.data = data;
	}
	public EchartSeries(String name, String type, List<String> data) {
		super();
		this.name = name;
		this.type = type;
		this.data = data;
	}
	public EchartSeries() {
		super();
	}
	@Override
	public String toString() {
		return "EchartSeries [name=" + name + ", type=" + type + ", data="
				+ data + "]";
	}
	
}
