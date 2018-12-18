package cn.ds.util;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DateUtils {
	public static String[] chars = new String[] { "a", "b", "c", "d", "e", "f",  
	        "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s",  
	        "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5",  
	        "6", "7", "8", "9", "A", "B", "C", "D", "E", "F", "G", "H", "I",  
	        "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V",  
	        "W", "X", "Y", "Z" };  
	//ip��ַ
	public static String getIp(HttpServletRequest request) {
		String ip = request.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		return ip;
	}
	
	
	//��ǰʱ��
	public static String date() {
		return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
	}
	
	
	public static Date StringToDate(String date){
		 SimpleDateFormat sDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		    try {
	           Date date2=sDateFormat.parse(date);
	           return date2;
	        } catch(Exception px) {
	            px.printStackTrace();
	            return null;
	        }
		
	}
	
	
	
	public static void commend(HttpServletResponse resp,String jsonStr){
		resp.setContentType("application/json;charset=utf-8");
		try {
			PrintWriter out = resp.getWriter();
			resp.getWriter().write(jsonStr);
			resp.getWriter().flush();
			resp.getWriter().close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  	
	}
	
	public static String getCurrentYear(){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
        Date date = new Date();
        return sdf.format(date).substring(2);
}
	public static String generateShortUuid() {  
	    StringBuffer shortBuffer = new StringBuffer();  
	    String uuid = UUID.randomUUID().toString().replace("-", "");  
	    for (int i = 0; i < 4; i++) {  
	        String str = uuid.substring(i * 4, i * 4 + 4);  
	        int x = Integer.parseInt(str, 16);  
	        shortBuffer.append(chars[x % 0x3E]);  
	    }  
	    return shortBuffer.toString();  
	}  
}
