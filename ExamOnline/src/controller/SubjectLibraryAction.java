package controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import biz.SubjectLibraryBiz;
import entity.PaperInfo;
import entity.TeacherInfo;
import entity.TitleInfo;

@Controller
@RequestMapping("teacher")
public class SubjectLibraryAction {
	@Resource
	private SubjectLibraryBiz slb;
	

	@RequestMapping("subject-library")
	public String subjectlibrary(Model m,HttpSession session) {
		TeacherInfo ti=(TeacherInfo) session.getAttribute("teacher");
		if(ti==null){
			return "/login";
		}
		m.addAttribute("teacherName", ti.getTeacherName());
		m.addAttribute("course", slb.seachCourseByTeacherID(ti.getTeacherId()));
		return "teacher/subject-library";
	}

	@RequestMapping("upload")
	@ResponseBody
	public String uploadExcel(@RequestParam("file") MultipartFile file,int paperId) {
		String filename = file.getOriginalFilename();
		boolean bool = filename.endsWith(".xls");
		if (bool) {
			try {
				InputStream in = file.getInputStream();
				if (in == null) {
					System.out.println("liukong");
					return "文件上传失败！";
				} else {
					return slb.insertExcelTit(file.getInputStream(),paperId)+"";
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return "批量添加失败！";
			}
		} else {
			return "批量添加失败！";
		}
	}
	
	@RequestMapping("seachPaperNoTit")
	@ResponseBody
	public List<PaperInfo> seachPaperNoTit(HttpSession session){
		TeacherInfo ti=(TeacherInfo) session.getAttribute("teacher");
		if(ti==null){
			return null;
		}
		return slb.seachPaperNoTit(Integer.valueOf(ti.getTeacherId()));
	}
	
	@RequestMapping("seachPaperByCourseID")
	@ResponseBody
	public List<PaperInfo> seachCourseByTeacherID(HttpSession session,String index){
		TeacherInfo ti=(TeacherInfo) session.getAttribute("teacher");
		if(ti==null){
			return null;
		}
		return slb.seachPaperByCourseID(Integer.valueOf(index));
	}
	
	@RequestMapping("seachPaperByPaperId")
	@ResponseBody
	public List<TitleInfo> seachPaperByPaperId(int id,HttpSession session){
		TeacherInfo ti=(TeacherInfo) session.getAttribute("teacher");
		if(ti==null){
			return null;
		}
		List<TitleInfo> list=slb.seachPaperByPaperId(id, Integer.valueOf(ti.getTeacherId()));
		return list;
	}
	
	@RequestMapping("updateTitle")
	@ResponseBody
	public String updateTitle(TitleInfo tit,HttpSession session){
		TeacherInfo ti=(TeacherInfo) session.getAttribute("teacher");
		if(ti==null){
			return "教师没有登录！";
		}
		return slb.updateTitle(tit, Integer.valueOf(ti.getTeacherId()))>0?"修改成功":"您没有修改权限！";
	}
	
	@RequestMapping("deleteTitle")
	@ResponseBody
	public String deleteTitle(int titleId,HttpSession session){
		TeacherInfo ti=(TeacherInfo) session.getAttribute("teacher");
		if(ti==null){
			return "教师没有登录！";
		}
		return slb.deleteTitle(titleId, Integer.valueOf(ti.getTeacherId()))>0?"删除成功":"您没有删除权限！";
		
	}
	
	@RequestMapping("mubanExcel")
	@ResponseBody
	public String downMUban(HttpServletResponse resp,HttpServletRequest req){
		int downSize=1048;
		try {
			resp.setHeader("Content-disposition", "attachment;filename="+new String("examtitle.xls".getBytes("utf-8"), "ISO_8859_1") );
			//开始下载，try中包含可以省去关闭流步骤
			InputStream in = req.getServletContext().getResourceAsStream("/WEB-INF/"+"examtitle.xls");
			System.out.println(req.getServletContext().getRealPath("/"));
			OutputStream out=resp.getOutputStream();
			byte[] buf=new byte[downSize];
			int num;
			while((num=in.read(buf))>0){
				out.write(buf, 0, downSize);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "susses";
	}
}
