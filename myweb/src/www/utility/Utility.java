package www.utility;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;

/**
 * Ư�� Ŭ������ �Ҽӵ��� �ʴ� ���� �޼ҵ带 �����մϴ�.
 * @author stu
 *
 */
public class Utility {
    public static final boolean DEBUG = true;
    /**
     * �ѱ� ���ڿ� ���ڵ� ã��
     * @param s
     */
    public static void charsetTest(String s){
       try{
          String [] charset = {"EUC-KR", "KSC5601", "ISO-8859-1", "8859_1", "ASCII", "UTF-8"};
          for(int i=0; i<charset.length; i++){
             for(int j=0; j<charset.length; j++){
                if(i==j) continue;
                System.out.print(charset[i] + " -> " + charset[j] + " : ");
                System.out.println(new String(s.getBytes(charset[i]), charset[j]));
             }
          }
       }
       catch(Exception e){
          e.printStackTrace();
       }
    }    

    /**
     * �ڹٽ�ũ��Ʈ URL GET��� �ѱ� ���۽� �ѱ� ó��
     * �ڹٽ�ũ��Ʈ ���� Ÿ��
     * mname = escape(encodeURIComponent(mname));
     * url="GetTestProc.jsp?mname=" + mname;
     * 
     * @param str
     * @return
     */
    public static String decode(String str){
        try{
            str = URLDecoder.decode(str, "UTF-8");    
        }catch(Exception e){}
        
        return str;
     } 
    
    /**
     * õ�������� �ĸ��� ����մϴ�.
     * @param price �ݾ�
     * @return �ĸ��� ���Ե� ���ڿ�
     */
    public static String comma(int price){
        DecimalFormat comma = new DecimalFormat("###,###,###");
        String cs = comma.format(price);
        
        return cs;
    }
    
    /**
     * null ���ڸ� ���� ���ڷ� �����մϴ�.
     * null ���� �������� �������� ������ null�̶�� ���ڰ� ����� �Ǿ�
     * ���ȭ���� null���ڷ� ä����.
     * 
     * @param str �˻��� ���ڿ�
     * @return null ���� ������ �ִ� ��ü�� ���� ���ڿ��� ���ϵ�
     */    
    public static String checkNull(String str){
        if ( str == null){
            return "";
        }else{
            return str;  // ���� ���ڿ� �״�� ���� 
        }
    }
   
    /**
     * �־��� ���ڼ��� �����ڵ带 ��ȯ�մϴ�.
     * @param ko
     * @return
     */
    public static String ko(String ko){
        String corean = null;
        try{
            //corean= new String(ko.getBytes("8859_1"), "euc-kr");
            //corean= new String(ko.getBytes("8859_1"), "utf-8");
            //corean= new String(ko.getBytes("8859_1"), "iso-8859-1");
            //corean= new String(ko.getBytes("8859_1"), "utf-8");
            corean= new String(ko.getBytes("8859_1"), "KSC5601");
        }catch(Exception e){
            return corean; 
        }
        return corean;
    }
    
    /**
     * ���� ��¥�� ���ڿ��� �����մϴ�.
     * @return
     */
    public static String getCalendarDay(){
        String str="";
        Calendar cal = Calendar.getInstance();
        str = "" + cal.get(Calendar.DATE); //��¥
        
        return str;
    }

    /**
     * yyyy-mm-dd ������ ��¥�� �����մϴ�.
     * @return 2008-01-30 ������ ���ڿ� ����
     */
    public static String getDate(){
        SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
        
        String date = sd.format(new Date());

        // System.out.println(date);        
        return date;
    }

    /**
     * yyyymmdd: 20110601 ������ ��¥�� �����մϴ�.
     * yyyymd: 201161(�������� �ʴ� ����)
     * @return 20080130 ������ ���ڿ� ����
     */
    public static String getDate2(){
        SimpleDateFormat sd = new SimpleDateFormat("yyyyMMdd");
        
        String date = sd.format(new Date());

        // System.out.println(date);        
        return date;
    }

    /**
     * yyyyMMdd_hhmiss ������ ��¥�� �����մϴ�.
     * @return 20110601_121003 ������ ���ڿ� ����
     */
    public static String getDate3(){
        SimpleDateFormat sd = new SimpleDateFormat("yyyyMMdd_hhmmss");
        
        String date = sd.format(new Date());

        // System.out.println(date);        
        return date;
    }
    
    /**
     * ���ο� �̹��� ������ �����մϴ�.
     * @return 20110601_121003_1 ������ ���ڿ� ����
     */
    public static String getNewPDSFilename(String extention){
        String filename = "";
        Random rnd = new Random();
        
        // filename = ""+rnd.nextInt(10)+1;
        String rndStr = String.valueOf((rnd.nextInt(10))+1);
        
        filename = getDate3() + "_" + rndStr + extention;
        
        return filename;
    }
    
    /**
     * �����߿� Ư������ ǥ���� ���� HTML Ư�����ڷ� ��ȯ�մϴ�.
     */
    public static String getConvertChar(String str){
        for(int i=0; i < str.length(); i++){
            if(str.charAt(i) =='<'){
                str=str.substring(0, i) + "&lt;" + str.substring(i+1, str.length());
                i=i+4; //1�ڰ� 3�ڷ� ��ȯ������ +4�� �մϴ�.
            }else if(str.charAt(i) == '>'){
                str=str.substring(0, i) + "&gt;" + str.substring(i+1, str.length());
                i=i+4;
            }else if(str.charAt(i) == '&'){
                str=str.substring(0, i) + "&amp;" + str.substring(i+1, str.length());
                i=i+5;
            }else if(str.charAt(i) == ' '){
                str=str.substring(0, i) + "&nbsp;" + str.substring(i+1, str.length());
                i=i+6;
            }
        }
        return str;
    }

    /**
     * �����߿� Ư������ ǥ���� ���� HTML Ư�����ڷ� ��ȯ�մϴ�.
     */
    public static String getConvertBR(String str){
        return str.replace("\n", "<BR/>");
    }

    /**
     * ���� Download�� �ѱ� ���� ���ڵ�
     * @param str
     * @return
     */
    public static String getEncoding(String str){
        try{
        //resin UTF-8 �� ����
            //str = java.net.URLEncoder.encode(str, "EUC-KR");
            //str = java.net.URLEncoder.encode(str, "UTF-8");
            str = java.net.URLEncoder.encode(str, "KSC5601");
        }catch(Exception e){
        
        }

        //System.out.println(str);

        for(int i=0; i < str.length(); i++){
            if(str.charAt(i) =='+'){
                str=str.substring(0, i) + "%20" + str.substring(i+1, str.length());
                i=i+3;
            }
        }
        //System.out.println("������ȯ ����: "+str);
        return str;
    }    

    /**
     * FileUpload 1.2 �ѱ� ��ȯ
     * @param str
     * @return
     */
    public static String getEncodingFileUpload12(String str){
        String corean = null;
        try{
            // corean= new String(ko.getBytes("ISO-8859-1"), "UTF-8");
            corean= new String(str.getBytes("ISO-8859-1"), "KSC5601");
        }catch(Exception e){
            return corean; 
        }
        return corean;
    }    

    /**
     * Ajax �ѱ� ��ȯ
     * @param ko
     * @return
     */
    public static String koAjax(String ko){
        String corean = null;
        try{
            // corean= new String(ko.getBytes("ISO-8859-1"), "UTF-8");
            corean= new String(ko.getBytes("KSC5601"), "EUC-KR");
        }catch(Exception e){
            return corean; 
        }
        return corean;
    }
    
    /**
     * �ڹٽ�ũ��Ʈ Ư������, �ٹٲ� ���� ��ȯ
     * @param str
     * @return
     */
    public static String toJS(String str) {
        if (str != null){
            return str.replace("\\", "\\\\")
            .replace("\'", "\\\'")
            .replace("\"", "\\\"")
            .replace("\r\n", "\\n")
            .replace("\n", "\\n");
            
        }else{
            return "";
        }
    }  

    /**
     * ���� ��¥�� �ð��� �����ɴϴ�.
     * @return
     */
    public static String getDateTime(){
        return new Date().toLocaleString().substring(0, 22);
    }  
  
    public static int toInt(HttpServletRequest request, String str){
        return Integer.parseInt(request.getParameter(str));
    }

    public static long toLong(HttpServletRequest request, String str){
        return Long.parseLong(str);
    }

    public static float toFloat(HttpServletRequest request, String str){
        return Float.parseFloat(str);
    }
    
    public static double toDouble(HttpServletRequest request, String str){
        return Double.parseDouble(str);
    }


    public static boolean checkImgeFile(String fname){
        
        String filename = fname.toLowerCase();
        boolean value = false;
        
        if (filename.lastIndexOf(".png") > 0){
            value = true;
        }else if (filename.lastIndexOf(".jpg") > 0){
            value = true;
        }else if (filename.lastIndexOf(".jpeg") > 0){
            value = true;
        }else if (filename.lastIndexOf(".bmp") > 0){
            value = true;
        }else if (filename.lastIndexOf(".gif") > 0){
            value = true;
        }else if (filename.lastIndexOf(".pcx") > 0){
            value = true;
        }
        
        return value;
    }
    
    /**
     * application�̸��� �Է¹޾� ���� ��θ� �����մϴ�.
     * @param request
     * @param dir application �̸�
     * @return ���� ��� ����
     * @throws IOException
     */
    public static String getRealPath(HttpServletRequest request, String dir) throws IOException {
        // ByteArrayOutputStream baos = new ByteArrayOutputStream();
        
        String path = request.getRealPath(dir) + "/";
        System.out.println("Upload path: " + path);
        

        return path;
    } 

    /** 
     * ������ �����մϴ�. 
    */
    public static boolean deleteFile(String folder, String fileName){
        boolean ret = false;
        
        try{
            if ( fileName != null){ // ������ ������ �����ϴ� ��� ����
                File file = new File(folder + "/" + fileName);
                ret = file.delete();
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return ret;
    } 
    
    
}

