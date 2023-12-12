package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import board.Board;
import board.BoardDAO;
import member.Member;
import member.MemberDAO;
import reply.Reply;
import reply.ReplyDAO;

@WebServlet("*.do")   // '/' 이하의 경로에서 do로 끝나는 확장자는 모두 ??
public class MainController extends HttpServlet {
   private static final long serialVersionUID = 10L;
   MemberDAO mDAO;
   BoardDAO bDAO;
   ReplyDAO rDAO;
       
    public MainController() {
        mDAO = new MemberDAO();
        bDAO = new BoardDAO();
        rDAO = new ReplyDAO();
    }

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doPost(request, response);
      //한글 인코딩 처리
      request.setCharacterEncoding("utf-8");
      
      //컨텐츠 응답
      response.setContentType("text/html; charset=utf-8");
      
      PrintWriter out = response.getWriter();
      
      //메시지 받기
      String id = request.getParameter("id");
      
      MemberDAO dao = new MemberDAO();
      Boolean result = dao.getDuplicatedId(id);
      if(result) {
         //중복 데이터가 있으면
         out.print("not_usable");
      }else {
         out.print("usable");
      }
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      //한글 인코딩
      request.setCharacterEncoding("utf-8");
      //응답할 컨텐츠 유형
      response.setContentType("text/html; charset=utf-8");
      
      //경로 설정
      //uri - 컨텍스트(/) + 파일(.do)
      String uri = request.getRequestURI();
      System.out.println(uri);
      String command = uri.substring(uri.lastIndexOf("/"));
      System.out.println(command);
      
      String nextPage = "";
      //세션 객체 생성
      HttpSession session = request.getSession();
      
      //view에 등록 객체 생성
      PrintWriter out = response.getWriter();
      
      if(command.equals("/main.do")) {
          List<Board> boardList = bDAO.getBoardList();
          request.setAttribute("boardList", boardList);
          //System.out.println(boardList.size() + "개");
             
          if(boardList.size() >= 3) {
          //게시글 3개를 저장할 배열 생성
          Board[] newBoards = {boardList.get(0), boardList.get(1),
                boardList.get(2)};
                 
          request.setAttribute("boardList", newBoards);
          }
          nextPage = "/main.jsp";
          
      }else if(command.equals("/memberlist.do")) {
         //회원 정보를 db에서 가져옴
         List<Member> memberList = mDAO.getMemberList();
         //모델 생성
         request.setAttribute("memberList", memberList);
         //이동할 페이지
         nextPage = "/member/memberlist.jsp";
      }else if(command.equals("/joinform.do")){
         //get 방식
         nextPage = "/member/joinform.jsp";
      }else if(command.equals("/insertmember.do")) {
           //빈 회원 객체를 생성해서 데이터를 받아서 세팅
           //폼 데이터 받기
           String id = request.getParameter("id");
           String passwd = request.getParameter("passwd");
           String name = request.getParameter("name");
           String email = request.getParameter("email");
           String gender = request.getParameter("gender");
            
           //객체에 데이터 세팅
           Member m = new Member();
           m.setId(id);
           m.setPasswd(passwd);
           m.setName(name);
           m.setEmail(email);
           m.setGender(gender);
         //DB에 저장
         mDAO.insertMember(m);
         
         //자동 로그인
         session.setAttribute(("sessionId"), m.getId());   //아이디를 가져와서 sessionId(세션명) 발급
         session.setAttribute(("sessionName"), m.getName()); //이름을 가져와서 sessionName 발급
         
         //회원 가입 후 이동
         nextPage = "index.jsp";

      }else if(command.equals("/memberview.do")) {
         String id = request.getParameter("id");
         
         Member member = mDAO.getMember(id);
         
         //모델 생성
         request.setAttribute("member", member);
         
         nextPage = "/member/memberview.jsp";
         
      }else if(command.equals("/loginform.do")){
         nextPage = "/member/loginform.jsp";
      }else if(command.equals("/login.do")){
         //계정과 암호 파라미터 받기
         String id = request.getParameter("id");
         String passwd = request.getParameter("passwd");
         //빈 객체를 생성하여 계정 및 암호 세팅
         Member m = new Member();
         m.setId(id);
         m.setPasswd(passwd);
         
         //로그인 인증
         Member member = mDAO.checkLogin(m);
         String name = member.getName();
         if(name != null) {   //result가 true일 때 세션 발급
            session.setAttribute("sessionid", id);   //아이디 세션
            session.setAttribute("sessionName", name);   //이름 세션
            //로그인 후 페이지 이동
            nextPage = "/index.jsp";
         }else {
            //에러 알림창 출력(자바스크립트)
            String error = "계정 및 암호가 올바르지 않습니다.";
            request.setAttribute("error", error);
            //에러 발생 후 페이지 이동
            nextPage ="/member/loginform.jsp";
            System.out.println("에러");

         }
      }else if(command.equals("/logout.do")) {
         session.invalidate();   //모든 세션 삭제
         nextPage = "/index.jsp";
      }
      
      //게시판
      if(command.equals("/boardlist.do")) {
         //db에서 list를 가져옴
         List<Board> boardList = bDAO.getBoardList();
         //모델로 생성
         request.setAttribute("boardList", boardList);

         nextPage = "/board/boardlist.jsp";
      }else if(command.equals("/writeform.do")){
         nextPage = "/board/writeform.jsp";
      }else if(command.equals("/write.do")){
      
         String realFolder = "C:\\jspWorks\\Members\\src\\main\\webapp\\upload";
         int maxSize = 10*1024*1024;   //10MB
         String encType = "utf-8";   //파일명 한글 인코딩
         DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
         
         //5가지 연자
         MultipartRequest multi = new MultipartRequest (request, realFolder,
                           maxSize, encType, policy);
         
         
         
         //폼 일반 속성 데이터 받기
         String title = multi.getParameter("title");
         String content = multi.getParameter("content");
         //세션 가져오기
         String id = (String)session.getAttribute("sessionid");
         
         
         
         
         //file 파라미터 속성
         Enumeration<?> files = multi.getFileNames();
         String filename = "";
         
         while(files.hasMoreElements()) { //파일명이 있는 동안 반복
            String userFilename = (String)files.nextElement();
               //실제 저장될 이름
               filename = multi.getFilesystemName(userFilename);
         }

         
         
         //db 저장
         Board b = new Board();
         b.setTitle(title);
         b.setContent(content);
         b.setFilename(filename);
         b.setId(id);
         //write 메서드 실행
         bDAO.write(b);
      }else if(command.equals("/boardview.do")) {
         //글 제목에서 요청한 글 번호 받기
         int bno = Integer.parseInt(request.getParameter("bno"));
         //글 상세보기 처리
         Board board = bDAO.getBoard(bno);
         
         //댓글 목록 보기
         List<Reply> replyList = rDAO.getReplyList(bno);
         
         //모델 생성하여 뷰로 보내기
         request.setAttribute("board", board);
         request.setAttribute("replyList", replyList);
         
         nextPage = "/board/boardview.jsp";
      }else if(command.equals("/deleteboard.do")) {
         int bno = Integer.parseInt(request.getParameter("bno"));
         //삭제 처리
         bDAO.deleteboard(bno);
         
         nextPage = "/boardlist.do";
      }else if(command.equals("/updateBoardform.do")) {
         //수정이 필요한 게시글 가져오기
         int bno = Integer.parseInt(request.getParameter("bno"));
         //게시물 1건 가져오기
         Board board = bDAO.getBoard(bno);
         //모델 생성
         request.setAttribute("board", board);
         
         nextPage = "/board/updateBoardform.jsp";   
      }else if(command.equals("/updateboard.do")) {
         //게시글 제목, 내용 파라미터로 받음
         int bno = Integer.parseInt(request.getParameter("bno"));
         String title = request.getParameter("title");
         String content = request.getParameter("content");
         
         //수정 처리 메서드
         Board b = new Board();
         b.setTitle(title);
         b.setContent(content);
         b.setBno(bno);
         
         bDAO.updateboard(b);
         
         /* nextPage = "/boardlist.do"; */
      }
      
      //댓글 구현
      if(command.equals("/insertreply.do")) {
         //댓글 폼 데이터 받기
         int bno = Integer.parseInt(request.getParameter("bno"));
         String rcontent = request.getParameter("rcontent");
         String replyer = request.getParameter("replyer");
         
         //댓글 등록 처리
         Reply r = new Reply();
         r.setBno(bno);
         r.setRcontent(rcontent);
         r.setReplyer(replyer);
         
         rDAO.insertreply(r);
      }if(command.equals("/deletereply.do")) {
         int rno = Integer.parseInt(request.getParameter("rno"));
         //삭제 처리 메서드 호출
         rDAO.deletereply(rno);
      }
      
      //redirect와 forword 구분
      //새로고침 중복 생성 방지
      if(command.equals("/write.do") || command.equals("/updateboard.do")){
         response.sendRedirect("/boardlist.do");
      }else if(command.equals("/insertreply.do") || command.equals("/deletereply.do")) {
         int bno = Integer.parseInt(request.getParameter("bno"));
         response.sendRedirect("/boardview.do?bno=" + bno);
      }else {
         RequestDispatcher dispatch =    
               request.getRequestDispatcher(nextPage);
         dispatch.forward(request, response);
      }
   }
}