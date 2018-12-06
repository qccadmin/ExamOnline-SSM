package util;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import entity.StudentInfo;
import entity.TitleInfo;

public class readStudentExcel {

	private static HSSFWorkbook hssfWorkbook = null;
	private static List<StudentInfo> list = null;
	private static StudentInfo ti = null;

	public static List<StudentInfo> ReadExcel(InputStream in) {
		HSSFWorkbook wb = null;
		try {
			wb = new HSSFWorkbook(in);          // ��ȡ��
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			list=new ArrayList<StudentInfo>();
		}
		HSSFSheet sheet = wb.getSheetAt(0); // 第几张sheetʼ
		int rowNum = sheet.getLastRowNum() + 1; //行数
		for (int i = 1; i < rowNum; i++) { // ��ѭ����ʼ
			HSSFRow row = sheet.getRow(i); // ��
//			int cellNum = row.getLastCellNum(); // ������,�淶�ĵ�������9�У��˴�����
			ti=new StudentInfo();
			boolean bool = false;
			for (int j = 0; j < 6; j++) { // **********��ѭ����ʼ���ڼ��п�ʼ
				bool=manacell(row,j);
				System.out.println(ti);
				if(bool){   //Ϊ��ʱ����
					
				}else{
					break;
				}
			}
			if(bool){   //Ϊ��ʱ����
				list.add(ti);
			}
		}
		System.out.println(list);
		return list;
	}
	

	private static boolean manacell(HSSFRow row,int j) {
		// TODO Auto-generated method stub
		System.out.println("111111");
		HSSFCell cell = row.getCell(Short.parseShort(j + ""));
		System.out.println("2222");
		String cellValue = null;
		if (null != cell) {
			switch (cell.getCellType()) { // �ж�excel��Ԫ�����ݵĸ�ʽ�����������ת�����Ա������ݿ�
			case 0:
				cellValue = String.valueOf((int) cell
						.getNumericCellValue());
				break;
			case 1:
				cellValue = cell.getStringCellValue();
				break;
			case 2:
				cellValue = cell.getNumericCellValue() + "";
				break;
			case 3:
				cellValue = "";
				break;
			case 4:
				cellValue = String.valueOf(cell.getBooleanCellValue());
				break;
			case 5:
				cellValue = String.valueOf(cell.getErrorCellValue());
				break;
			}
		} else {
			cellValue = "";
		}
		if(j==0&&"".equals(cellValue)){
			return false;
		}else{
			if(j==0){
				//ti.setTitleCat(Integer.parseInt(cellValue));
				//ti.setTeacherName(cellValue);
				ti.setStudentName(cellValue);
			}else if(j==1){
				//ti.setTitleStem(cellValue);
				//ti.setTeacherPwd(cellValue);
				ti.setStudentPwd(cellValue);
			}else if(j==2){
				//ti.setOptionA(cellValue);
				//ti.setIsAdmin(Integer.parseInt(cellValue));
				ti.setBirthday(cellValue);
			}else if(j==3){
				//ti.setOptionB(cellValue);
				//ti.setJoindate(cellValue);
				ti.setSchool(cellValue);
			}else if(j==4){
				//ti.setOptionC(cellValue);
				//ti.setEmail(cellValue);
				ti.setAddress(cellValue);
			}else if(j==5){
				ti.setPhone(cellValue);
			}
			return true;
		}
	}
	public static void main(String[] args) {
		InputStream fis = null;
		try {
			fis=new FileInputStream("d://ExcelStudentRead.xls");
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(ReadExcel(fis));
		
	}
}
