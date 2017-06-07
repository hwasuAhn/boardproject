package www.utility;

import java.io.File;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUpload;
import org.apache.commons.fileupload.FileUploadException;

/**
 * HttpServletRequestWrapper Ŭ������ HttpServletRequest
 * �������̽��� �ӽ÷� ������ Ŭ������ �����ڰ� ���ΰ�ü��
 * request�� ��������ʰ� ���ο� ���·� request ��ü��
 * ����� ����� ��� ��ӹ޴� Ŭ�����Դϴ�.  
 * Apahce FileUpload ������Ʈ�� ����ϱ� ���ϰ� �����մϴ�.
 * FileUpload API�� ����ϴ� HttpServletRequestWrapper Ŭ�����μ�
 * HttpServletRequest�� ����� API�� ����ϱ� ���� �����̴�.
 * 
  ServletRequest
  ��       �� 
  ��       ������
  ��       �� ServletRequestWrapper
  ��                                    ��
  ��                                    ��                 
  ���� HttpServletRequest   ��
       ��     request                ����� 
       ��                                ��
       �� ����                        �� 
       ���� HttpServletRequestWrapper
            ��
            ��
            �����   
            UploadManager - requestWrap
       
  request = requestWrap;
       
  public interface HttpServletRequest extends ServletRequest

  public class HttpServletRequestWrapper extends ServletRequestWrapper 
          implements HttpServletRequest
          
  public class UploadManager extends HttpServletRequestWrapper
  
          
 */
public class UploadManager extends HttpServletRequestWrapper {
    
    private boolean multipart = false;
    
    private HashMap parameterMap;  // �Ϲ� <INPUT> ���±�
    private HashMap fileItemMap;   // ���۵� <FILE> �±� ��ü�� ����
    
    /**
     * �⺻ ������
     * @param request
     * @throws FileUploadException
     */
    public UploadManager(HttpServletRequest request) 
    throws FileUploadException{
        this(request, -1, -1, null);
    }
    
    /**
     * ������
     * @param request HttpServletRequest ��ü
     * @param threshold �޸𸮿� ������ �ִ�ũ��
     * @param max ���ε��� �ִ� ����ũ��
     * @param repositoryPath ���ε� ���
     * @throws FileUploadException
     */
    public UploadManager(HttpServletRequest request,
        int threshold, int max, String repositoryPath) throws FileUploadException {
        super(request);
        
        parsing(request, threshold, max, repositoryPath);
    }
    
    /**
     * �Ϲ� �Է� �ʵ�� ���� �ʵ带 MAP�� ����
     * @param request HttpServletRequest ��ü
     * @param threshold �޸𸮿� ������ �ִ�ũ��
     * @param max ���ε��� �ִ� ����ũ��
     * @param repositoryPath ���ε� ���
     * @throws FileUploadException
     */
    private void parsing(HttpServletRequest request,
        int threshold, int max, String repositoryPath) throws FileUploadException {
        
        if (FileUpload.isMultipartContent(request)) {
            multipart = true;
            
            parameterMap = new java.util.HashMap();
            fileItemMap = new java.util.HashMap();
            
            DiskFileUpload diskFileUpload = new DiskFileUpload();
            if (threshold != -1) {
                diskFileUpload.setSizeThreshold(threshold);
            }
            diskFileUpload.setSizeMax(max);
            if (repositoryPath != null) {
                diskFileUpload.setRepositoryPath(repositoryPath);
            }
            
            java.util.List list = diskFileUpload.parseRequest(request);
            for (int i = 0 ; i < list.size() ; i++) {
                FileItem fileItem = (FileItem) list.get(i);
                String name = fileItem.getFieldName();

                if (fileItem.isFormField()) {
                    // �Ϲ� ���±׶�� ó��
                    String value = fileItem.getString();
                    String[] values = (String[]) parameterMap.get(name);
                    if (values == null) {
                        values = new String[] { value };
                    } else {
                        String[] tempValues = new String[values.length + 1];
                        System.arraycopy(values, 0, tempValues, 0, 1);
                        tempValues[tempValues.length - 1] = value;
                        values = tempValues;
                    }
                    parameterMap.put(name, values);
                } else {
                    // ���� �±׶�� ó��
                    System.out.println("���� ���� �߰ߵ� �����: " + name);
                    System.out.println("���� ���� �߰ߵ� ���ϸ�: " + fileItem.getName());
                    
                    // Ű: ���ϸ�, ���� ��ü
                    fileItemMap.put(name, fileItem);
                }
            }
            addTo(); // request �Ӽ����� �����Ѵ�.
        }
    }
    
    /**
     * ������ �����ϴ� enctype="multipart/form-data"�ΰ�� true����
     * @return enctype="multipart/form-data"�ΰ�� true����
     */
    public boolean isMultipartContent() {
        return multipart;
    }
    
    /**
     * �־��� �Ķ���Ϳ� ���� ���� ����
     */
    public String getParameter(String name) {
        if (multipart) {
            String[] values = (String[])parameterMap.get(name);
            if (values == null) return null;
            return values[0];
        } else
            return super.getParameter(name);
    }
    
    /**
     * �Ķ������ ������ ����
     */
    public String[] getParameterValues(String name) {
        if (multipart)
            return (String[])parameterMap.get(name);
        else
            return super.getParameterValues(name);
    }
    
    /**
     * ��ü �Ķ������ �̸��� ����
     */
    public Enumeration getParameterNames() {
        if (multipart) {
            return new Enumeration() {
                Iterator iter = parameterMap.keySet().iterator();
                
                public boolean hasMoreElements() {
                    return iter.hasNext();
                }
                public Object nextElement() {
                    return iter.next();
                }
            };
        } else {
            return super.getParameterNames();
        }
    }
    
    public Map getParameterMap() {
        if (multipart)
            return parameterMap;
        else
            return super.getParameterMap();
    }
    
    /**
     * ������ �Ķ���� �̸��� ���õ� FileItem�� �����մϴ�.
     * @param name
     * @return
     */
    public FileItem getFileItem(String name) {
        if (multipart)
            return (FileItem) fileItemMap.get(name);
        else
            return null;
    }
    
    /**
     * �ӽ÷� ���� ���ε� ������ �����մϴ�.
     */
    public void delete() {
        if (multipart) {
            Iterator fileItemIter = fileItemMap.values().iterator();
            while( fileItemIter.hasNext()) {
                FileItem fileItem = (FileItem)fileItemIter.next();
                fileItem.delete();
            }
        }
    }
    
    /**
     * ���۰�ü ��ü�� request ��ü�� �����մϴ�.
     */
    public void addTo() {
        super.setAttribute(UploadManager.class.getName(), this);
    }
    
    /**
     * request �Ӽ��� ����� FileUploadRequestWrapper�� �����մϴ�.
     * @param request
     * @return
     */
    public static UploadManager 
                  getFrom(HttpServletRequest request) {
        return (UploadManager)
            request.getAttribute(UploadManager.class.getName());
    }
    
    /**
     * ������ request�� ���۸� �Ӽ����� �����ϰ� ������ true�� �����մϴ�.
     * @param request
     * @return
     */
    public static boolean hasWrapper(HttpServletRequest request) {
        if (UploadManager.getFrom(request) == null) {
            return false;
        } else {
            return true;
        }
    }
    
    // fileItem: ���۵� ���ϰ�ü
    // upDir: ������ ���丮
    public static String saveFile(FileItem fileItem, String upDir){
        
        String filename = "";       //���ε� ���ϸ�
       
        // ���� �±�
        System.out.println("���۵� ���ϸ�: " + fileItem.getName());

        // ���� ������ ����
        int idx = fileItem.getName().lastIndexOf("\\"); //������ ���

        if (idx == -1) { // ���н�, ������ ���
            idx = fileItem.getName().lastIndexOf("/");
        }
          
        // ���� ���ϸ� ����
        filename = fileItem.getName().substring(idx + 1);
          
        try {
            //-----------------------------------------------
            //��� ������ ������ ���� ��ü ����, ���� + ���ϸ�
            //-----------------------------------------------
            File uploadedFile = new File(upDir, filename);
              
            //�ø����� ���ϰ� ���� �̸��� �����ϸ� �ߺ����� ó��
            if ( uploadedFile.exists() == true ){
                for(int k=1; true; k++){
                    // ���ϸ� �ߺ��� ���ϱ� ���� �Ϸ� ��ȣ�� �����Ͽ�
                    // ���ϸ����� ����
                	int pos=filename.indexOf(".");
                	String filename1=filename.substring(0, pos);
                	String filename2=filename.substring(pos);
                    uploadedFile = new File(upDir, filename1+"("+k+")"+filename2);
                    // ���յ� ���ϸ��� �������� �ʴ´ٸ�, �Ϸù�ȣ��
                    // ���� ���ϸ� �ٽ� ����
                    // �������� �ʴ� ���
                    // !�� �̿��� false�� ��� ������ ó���ǵ��� ��ȯ
                    boolean bol = uploadedFile.exists();
                    if(bol == false){
                        // �������� �ʴ� ���ο� ���ϸ� Ȯ��
                        // (0)abc.txt
                        filename = filename1+"("+k+")"+filename2;
                        break;
                    }
                }
            }
               
            // storage ������ ���ϸ� ����
            fileItem.write(uploadedFile);
        } catch(Exception e) {
              System.out.println(e.toString());    
        }

        return filename; // ���ε�� ���ϸ� ����
    }
    //---------------------------------------------------------------
    //Fileupload ������Ʈ ���� �ڵ� ��
    //---------------------------------------------------------------

    // fileItem: ���۵� ���ϰ�ü
    // upDir: ������ ���丮
    public static String saveFile2(FileItem fileItem, String upDir){
        String filename = "";   // ���ε� ���ϸ�
        String extention = "";  // ���ε� ���� Ȯ����
       
        // ���� �±�
        System.out.println("���۵� ���ϸ�: " + fileItem.getName());

        // ���� ������ ����
        int idx = fileItem.getName().lastIndexOf("."); 

        // ���� ���ϸ� ����. abc.txt
        extention = fileItem.getName().substring(idx); // .jpg
        filename = Utility.getNewPDSFilename(extention);
          
        try {
            //��� ������ ������ ���� ��ü ����, ���� + ���ϸ�
            File uploadedFile = new File(upDir, filename);
              
            // storage ������ ���ϸ� ����
            fileItem.write(uploadedFile);
        } catch(Exception e) {
              System.out.println(e.toString());    
        }

        return filename; // ���ε�� ���ϸ� ����
    }
    //---------------------------------------------------------------
    //Fileupload ������Ʈ ���� �ڵ� ��
    //---------------------------------------------------------------

    
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

    public HashMap getFileItemMap() {
        return fileItemMap;
    }

    public void setFileItemMap(HashMap fileItemMap) {
        this.fileItemMap = fileItemMap;
    }
    
    /**
     * ���۹��� ������ ������ ����
     * @return
     */
    public int getFileCount(){
        return this.fileItemMap.size();
    }
    
}
