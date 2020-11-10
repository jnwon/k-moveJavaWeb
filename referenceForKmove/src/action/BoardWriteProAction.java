package action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import svc.BoardWriteProService;
import vo.ActionForward;
import vo.BoardBean;

public class BoardWriteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 글쓰기 요청을 받아 작성된 게시물 정보를 가져와서 DB 추가를 위한 준비 작업 및 이동 작업 수행
//		System.out.println("BoardWriteProAction!");
		ActionForward forward = null;
		BoardBean boardBean = null;

		// 파일 업로드를 위한 업로드 정보 설정
		// 1. 이클립스에서 생성한 폴더의 위치 = 가상 위치
		String saveFolder = "/boardUpload";
		// 2. 업로드 폴더 가상 위치에 대한 실제 폴더의 위치
		ServletContext context = request.getServletContext();// request 객체로부터 컨텍스트 객체 가져오기
		String realFolder = context.getRealPath(saveFolder);// 가상 위치로부터 실제 폴더 위치를 가져오기
		// 3. 파일 업로드 최대 크기 지정
		int fileSize = 1024 * 1024 * 5;// 최대 5MB 지정(총 용량이 아닌 단위별 용량으로 계산하도록)
		// 4. 파일 업로드를 위한 MultipartRequest 객체 생성 - cos.jar API 필수!
		MultipartRequest multi = new MultipartRequest(
				request, // request 객체
				realFolder, // 파일을 업로드 할 폴더(실제 폴더) 
				fileSize, // 허용할 최대 업로드 크기 
				"UTF-8", // 한글 파일명을 위한 한글 타입 지정 
				new DefaultFileRenamePolicy()); // 중복된 파일명 존재 시 자동 이름 변경을 위한 객체 지정
		
		// MultipartRequest 객체로부터 전달된 파라미터들 가져오기 => BoardBean 객체에 저장
		// => 이름, 패스워드, 글제목, 글내용, 파일명
		boardBean = new BoardBean();
		// 주의사항! request.getParameter() 메서드 대신 multi.getParameter() 메서드 사용 필수!
		boardBean.setBoard_name(multi.getParameter("board_name"));
		boardBean.setBoard_pass(multi.getParameter("board_pass"));
		boardBean.setBoard_subject(multi.getParameter("board_subject"));
		boardBean.setBoard_content(multi.getParameter("board_content"));
//		boardBean.setBoard_file(multi.getParameter("board_file")); // 파일명 가져올 때 사용하면 안되는 문장!
		boardBean.setBoard_file(multi.getOriginalFileName((String)multi.getFileNames().nextElement()));
		
		// 실제 DB 작업을 진행하기 위한 Service 클래스 객체 생성
		BoardWriteProService boardWriteProService = new BoardWriteProService();
		// 게시물 등록 작업을 위한 registArticle() 메서드 호출
		// => 파라미터 : 게시물 정보(BoardBean 객체), 리턴값 : 게시물 등록 성공 여부(boolean)
		boolean isWriteSuccess = boardWriteProService.registArticle(boardBean);
		
		System.out.println("isWriteSuccess = " + isWriteSuccess);
		
		// 글쓰기 성공 여부에 따른 후속 처리(이동 작업)
		// => 실패 시 : 자바스크립트를 사용하여 실패 메세지 출력 후, 이전 페이지로 이동
		// => 성공 시 : ActionForward 객체를 생성하여 글목록(BoardList.bo) 페이지 요청(Redirect 방식)
		if(!isWriteSuccess) {// 글쓰기 실패
			// HTML 문서 형식으로 출력하기 위해 response 객체의 setContentType() 메서드 호출 => HTML 타입 지정
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out = response.getWriter();// HTML 태그 출력을 위한 Writer 객체 가져오기
			// out 객체의 println() 메서드를 호출하여 HTML 태그 작성
			out.println("<script>");// 자바스크립트 실행을 위한 <script> 시작 태그
			out.println("alert('Post registration failed')");// alert dialog 출력
			out.println("history.back()"); // 또는 out.println("history.go(-1)");  // 이전 페이지로 돌아가기
			out.println("</script>"); // 자바스크립트 종료 위한 <script> 끝 태그
		}else { //글쓰기 성
			forward = new ActionForward();// ActionForward 객체 생성
			forward.setPath("BoardList.bo"); // 서블릿 주소 지정
			forward.setRedirect(true); // Redirect 방식(true) 지정
		} 
//		System.out.println("isWriteProService : " + isWriteSuccess);
		// ActionForward 객체 리턴
		return forward;
	}

}
