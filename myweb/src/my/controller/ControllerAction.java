package my.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import my.action.CommandAction;

import org.omg.PortableServer.RequestProcessingPolicy;

public class ControllerAction extends HttpServlet {

	private Map commandMap=new HashMap();  //��ɾ�� ��ɾ� ó�� Ŭ������ ������ ����
	
	//��ɾ�� ó��Ŭ������ ���εǾ� �ִ� properties������ �о Map��ü�� commandMap�� ����
	//��ɾ�� ó��Ŭ������ ���εǾ� �ִ� properties������ Command.properties����
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		//web.xml���� propertyConfig�� �ش��ϴ� init-param�� ���� �о��
		String props=config.getInitParameter("propertyConfig");
		
		//��ɾ�� ó��Ŭ������ ���������� ������ Properties��ü ����
		Properties pr=new Properties();
		FileInputStream f=null;
		
		try {
			//Command.properties������ ������ �о��
			f=new FileInputStream(props);
			//Command.properties������ ������ Properties��ü������
			pr.load(f);
		} catch(IOException e) {
			throw new ServletException(e);
		} finally {
			if(f!=null) try { f.close(); } catch(IOException ex) {}
		}  //try end
		
		//Iterator��ü�� Enumeration��ü�� Ȯ���Ų ������ ��ü
		Iterator keyiter=pr.keySet().iterator();
		//��ü�� �ϳ��� ������ �� ��ü������ Properties��ü�� ����� ��ü�� ����
		while(keyiter.hasNext()) {
			String command=(String)keyiter.next();  //�������� ��ɾ�
			String className=pr.getProperty(command);  //���� �����ؾ��ϴ� Ŭ����
			System.out.println(command);
			System.out.println(className);
			
			try {
				//�ش� ���ڿ��� Ŭ������ �����
				Class commandClass=Class.forName(className);
				//�ش�Ŭ������ ��ü�� ����
				Object commandInstance=commandClass.newInstance();
				//Map��ü�� commandMap�� ��ü����
				commandMap.put(command, commandInstance);
			} catch(ClassNotFoundException e) {
				throw new ServletException(e);
			} catch(InstantiationException e) {
				throw new ServletException(e);
			} catch(IllegalAccessException e) {
				throw new ServletException(e);
			}  //try end
		}
	}  //init(config) end
	
	@Override  //GET ���
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		requestProcess(req, resp);
	}
	
	@Override  //POST ���
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		requestProcess(req, resp);
	}
	
	//������� ��û�� �м��ؼ� �ش� �۾��� ó��
	protected void requestProcess(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String view=null;
		CommandAction com=null;
		try {
			String command=req.getRequestURI();
			if(command.indexOf(req.getContextPath())==0){}
			System.out.println(command);
			com=(CommandAction)commandMap.get(command);  //����� ������
			view=com.requestPro(req, resp);
			System.out.println(view);
		} catch(Throwable e) {
			throw new ServletException(e);
		}
		RequestDispatcher dispatcher=req.getRequestDispatcher(view);
		dispatcher.forward(req, resp);
	}  //end
	
}  //--------------------------------class ControllerAction end
