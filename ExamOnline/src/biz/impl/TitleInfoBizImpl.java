package biz.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import biz.TitleInfoBiz;
import dao.TitleInfoDao;
import entity.TitleInfo;

@Service
public class TitleInfoBizImpl implements TitleInfoBiz{

	@Resource
	private TitleInfoDao tid;
	@Override
	public List<TitleInfo> getTitleInfoAll(int paperId) {
		// TODO Auto-generated method stub
		return tid.getTitleByPaperId(paperId);
	}

	@Override
	public Map<String,List<TitleInfo>> getTitleFenLei(List<TitleInfo> list) {
		Map<String,List<TitleInfo>> llti=null;
		if(list!=null){
			llti = new HashMap<String, List<TitleInfo>>();
			List<TitleInfo> list1=new ArrayList<TitleInfo>();
			List<TitleInfo> list2=new ArrayList<TitleInfo>();
			List<TitleInfo> list3=new ArrayList<TitleInfo>();
			List<TitleInfo> list4=new ArrayList<TitleInfo>();
			for(TitleInfo ti:list){
				if(1==ti.getTitleCat()){
					list1.add(ti);
				}else if(2==ti.getTitleCat()){
					list2.add(ti);
				}else if(3==ti.getTitleCat()){
					list3.add(ti);
				}else if(4==ti.getTitleCat()){
					list4.add(ti);
				}
			}
			llti.put("1", list1);
			llti.put("2", list2);
			llti.put("3", list3);
			llti.put("4", list4);
		}
		return llti;
	}

}
