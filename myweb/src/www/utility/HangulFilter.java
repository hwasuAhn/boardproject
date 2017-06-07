package www.utility;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class HangulFilter implements Filter {

	public void destroy() {}  //끝날때 한번

	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		//한글처리
		//request영역에 보내기 전에 전처리 할 코드가 있으면 여기서 처리한다
		//response후의 후처리 할 코드가 있다면 여기서 처리
		arg0.setCharacterEncoding("euc-kr");
		arg2.doFilter(arg0, arg1);
	}

	public void init(FilterConfig arg0) throws ServletException {}  //시작할때 한번

}
