package com.ssafy.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ssafy.dto.ApartDto;
import com.ssafy.dto.MemberDto;
import com.ssafy.service.JoinService;
import com.ssafy.service.JoinServiceImpl;
import com.ssafy.service.LoginService;
import com.ssafy.service.LoginServiceImpl;
import com.ssafy.service.Service;
import com.ssafy.service.ServiceImpl;

@WebServlet("/main.do")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private Service apartApartService;
	private LoginService loginService;
	private JoinService joinService; 
	@Override
	public void init() throws ServletException {
		super.init();
		loginService = new LoginServiceImpl();
		apartApartService = new ServiceImpl();
		joinService = new JoinServiceImpl();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		process(request, response);
	}

	private void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String root = request.getContextPath();
		
		String act = request.getParameter("act");
		System.out.println(act);
		if ("mvlogin".equals(act)) {
			response.sendRedirect(root + "/index.jsp");
		} else if ("login".equals(act)) {
			login(request, response);
		} else if ("logout".equals(act)) {
			logout(request, response);
		} else if ("list".equals(act)) {
			listApart(request, response);
		} else if ("mvjoin".equals(act)) {
			response.sendRedirect(root + "/user/join.jsp");
		} else if ("join".equals(act)) {
			System.out.println("hi");
			join(request, response);
		}else if("mvModify".equals(act)) {
			moveModifyArticle(request,response);
		}else if("modify".equals(act)) {
			modifyArticle(request,response);
		} else if("deleteMem".equals(act)) {
			deletemem(request, response);
		}else if("mvsearchPW".equals(act)) {
			response.sendRedirect(root + "/user/searchPW.jsp");
		}else if("searchPW".equals(act)) {
			
			searchPw(request,response);
		}
	}

	private void searchPw(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("userid");
		String name = request.getParameter("username");
		String pw="";
		String path = "/user/searchPWres.jsp";
		
		try {
			pw=loginService.searchPw(id,name);
			System.out.print(pw);
			request.setAttribute("pw", pw);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "데이터를 얻어오는 과정에 문제가 발생했습니다.");
			path = "/error/error.jsp";
		}
		request.getRequestDispatcher(path).forward(request, response);
	}

	private void deletemem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path="/index.jsp";
		String userid = request.getParameter("userid");
		System.out.println(userid);
		HttpSession session = request.getSession();
		
			try {
				System.out.println("delete456");
				int res = joinService.deleteMember(userid);
				System.out.println(res);
				if(res >= 0) {
					session.removeAttribute("userinfo");
					System.out.println("delete123");
					request.getRequestDispatcher(path).forward(request, response);
				}
				else {
					request.setAttribute("msg", "탈퇴하는 과정에서 문제가 발생했습니다.");
					path = "/error/error.jsp";
				}
			} catch (SQLException e) {
				e.printStackTrace();
				request.setAttribute("msg", "탈퇴하는 과정에서 문제가 발생했습니다.");
				path = "/error/error.jsp";
			}
	}

	private void join(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "/index.jsp";
		String id = request.getParameter("userid");
		String name = request.getParameter("username");
		String pw = request.getParameter("userpwd");
		String email = request.getParameter("emailid");
		String address = request.getParameter("address");
		
		try {
			MemberDto member= new MemberDto();
			member.setUserid(id);
			member.setUsername(name);
			member.setUserpwd(pw);
			member.setEmail(email);
			member.setAddress(address);
			joinService.Join(member);
			//request.setAttribute("aparts", list);
			//path = "/houseinfo/list.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "데이터를 얻어오는 과정에 문제가 발생했습니다.");
			path = "/error/error.jsp";
		}
		request.getRequestDispatcher(path).forward(request, response);
	}

	private void listApart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String path = "/index.jsp";
		String key = request.getParameter("key");
		String word = request.getParameter("word");

		try {
			List<ApartDto> list = apartApartService.listApart(key, word);
			request.setAttribute("aparts", list);
			path = "/houseinfo/list.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "데이터를 얻어오는 과정에 문제가 발생했습니다.");
			path = "/error/error.jsp";
		}
		request.getRequestDispatcher(path).forward(request, response);
	}

	private void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		session.removeAttribute("userinfo");
//		session.invalidate();
		response.sendRedirect(request.getContextPath());
	}

	private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "/index.jsp";
		String userid = request.getParameter("userid");
		String userpwd = request.getParameter("userpwd");

		try {
			MemberDto memberDto = loginService.login(userid, userpwd);
			if (memberDto != null) {
//				session 설정
				HttpSession session = request.getSession();
				session.setAttribute("userinfo", memberDto);

//				cookie 설정
				String idsave = request.getParameter("idsave");
				if ("saveok".equals(idsave)) {
					Cookie cookie = new Cookie("ssafy_id", userid);
					cookie.setPath(request.getContextPath());
					cookie.setMaxAge(60 * 60 * 24 * 365 * 40);// 40년간 저장.
					response.addCookie(cookie);
				} else {// 아이디 저장을 해제 했다면.
					Cookie cookies[] = request.getCookies();
					if (cookies != null) {
						for (Cookie cookie : cookies) {
							if ("ssafy_id".equals(cookie.getName())) {
								cookie.setMaxAge(0);
								response.addCookie(cookie);
								break;
							}
						}
					}
				}
			} else {
				request.setAttribute("msg", "아이디 또는 비밀번호 확인 후 로그인해 주세요.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "로그인 중 문제가 발생했습니다.");
			path = "/error/error.jsp";
		}
		request.getRequestDispatcher(path).forward(request, response);
	}
	
	private void moveModifyArticle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "/index.jsp";
		String id = request.getParameter("id");
		
		try {
			MemberDto memberDto =joinService.getMember(id);
			request.setAttribute("member", memberDto);
			path = "/houseinfo/modify.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "글수정 처리 중 문제가 발생했습니다.");
			path = "/error/error.jsp";
		}
		request.getRequestDispatcher(path).forward(request, response);
	}
	
	private void modifyArticle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "/index.jsp";
		MemberDto memberDto = new MemberDto();
	
		memberDto.setUserid(request.getParameter("userid"));
		memberDto.setUsername(request.getParameter("username"));
		memberDto.setUserpwd(request.getParameter("password"));
		memberDto.setEmail(request.getParameter("email"));
		memberDto.setAddress(request.getParameter("address"));
		
		
		try {
			
			joinService.modifyMember(memberDto);
			path = "/main.do?act=mvlogin&key=&word=";
			response.sendRedirect(request.getContextPath() + path);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "글작성중 문제가 발생했습니다.");
			path = "/error/error.jsp";
			request.getRequestDispatcher(path).forward(request, response);
		}
	}

}
