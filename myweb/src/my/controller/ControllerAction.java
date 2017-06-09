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

	private Map commandMap=new HashMap();  //명령어와 명령어 처리 클래스를 쌍으로 저장
	
	//명령어와 처리클래스가 매핑되어 있는 properties파일을 읽어서 Map객체인 commandMap에 저장
	//명령어와 처리클래스가 매핑되어 있는 properties파일은 Command.properties파일
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		//web.xml에서 propertyConfig에 해당하는 init-param의 값을 읽어옴
		String props=config.getInitParameter("propertyConfig");
		
		//명령어와 처리클래스의 매핑정보를 저장할 Properties객체 생성
		Properties pr=new Properties();
		FileInputStream f=null;
		
		try {
			//Command.properties파일의 내용을 읽어옴
			f=new FileInputStream(props);
			//Command.properties파일의 정보를 Properties객체에저장
			pr.load(f);
		} catch(IOException e) {
			throw new ServletException(e);
		} finally {
			if(f!=null) try { f.close(); } catch(IOException ex) {}
		}  //try end
		
		//Iterator객체는 Enumeration객체를 확장시킨 개념의 객체
		Iterator keyiter=pr.keySet().iterator();
		//객체를 하나씩 꺼내서 그 객체명으로 Properties객체에 저장된 객체에 접근
		while(keyiter.hasNext()) {
			String command=(String)keyiter.next();  //서블릿매핑 명령어
			String className=pr.getProperty(command);  //실제 실행해야하는 클래스
			System.out.println(command);
			System.out.println(className);
			
			try {
				//해당 문자열을 클래스로 만든다
				Class commandClass=Class.forName(className);
				//해당클래스의 객체를 생성
				Object commandInstance=commandClass.newInstance();
				//Map객체인 commandMap에 객체저장
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
	
	@Override  //GET 방식
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		requestProcess(req, resp);
	}
	
	@Override  //POST 방식
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		requestProcess(req, resp);
	}
	
	//사용자의 요청을 분석해서 해당 작업을 처리
	protected void requestProcess(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String view=null;
		CommandAction com=null;
		try {
			String command=req.getRequestURI();
			if(command.indexOf(req.getContextPath())==0){}
			System.out.println(command);
			com=(CommandAction)commandMap.get(command);  //상속의 다형성
			view=com.requestPro(req, resp);
			System.out.println(view);
		} catch(Throwable e) {
			throw new ServletException(e);
		}
		RequestDispatcher dispatcher=req.getRequestDispatcher(view);
		dispatcher.forward(req, resp);
	}  //end
	
}  //--------------------------------class ControllerAction end
