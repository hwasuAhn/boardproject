package my.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BoardDBBean {

	private BoardDBBean() {
	}

	private static BoardDBBean instance = new BoardDBBean();

	public static BoardDBBean getInstance() {
		return instance;
	}

	private Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		// DataSource ds=(DataSource)initCtx.lookup("java:comp/env/jdbc/orcl");
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) envCtx.lookup("jdbc/orcl");

		return ds.getConnection();
	}

	// public static Connection getConnection() throws NamingException,
	// SQLException {
	// // Connection con = null;
	// // LogManager.debug("[ConnectManager.getConnection]
	// // start.......................");
	//
	// Context initCtx = new InitialContext();
	// Context envCtx = (Context) initCtx.lookup("java:comp/env");
	// DataSource ds = (DataSource) envCtx.lookup("jdbc/OracleDB");
	// return ds.getConnection();
	// }

	public void insertArticle(BoardDataBean article) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int num = article.getNum();
		int ref = article.getRef();
		int re_step = article.getRe_step();
		int re_level = article.getRe_level();
		int number = 0;
		String sql = "";

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(" SELECT max(num) FROM board ");
			rs = pstmt.executeQuery();

			if (rs.next())
				number = rs.getInt(1) + 1;
			else
				number = 1;

			if (num != 0) {
				sql = " UPDATE board SET re_step=re_step+1 WHERE ref=? AND re_step>? ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, ref);
				pstmt.setInt(2, re_step);
				pstmt.executeUpdate();
				re_step = re_step + 1;
				re_level = re_level + 1;
			} else {
				ref = number;
				re_step = 0;
				re_level = 0;
			}

			sql = " INSERT INTO board(num, writer, email, subject, passwd, reg_date, ";
			sql += " ref, re_step, re_level, content, ip) VALUES(board_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, article.getWriter());
			pstmt.setString(2, article.getEmail());
			pstmt.setString(3, article.getSubject());
			pstmt.setString(4, article.getPasswd());
			pstmt.setTimestamp(5, article.getReg_date());
			pstmt.setInt(6, ref);
			pstmt.setInt(7, re_step);
			pstmt.setInt(8, re_level);
			pstmt.setString(9, article.getContent());
			pstmt.setString(10, article.getIp());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
				}
		} // try end
	} // insert() end

	// �� ���� ���ϱ�
	public int getArticleCount() throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(" SELECT count(*) FROM board ");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				x = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
				}
		} // try end
		return x;
	} // count end

	// �� ��� ���ϱ�
	public List getArticles(int start, int end) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List articleList = null;
		String sql = " SELECT a.* ";
		sql += " 		FROM ( ";
		sql += " 			SELECT ROWNUM as RNUM, b.* ";
		sql += " 			FROM ( ";
		sql += " 				SELECT * FROM board ORDER BY ref DESC, re_step ASC ";
		sql += " 				)b ";
		sql += " 			)a ";
		sql += " 			WHERE a.RNUM>=? AND a.RNUM<=? ";

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				articleList = new ArrayList(end);
				do {
					BoardDataBean article = new BoardDataBean();
					article.setNum(rs.getInt("num"));
					article.setWriter(rs.getString("writer"));
					article.setEmail(rs.getString("email"));
					article.setSubject(rs.getString("subject"));
					article.setPasswd(rs.getString("passwd"));
					// String reg_date=rs.getTimestamp("reg_date").toString();
					// reg_date.substring(0, 10);
					// article.setReg_date((Timestamp)reg_date);
					article.setReg_date(rs.getTimestamp("reg_date"));
					article.setReadcount(rs.getInt("readcount"));
					article.setRef(rs.getInt("ref"));
					article.setRe_step(rs.getInt("re_step"));
					article.setRe_level(rs.getInt("re_level"));
					article.setContent(rs.getString("content"));
					article.setIp(rs.getString("ip"));

					articleList.add(article);
				} while (rs.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
				}
		} // try end
		return articleList;
	} // getArticle() end

	// content �޼ҵ�
	public BoardDataBean getArticle(int num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardDataBean article = null;

		try {
			conn = getConnection();
			String sql = " UPDATE board SET readcount=readcount+1 where num=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();

			sql = "SELECT * FROM board WHERE num=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				article = new BoardDataBean();
				article.setNum(rs.getInt("num"));
				article.setWriter(rs.getString("writer"));
				article.setEmail(rs.getString("email"));
				article.setSubject(rs.getString("subject"));
				article.setPasswd(rs.getString("passwd"));
				article.setReg_date(rs.getTimestamp("reg_date"));
				article.setReadcount(rs.getInt("readcount"));
				article.setRef(rs.getInt("ref"));
				article.setRe_step(rs.getInt("re_step"));
				article.setRe_level(rs.getInt("re_level"));
				article.setContent(rs.getString("content"));
				article.setIp(rs.getString("ip"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
				}
		} // try end
		return article;
	}

	public int deleteArticle(int num, String writer, String passwd) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpasswd = "";
		int x = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(" SELECT passwd FROM board WHERE num=? and writer=?");
			pstmt.setInt(1, num);
			pstmt.setString(2, writer);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dbpasswd = rs.getString("passwd");
				if (dbpasswd.equals(passwd)) {
					pstmt = conn.prepareStatement("DELETE FROM board WHERE num=? ");
					pstmt.setInt(1, num);
					pstmt.executeUpdate();
					x = 1;
				} else {
					x = 0;
				}
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
				}
		} // try end
		return x;
	} // deleteArticle end

	public int deleteArticle(int num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(" SELECT passwd FROM board WHERE num=?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				pstmt = conn.prepareStatement("DELETE FROM board WHERE num=? ");
				pstmt.setInt(1, num);
				pstmt.executeUpdate();
				x = 1;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
				}
		} // try end
		return x;
	} // deleteArticle end

	// �� ������ üũ
	public int updateCheckArticle(int num, String passwd) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpasswd = "";
		int x = -1;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(" SELECT passwd FROM board WHERE num=? ");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dbpasswd = rs.getString("passwd");
				if (dbpasswd.equals(passwd)) {
					x = 1; // ��й�ȣ ��ġ
				} else {
					x = 0; // ��й�ȣ Ʋ��
				}
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
				}
		} // try end
		return x;
	} // updateCheckArticle end

	// �� ���� ��
	public BoardDataBean updateGetArticle(int num, String writer, String passwd) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpasswd = "";
		BoardDataBean article = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(" SELECT passwd FROM board WHERE num=? and writer = ?");
			pstmt.setInt(1, num);
			pstmt.setString(2, writer);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dbpasswd = rs.getString("passwd");
				if (dbpasswd.equals(passwd)) {
					// ��й�ȣ ��ġ
					String sql = " SELECT * FROM board WHERE num=? ";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, num);
					rs = pstmt.executeQuery();
					if (rs.next()) {
						article = new BoardDataBean();
						article.setNum(rs.getInt("num"));
						article.setWriter(rs.getString("writer"));
						article.setEmail(rs.getString("email"));
						article.setSubject(rs.getString("subject"));
						article.setPasswd(rs.getString("passwd"));
						article.setReg_date(rs.getTimestamp("reg_date"));
						article.setReadcount(rs.getInt("readcount"));
						article.setRef(rs.getInt("ref"));
						article.setRe_step(rs.getInt("re_step"));
						article.setRe_level(rs.getInt("re_level"));
						article.setContent(rs.getString("content"));
						article.setIp(rs.getString("ip"));
					}
				} else {
					// ��й�ȣ Ʋ��
					article = null;
				}
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
				}
		} // try end
		return article;
	} // updateGetArticle end

	public BoardDataBean updateGetArticle(int num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardDataBean article = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(" SELECT passwd FROM board WHERE num=?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {

				// ��й�ȣ ��ġ
				String sql = " SELECT * FROM board WHERE num=? ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					article = new BoardDataBean();
					article.setNum(rs.getInt("num"));
					article.setWriter(rs.getString("writer"));
					article.setEmail(rs.getString("email"));
					article.setSubject(rs.getString("subject"));
					article.setPasswd(rs.getString("passwd"));
					article.setReg_date(rs.getTimestamp("reg_date"));
					article.setReadcount(rs.getInt("readcount"));
					article.setRef(rs.getInt("ref"));
					article.setRe_step(rs.getInt("re_step"));
					article.setRe_level(rs.getInt("re_level"));
					article.setContent(rs.getString("content"));
					article.setIp(rs.getString("ip"));
				}
			} else {
				// ��й�ȣ Ʋ��
				article = null;
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
				}
		} // try end
		return article;
	} // updateGetArticle end

	// �� ���� Pro
	public int updateProArticle(BoardDataBean article) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int x = -1;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM board WHERE num=? and writer=?");
			pstmt.setInt(1, article.getNum());
			pstmt.setString(2, article.getWriter());

			System.out.println(article.getWriter());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				sql = " UPDATE board SET writer=?, email=?, subject=?, passwd=?, ";
				sql += " content=? WHERE num=?";
				pstmt = conn.prepareStatement(sql);
				System.out.println(sql);
				pstmt.setString(1, article.getWriter());
				pstmt.setString(2, article.getEmail());
				pstmt.setString(3, article.getSubject());
				pstmt.setString(4, article.getPasswd());
				pstmt.setString(5, article.getContent());
				pstmt.setInt(6, article.getNum());
				pstmt.executeUpdate();
				x = 1;
			} else {
				x = 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
				}
		} // try end
		return x;
	} // updateProArticle end

} // ------------------class BoardDBBean end
