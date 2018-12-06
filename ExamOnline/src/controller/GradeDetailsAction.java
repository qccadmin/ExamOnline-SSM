package controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import biz.ExamGradeBiz;
import biz.GradeDetailsBiz;
import entity.ScoreInfo;
import entity.TeacherInfo;

@Controller
@RequestMapping("teacher")
public class GradeDetailsAction {

	@Resource
	private GradeDetailsBiz gd;
	
	
	@Autowired
	private ExamGradeBiz eg;
	
	@RequestMapping("grade-details")
	public String gradedetails(Model m,HttpSession session){
		TeacherInfo ti=(TeacherInfo) session.getAttribute("teacher");
		if(ti==null){
			return "/login";
		}
		m.addAttribute("teacherName", ti.getTeacherName());
		m.addAttribute("list", eg.seacherPaperState());
		return "teacher/grade-details";
	}
	
	@RequestMapping("examScoreList")
	@ResponseBody
	public List<ScoreInfo> listAllScorePage(int id,int pianyi,int row){
		System.out.println(id+""+pianyi+""+row);
		return gd.seacheList(id, pianyi, row);
	}
	
	
	@RequestMapping("deleteScore")
	@ResponseBody
	public String deleteScore(int id){
		int i=gd.deleteScore(id);
		return i<1?"未选择删除":"删除成功！";
	}
	
	@RequestMapping("getpage")
	@ResponseBody
	public int getpage(int id){
		int i=gd.SelectALLNum(id);
		return i;
	}
	
	@RequestMapping("downscoreexcel")
	@ResponseBody
	public String downloadList(HttpServletResponse resp,HttpServletRequest req,int paperId,HttpSession session){
		String path=req.getServletContext().getRealPath("/")+"WEB-INF\\";
		TeacherInfo ti=(TeacherInfo) session.getAttribute("teacher");
		if(ti==null){
			return "/login";
		}
		String filename=gd.downloadList(paperId, ti.getTeacherId(),path);
		if("".equals(filename)){
			return "下载失败！";
		}
		int downSize=10480;
		File f=new File(path+filename+".xls");
		try {
			resp.setHeader("Content-disposition", "attachment;filename="+new String((filename+".xls").getBytes("utf-8"), "ISO_8859_1") );
			InputStream in = new FileInputStream(f);
			OutputStream out=resp.getOutputStream();
			byte[] buf=new byte[downSize];
			int num;
			while((num=in.read(buf))>0){
				out.write(buf, 0, downSize);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			f.delete();
		}
		return "susses";
	}
}
