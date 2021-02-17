package com.company.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.ui.Model;

import com.company.domain.AuthVO;
import com.company.domain.CalendarVO;
import com.company.domain.LoginVO;
import com.company.domain.RegisterVO;
import com.company.service.CalendarService;
import com.company.service.MyPageService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class CalendarController {
	@Autowired
	CalendarService service;
	@Autowired
	private MyPageService mservice;

	@RequestMapping(value="/calendar", method = {RequestMethod.GET, RequestMethod.POST})
	public String calendar(String userid,HttpSession session,Model model, String year, String month) {
		log.info("달력페이지" + new Date());
		
		
//		AuthVO auth=(AuthVO) session.getAttribute("auth");
//		
//		log.info("세션확인"+auth.getUserid());
//		
//		//오늘날짜 확인
//		LocalDate today = LocalDate.now();
//		log.info("오늘날짜" + today);
//		
		
	      Calendar calv = Calendar.getInstance();
	      if((year == null || year.equals("")) && (month == null || month.equals(""))) {
	         year = String.valueOf(calv.get(Calendar.YEAR));
	         month = String.valueOf(calv.get(Calendar.MONTH)+1);
	      }
	      
	      System.out.println("year: " + year + ", month: " + month);
	      
	      if(month.length() <2) {
	         month="0" + month;
	         
	      }
	      // 쓴 내용 달력에 출력하기 위해 아래와 같이 추가 한다. 
	      // 아이디 가져오기
	      RegisterVO regist = (RegisterVO)session.getAttribute("regist");
	       if(regist==null) {
	         return "redirect:/mypage/signin";
	         
	       }
	       // db처리
	       CalendarVO cal = new CalendarVO(0, regist.getUserid(), year+month);
	       List<CalendarVO> list = service.getCalendarList(cal);
	       model.addAttribute("list", list);	            
	       model.addAttribute("year", year);
	       model.addAttribute("month", month);
	      
	      return "/calendar";
	      
	   }

	 // 출석체크
	   @ResponseBody
	   @RequestMapping(value = "/calwrite", method = {RequestMethod.GET, RequestMethod.POST})
	   public void calwrite(Model model, CalendarVO cal, 
	         String year, String month, String day,
	         HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	      
	      log.info("===CalController calwrite "+ new Date());
	      
	      // dto : id, rdate 저장됨
	      
	      // 파라미터 값 month, day, hour, min 2자리가 아니라면 앞에 0을 붙여서 
	      // 0 -> 02 이런식으로 바꿔주도록 한다. 
	      
	      if(month.length() < 2) {
	         month ="0" + month;
	      }
	      
	      if(day.length() < 2) {
	         day ="0" + day;
	      }
	               
	      String date = year + month + day;
	      cal.setRdate(date);
	      
	      CalendarVO mem =  service.gettoday(cal);
	      
	      req.setCharacterEncoding("UTF-8");
	      
	      if(mem == null) {  
	         boolean isS = service.calwrite(cal);
	         
	         System.out.println("출석체크 완료");
	         
	         resp.setContentType("text/html; charset=UTF-8");
	         PrintWriter out = resp.getWriter();          
	         out.println("<script>alert('출석체크 완료'); location.href='/calendar';</script>");           
	         out.flush();
	      
	      }else {      
	         System.out.println("이미 출석되어 있습니다.");
	         
	         resp.setContentType("text/html; charset=UTF-8");
	         PrintWriter out = resp.getWriter();          
	         out.println("<script>alert('이미 출석되어 있습니다.'); location.href='/calendar';</script>");           
	         out.flush();
	      }
	   }
	   
       // 같은 ID 몇개 인지 찾기

      @ResponseBody // -> ajax을 사용할 때 꼭 붙여줘야 한다!! 
      @RequestMapping(value = "/getIdCount", method = {RequestMethod.GET, RequestMethod.POST})
      public String getIdCount(String userid, HttpSession session) {
         log.info("CalController getIdCount "+ new Date());
         
         System.out.println("useid : " + userid);
         
         int count = service.getIdCount(userid);             
         System.out.println("count 수 : " + count);
         
         String msg = "";
         
         if(count == 15) {         
            msg = "YES";
      
            // 15개 이상이면  포인트 지급 
            boolean isS = service.upPoint(userid);

         }else {
            msg = "NO";
         }
         return msg;
      }
      
}
