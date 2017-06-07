package www.utility;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class HangulFilter implements Filter {

	public void destroy() {}  //������ �ѹ�

	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		//�ѱ�ó��
		//request������ ������ ���� ��ó�� �� �ڵ尡 ������ ���⼭ ó���Ѵ�
		//response���� ��ó�� �� �ڵ尡 �ִٸ� ���⼭ ó��
		arg0.setCharacterEncoding("euc-kr");
		arg2.doFilter(arg0, arg1);
	}

	public void init(FilterConfig arg0) throws ServletException {}  //�����Ҷ� �ѹ�

}
