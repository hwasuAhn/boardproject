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
 * 특정 클래스에 소속되지 않는 공통 메소드를 선언합니다.
 * @author stu
 *
 */
public class Utility {
    public static final boolean DEBUG = true;
    /**
     * 한글 문자열 인코딩 찾기
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
     * 자바스크립트 URL GET방식 한글 전송시 한글 처리
     * 자바스크립트 전송 타입
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
     * 천단위마다 컴마를 출력합니다.
     * @param price 금액
     * @return 컴마가 포함된 문자열
     */
    public static String comma(int price){
        DecimalFormat comma = new DecimalFormat("###,###,###");
        String cs = comma.format(price);
        
        return cs;
    }
    
    /**
     * null 문자를 공백 문자로 변경합니다.
     * null 값을 공백으로 변경하지 않으면 null이라는 문자가 출력이 되어
     * 출력화면이 null문자로 채워짐.
     * 
     * @param str 검사할 문자열
     * @return null 값을 가지고 있는 객체는 공백 문자열로 리턴됨
     */    
    public static String checkNull(String str){
        if ( str == null){
            return "";
        }else{
            return str;  // 원본 문자열 그대로 리턴 
        }
    }
   
    /**
     * 주어진 문자셋의 문자코드를 변환합니다.
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
     * 오늘 날짜를 문자열로 리턴합니다.
     * @return
     */
    public static String getCalendarDay(){
        String str="";
        Calendar cal = Calendar.getInstance();
        str = "" + cal.get(Calendar.DATE); //날짜
        
        return str;
    }

    /**
     * yyyy-mm-dd 형식의 날짜를 리턴합니다.
     * @return 2008-01-30 형식의 문자열 리턴
     */
    public static String getDate(){
        SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
        
        String date = sd.format(new Date());

        // System.out.println(date);        
        return date;
    }

    /**
     * yyyymmdd: 20110601 형식의 날짜를 리턴합니다.
     * yyyymd: 201161(권장하지 않는 형식)
     * @return 20080130 형식의 문자열 리턴
     */
    public static String getDate2(){
        SimpleDateFormat sd = new SimpleDateFormat("yyyyMMdd");
        
        String date = sd.format(new Date());

        // System.out.println(date);        
        return date;
    }

    /**
     * yyyyMMdd_hhmiss 형식의 날짜를 리턴합니다.
     * @return 20110601_121003 형식의 문자열 리턴
     */
    public static String getDate3(){
        SimpleDateFormat sd = new SimpleDateFormat("yyyyMMdd_hhmmss");
        
        String date = sd.format(new Date());

        // System.out.println(date);        
        return date;
    }
    
    /**
     * 새로운 이미지 파일을 생성합니다.
     * @return 20110601_121003_1 형식의 문자열 리턴
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
     * 내용중에 특수문자 표현을 위해 HTML 특수문자로 변환합니다.
     */
    public static String getConvertChar(String str){
        for(int i=0; i < str.length(); i++){
            if(str.charAt(i) =='<'){
                str=str.substring(0, i) + "&lt;" + str.substring(i+1, str.length());
                i=i+4; //1자가 3자로 변환됨으로 +4을 합니다.
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
     * 내용중에 특수문자 표현을 위해 HTML 특수문자로 변환합니다.
     */
    public static String getConvertBR(String str){
        return str.replace("\n", "<BR/>");
    }

    /**
     * 파일 Download시 한글 파일 인코딩
     * @param str
     * @return
     */
    public static String getEncoding(String str){
        try{
        //resin UTF-8 로 지정
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
        //System.out.println("최종변환 형태: "+str);
        return str;
    }    

    /**
     * FileUpload 1.2 한글 변환
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
     * Ajax 한글 변환
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
     * 자바스크립트 특수문자, 줄바꿈 문자 변환
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
     * 현재 날짜와 시간을 가져옵니다.
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
     * application이름을 입력받아 절대 경로를 산출합니다.
     * @param request
     * @param dir application 이름
     * @return 절대 경로 리턴
     * @throws IOException
     */
    public static String getRealPath(HttpServletRequest request, String dir) throws IOException {
        // ByteArrayOutputStream baos = new ByteArrayOutputStream();
        
        String path = request.getRealPath(dir) + "/";
        System.out.println("Upload path: " + path);
        

        return path;
    } 

    /** 
     * 파일을 삭제합니다. 
    */
    public static boolean deleteFile(String folder, String fileName){
        boolean ret = false;
        
        try{
            if ( fileName != null){ // 기존에 파일이 존재하는 경우 삭제
                File file = new File(folder + "/" + fileName);
                ret = file.delete();
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return ret;
    } 
    
    
}

