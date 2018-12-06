package util;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import entity.TitleInfo;

public class readTitleExcel {

	private HSSFWorkbook hssfWorkbook = null;
	private List<TitleInfo> list = null;
	private TitleInfo ti = null;

	public List<TitleInfo> ReadExcel(InputStream in) {
		HSSFWorkbook wb = null;
		try {
			wb = new HSSFWorkbook(in);          // ��ȡ��
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			list=new ArrayList<TitleInfo>();
		}
		HSSFSheet sheet = wb.getSheetAt(0); // sheet ��0��ʼ
		int rowNum = sheet.getLastRowNum() + 1; // ȡ�����һ�е��к�
		for (int i = 1; i < rowNum; i++) { // ��ѭ����ʼ
			HSSFRow row = sheet.getRow(i); // ��
//			int cellNum = row.getLastCellNum(); // ������,�淶�ĵ�������9�У��˴�����
			ti=new TitleInfo();
			boolean bool = false;
			for (int j = 0; j < 9; j++) { // **********��ѭ����ʼ���ڼ��п�ʼ
				bool=manacell(row,j);
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
	

	private boolean manacell(HSSFRow row,int j) {
		// TODO Auto-generated method stub
		HSSFCell cell = row.getCell(Short.parseShort(j + ""));
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
				ti.setTitleCat(Integer.parseInt(cellValue));
			}else if(j==1){
				ti.setTitleStem(cellValue);
			}else if(j==2){
				ti.setOptionA(cellValue);
			}else if(j==3){
				ti.setOptionB(cellValue);
			}else if(j==4){
				ti.setOptionC(cellValue);
			}else if(j==5){
				ti.setOptionD(cellValue);
			}else if(j==6){
				ti.setAnswerRight(cellValue);
			}else if(j==7){
				ti.setAnswerScore(Integer.parseInt(cellValue));
			}else if(j==8){
				ti.setAnalyze(cellValue);
			}
			return true;
		}
	}
}
