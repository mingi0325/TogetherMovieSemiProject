package common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamePolicy implements FileRenamePolicy{
	
	@Override
	public File rename(File originFile) {
		
		long currentTime = System.currentTimeMillis(); // ���� �ð��� �и���������� ����
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		int ranNum = (int)(Math.random()*100000);
		
		// Ȯ���� ��������
				String name = originFile.getName(); // ���� ��
				String ext = null; // Ȯ���� ������ ����
				
				int dot = name.lastIndexOf("."); //  ������  . ã�� // ���� Ȯ���ڰ� ���� �����̸� -1�� ����ȴ�.
				if(dot != -1) {
					ext = name.substring(dot);
				} else {
					ext = "";
				}
				
				String fileName = sdf.format(new Date(currentTime)) + ranNum + ext; // �ٲ� �̸�
				File newFile = new File(originFile.getParent(), fileName); // getParent() : �����ִ� ��� ��ȯ
				
				return newFile;
	}
}
