package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.stream.events.Comment;

import action.Action;
import action.BoardDeleteProAction;
import action.BoardDetailAction;
import action.BoardFileDownAction;
import action.BoardListAction;
import action.BoardModifyFormAction;
import action.BoardModifyProAction;
import action.BoardReplyFormAction;
import action.BoardReplyProAction;
import action.BoardWriteProAction;
import vo.ActionForward;

//하나의 서블릿 주소가 아닌 여러개의 서블릿 주소를 처리하기 위해서
//XXX.bo 라는 요청(*.bo) 이 들어올 경우 해당 요청을 매핑하는 서블릿 지정
//=> 주의! / 기호를 명시하지 않는다!
@WebServlet("*.bo")
public class BoardFrontController extends HttpServlet {       
	// 모든 클라이언트로부터의 요청을 받는 HttpServlet 클래스의 서브클래스(FrontController) 정의
	// => doGet(), doPost() 메서드 오버라이딩
	//    방식에 상관없이 공통으로 작업을 처리하기 위해 공통 메서드(doProcess()) 정의하여 처리
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		System.out.println("BoardFrontController : doProcess()");
		
		// POST 방식 요청에 대한 한글 처리 - 인코딩 방식을 UTF-8 로 지정
		request.setCharacterEncoding("UTF-8");
		
		// 요청된 서블릿 주소 판별 작업(ex. http://localhost:8080/MVC_Board/BoardWrite.bo 주소 요청 시)
//		String requestURI = request.getRequestURI(); // "/MVC_Board/BoardWrite.bo" => /프로젝트명/서블릿주소
//		String contextPath = request.getContextPath(); // "/MVC_Board" => /프로젝트명
//		String command = requestURI.substring(contextPath.length()); // "/BoardWrite.bo"  => /서블릿주소
		// => requestURI 에서 contextPath 길이 이후를 추출하면 서블릿 주소가 추출됨
		
//		System.out.println("getRequestURI() : " + requestURI);
//		System.out.println("getContextPath() : " + contextPath);
//		System.out.println("command : " + command);
		
		
		// 요청된 서블릿 주소를 바로 추출
		String command = request.getServletPath();
		System.out.println("BFC - command : " + command);
		
		// 공통된 작업 처리를 위한 Action, ActionForward 타입 변수 선언
		Action action = null;
		ActionForward forward = null;
		
		// 서블릿 요청 주소에 따라 각각 다른 작업을 수행
		// => 이 때, 서블릿 주소의 프로젝트명 뒷부분("/XXXX.bo")이 추출되어 command 변수에 저장된 상태이므로
		//    문자열 비교를 통해 각 서블릿 요청을 구분
		// BoardWriteForm.bo 서블릿 요청에 대해 board 폴더 내의 qna_board_write.jsp 페이지로 포워딩(이동)
		if(command.equals("/BoardWriteForm.bo")) {
//			System.out.println("BWF");
			// 글 쓰기 페이지 요청은 비즈니스 로직 없이 바로 뷰(JSP)로 이동
			// => ActionForward 객체를 생성하여 이동할 경로만 지정
			forward = new ActionForward();
			
			// ActionForward 객체의 setPath() 메서드를 호출하여 이동할 페이지의 파일명 지정
			// => 기준이 되는 폴더인 WebContent 폴더 내에서부터 폴더 구조를 지정하여 이동할 파일명 지정
			forward.setPath("./board/qna_board_write.jsp");
//			System.out.println("board/qna_board_write.jsp");
			// => ActionForward 객체의 setRedirect() 메서드는 별도로 지정하지 않음(기본값 false 그대로 사용)
		} else if(command.equals("/BoardWritePro.bo")) {
//			System.out.println("BoardWritePro.bo");
			// 글 등록 요청은 비즈니스 로직을 통해 작업을 처리한 뒤 다른 요청을 수행해야함
			// => Action 클래스에서 생성된 ActionForward 객체를 전달받아 이동
			action = new BoardWriteProAction(); // Action 클래스 객체를 생성하여 공통 타입으로 전달받음
			try {
				// Action 클래스 내에서 작업 처리 후 ActionForward 객체를 설정하여 리턴
				forward = action.execute(request, response); // 파라미터로 request, response 객체 전달
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/BoardList.bo")) {
			// 글 목록 요청 => DB 작업을 통해 목록을 가져와야 하므로 BoardListAction 클래스를 통해 수행
			action = new BoardListAction(); // Action 클래스 객체를 생성하여 공통 타입으로 전달받음
//			System.out.println("Contoller-BoardList.bo action : " + action);
			try {
				// Action 클래스 내에서 작업 처리 후 ActionForward 객체를 설정하여 리턴
				forward = action.execute(request, response); // 파라미터로 request, response 객체 전달
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/BoardDetail.bo")){
			// 글 상세내용 보기 요청 => DB 작업을 통해 내용을 가져와야 하므로 BoardDetailAction 클래스를 통해 수행
			action = new BoardDetailAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/BoardReplyForm.bo")) {
//			System.out.println("BoardReplyForm.bo");
			action = new BoardReplyFormAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/BoardReplyPro.bo")) {
			// 답변글 등록 요청 => DB 작업을 통해 등록을 수행해야 하므로 BoardReplyProAction 클래스 작업 수행
//			System.out.println("BoardReplyPro.bo");
			action = new BoardReplyProAction();
//			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/BoardModifyForm.bo")) {
//			System.out.println("1.BoardModifyForm.bo");
			action = new BoardModifyFormAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if(command.equals("/BoardModifyPro.bo")) {
//			System.out.println("/BoardModifyPro.bo");
			action = new BoardModifyProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/BoardDeleteForm.bo")) {
//			System.out.println("/BoardDeleteForm.bo");
			// 글 삭제 폼 요청 => DB 작업이 필요없으므로 바로 뷰페이지로 이동
			forward = new ActionForward();
			forward.setPath("/board/qna_board_delete.jsp");
			
		}else if(command.equals("/BoardDeletePro.bo")) {
//			System.out.println("/BoardDeletePro.bo");
			// 글 삭제 요청 => DB 작업을 통해 삭제해야하므로 BoardDeleteProAction 클래스 작업 수행
			action = new BoardDeleteProAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if(command.equals("/BoardFileDown.bo")) {
//			System.out.println("BoardFileDown.bo");
			forward = new ActionForward();
			forward.setPath("/board/file_down.jsp");
		}
		// ActionForward 객체가 존재할 경우(null 이 아닐 경우)
		// => 포워딩 방식을 판별하여 각각의 방식대로 포워딩 수행
		if(forward != null) {// isRedirect() 가 true 일 경우 = Redirect 방식일 경우
			// response 객체의 sendRedirect() 메서드를 호출하여 포워딩 주소를 전달하여 포워딩 수행
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			}else {// isRedirect() 가 false 일 경우 = Dispatch 방식일 경우
				// request 객체로부터 getRequestDispatcher() 메서드를 호출하여 객체를 리턴받음
				// => 파라미터로 포워딩 주소를 전달
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				// RequestDispatcher 객체의 forward() 메서드를 호출하여 포워딩(이동) 수행
				// => 파라미터로 request 객체와 response 객체 전달
				
				dispatcher.forward(request, response);
			}
		}else {
			System.out.println("-- ActionForward object value is null !!!! --");
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
/*
 * 1. Redirect 방식
 * - 사용자의 요청을 처리한 후 다른 주소(URL)로 새로운 요청(request)을 수행하는 방식
 * - 요청을 처리할 때 전달받은 request 객체는 새로운 요청이 발생되면 제거되며
 *   새 request 객체로 대체된다(새로운 요청 내에서는 이전 request 객체가 유지되지 않는다!)
 * - 서블릿 주소를 요청하여 작업을 처리한 뒤, 새로운 서블릿 주소를 요청해야 하는 경우 사용하는 방식
 *   => 요청받은 주소와 처리 후에 이동해야하는 주소가 다른 경우
 *      (요청 : BoardWritePro.bo  =>  이동 : BoardList.bo)
 *      
 *   < 포워딩 방법 >
 *   response 객체의 sendRedirect() 메서드를 호출하여 포워딩 할 경로만 전달하면 됨
 *   => response.sendRedirect("BoardList.bo");
 *    
 * 
 * 2. Dispatch 방식
 * - 사용자의 요청을 처리할 때 다른 페이지로의 중간 이동 없이 바로 해당 페이지로 이동하는 방식
 * - 요청을 처리할 때 전달받은 request 객체는 새로운 요청이 없는 한 그대로 유지됨
 * - 서블릿 주소를 요청하여 특정 View(JSP) 페이지를 표시하는 경우 사용하는 방식
 *   => 요청받은 주소가 실제 이동하는 주소와 같은 경우
 *      (요청 : BoardWriteForm.bo  =>  이동 : qna_board_write.jsp)
 *      
 *   < 포워딩 방법 >
 *   1. RequestDispatcher 객체를 전달받기 위해 request 객체의 getRequestDispatcher() 메서드 호출
 *      => 파라미터로 포워딩 할 경로 전달
 *   2. 리턴받은 RequestDispatcher 객체의 forward() 메서드를 호출하여 포워딩 수행
 *      => 파라미터로 request 객체와 response 객체 전달(객체들의 유지를 위해 전달)
 *   => RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath);
 *      dispatcher.forward(request, response);
 */
