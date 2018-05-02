package com.util;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import java.io.File;
import java.io.IOException;

public class UploadPicture {
	public static String getSavePath(File myfile,String myfileFileName){
			String realpath = ServletActionContext.getServletContext().getRealPath("/TeacherSystem/upload");
			String savename=System.currentTimeMillis()+myfileFileName;
	        if (myfile != null) {
	            File savefile = new File(new File(realpath), savename);
	            if (!savefile.getParentFile().exists())
	                savefile.getParentFile().mkdirs();
	            try {
					FileUtils.copyFile(myfile, savefile);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	            
	        }
	        String savePath = savename;
		return savePath;
	}
	

}
