package biz;

import java.util.List;
import java.util.Map;

import entity.TitleInfo;

public interface TitleInfoBiz {
	
	public List<TitleInfo> getTitleInfoAll(int paperId);
	
	public Map<String,List<TitleInfo>> getTitleFenLei(List<TitleInfo> list);
	
}
