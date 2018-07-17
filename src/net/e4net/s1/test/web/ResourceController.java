package net.e4net.s1.test.web;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;

import net.e4net.eiwaf.service.resource.Code;
import net.e4net.eiwaf.service.resource.CodeService;
import net.e4net.eiwaf.service.resource.CodeService.SortType;
import net.e4net.eiwaf.service.resource.ConfigService;
import net.e4net.eiwaf.service.resource.MessageService;
import net.e4net.eiwaf.service.resource.PropertiesService;
import net.e4net.eiwaf.service.resource.RequestData;
import net.e4net.eiwaf.service.resource.RequestDataProperty;
import net.e4net.eiwaf.service.resource.RequestDataService;
import net.e4net.eiwaf.service.resource.RequestProperty;
import net.e4net.eiwaf.service.resource.ResourceEvent;
import net.e4net.eiwaf.service.resource.ResourceEventListener;
import net.e4net.eiwaf.service.resource.ResourceType;
import net.e4net.eiwaf.util.StringUtil;
import net.e4net.eiwaf.web.RequestContext;
import net.e4net.s1.comn.PublicController;
import net.e4net.s1.test.vo.CodePVO;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * 리소스 컨트롤러.
 * @author E4NET
 * @version 1.0
 */
@RequestProperty(title = "리소스테스트", layout = "empty")
@Controller
public class ResourceController extends PublicController {

	private static final long serialVersionUID = 2591507102071261330L;

	@Resource(name = "codeService")
	private CodeService codeService;

	@Resource(name = "configService")
	private ConfigService configService;

	@Resource(name = "messageService")
	private MessageService messageService;

	@Resource(name = "propertiesService")
	private PropertiesService propertiesService;

	@Resource(name = "requestDataService")
	private RequestDataService requestDataService;

	@Resource(name = "resourceEventListener")
	private ResourceEventListener resourceEventListener;

	/**
	 * 코드리소스.
	 * @param codePVO 코드 VO
	 * @return ModelAndView
	 * @throws Exception
	 */
	@RequestProperty(title = "코드리소스")
	@RequestMapping("/test/code.do")
	public ModelAndView code(
			@ModelAttribute("codePVO") CodePVO codePVO
			) throws Exception {
		ModelAndView mav = new ModelAndView("test/code");

		Code code1 = codeService.getCode("TEL");
		Code code2 = codeService.getCode("TEL.031");
		Code code3 = codeService.getCode("존재하지 않는 키");
		Code code4 = codeService.getCode("존재하지 않는 키", true);

		debug("codeService.getCode(\"존재하지 않는 키\") => " + code3); //null
		debug("codeService.getCode(\"존재하지 않는 키\", true) => " + code4); //key:존재하지 않는 키,value:,detail:,alias:

		List<Code> codeList1 = codeService.getCodeList("TEL");
		List<Code> codeList2 = codeService.getCodeList("TEL", "KEY < '033'");
		List<Code> codeList3 = codeService.getCodeList("TEL", "KEY < '033'", SortType.KEY_DESC);
		List<Code> codeList4 = codeService.getCodeList("TEL", SortType.VALUE_DESC);
		List<Code> codeList5 = codeService.getCodeList("존재하지 않는 키"); //null
		List<Code> codeList6 = codeService.getCodeList("존재하지 않는 키", true);

		debug("codeService.getCodeList(\"존재하지 않는 키\") => " + codeList5); //null
		debug("codeService.getCodeList(\"존재하지 않는 키\", true) => " + codeList6); //[]

		List<Code> codeMapList     = codeService.getCodeList("CELL"); //맵테스트를 위한 코드리스트
		Map<String, Code> codeMap1 = codeService.getCodeMap("CELL");
		Map<String, Code> codeMap2 = codeService.getCodeMap("CELL", "VALUE == '010' || VALUE == '011'");
		Map<String, Code> codeMap3 = codeService.getCodeMap("존재하지 않는 키");
		Map<String, Code> codeMap4 = codeService.getCodeMap("존재하지 않는 키", true);

		debug("codeService.getCodeMap(\"존재하지 않는 키\") => " + codeMap3); //null
		debug("codeService.getCodeMap(\"존재하지 않는 키\", true) => " + codeMap4); //[]

		mav.addObject("code1", code1);
		mav.addObject("code2", code2);
		mav.addObject("code3", code3);
		mav.addObject("code4", code4);

		mav.addObject("codeList1", codeList1);
		mav.addObject("codeList2", codeList2);
		mav.addObject("codeList3", codeList3);
		mav.addObject("codeList4", codeList4);
		mav.addObject("codeList5", codeList5);
		mav.addObject("codeList6", codeList6);

		mav.addObject("codeMapList", codeMapList);
		mav.addObject("codeMap1", codeMap1);
		mav.addObject("codeMap2", codeMap2);
		mav.addObject("codeMap3", codeMap3);
		mav.addObject("codeMap4", codeMap4);

		codePVO.setKey1("031");
		
		return getOkModelAndView(mav);
	}

	@RequestProperty(title = "설정리소스")
	@RequestMapping("/test/config.do")
	public ModelAndView config() throws Exception {
		ModelAndView mav = new ModelAndView("test/config");

		boolean dv = configService.isDV(); //개발서버 - Develop Server
		boolean qa = configService.isQA(); //운영테스트서버 - Quality Assurance Server
		boolean rl = configService.isRL(); //운영서버 - Real Server
		boolean dr = configService.isDR(); //백업서버 - Disaster Recovery Server

		String serverIp = configService.getString("SVR.IP"); //SVR.IP.DV=192.168.0.1 ,SVR.IP.RL=222.111.222.111
		int serverPort = configService.getInt("SVR.PORT"); //SVR.PORT.DV=8080, SVR.PORT.RL=80

		String serverIpPropDV = propertiesService.getString("SVR.IP.DV");
		String serverIpPropRL = propertiesService.getString("SVR.IP.RL");
		int serverPortPropDV = propertiesService.getInt("SVR.PORT.DV");
		int serverPortPropRL = propertiesService.getInt("SVR.PORT.RL");

		mav.addObject("dv", dv);
		mav.addObject("qa", qa);
		mav.addObject("rl", rl);
		mav.addObject("dr", dr);

		mav.addObject("serverIp", serverIp);
		mav.addObject("serverPort", serverPort);

		mav.addObject("serverIpPropDV", serverIpPropDV);
		mav.addObject("serverIpPropRL", serverIpPropRL);
		mav.addObject("serverPortPropDV", serverPortPropDV);
		mav.addObject("serverPortPropRL", serverPortPropRL);

		return getOkModelAndView(mav);
	}

	@RequestProperty(title = "메시지리소스")
	@RequestMapping("/test/message.do")
	public ModelAndView message() throws Exception {
		//공통 개발자가 아닐 경우는 net.e4net.eiwaf.common.Status을 이용한다.
		//JSP에서 단순 메시지 표시를 할 경우 다음과 같이 태그를 사용한다. - <spring:message code="COMN0020"/>
		ModelAndView mav = new ModelAndView("test/message");

		String cOMN0001 = messageService.getMessage("COMN0001");
		String notfound1 = messageService.getMessage("존재하지 않는 키", "기본메시지입니다.");

		String cOMN0012 = messageService.getMessage("COMN0012", new String[] { "1,000" });
		String notfound2 = messageService.getMessage("존재하지 않는 키", new String[] {"아규먼트1", "아규먼트2"}, "기본메시지입니다.");

		String cOMN0006_en = messageService.getMessage("COMN0006", Locale.ENGLISH);
		String cOMN9999_en = messageService.getMessage("COMN9999", Locale.ENGLISH); //해당 로케일에 존재하지 않는 메시지 키의 경우 defaultLocale의 메시지로 표시한다.
		String notfound1_en = messageService.getMessage("notfoundkey", "defaultmessage", Locale.ENGLISH);

		String xXXX1000_en = messageService.getMessage("XXXX1000", new String[] {"arg1", "arg2", "arg3"}, Locale.ENGLISH);
		String notfound2_en = messageService.getMessage("notfoundkey", new String[] {"arg1", "arg2", "arg3"}, "defaultmessage" , Locale.ENGLISH);

		mav.addObject("cOMN0001", cOMN0001);
		mav.addObject("notfound1", notfound1);

		mav.addObject("cOMN0012", cOMN0012);
		mav.addObject("notfound2", notfound2);

		mav.addObject("cOMN0006_en", cOMN0006_en);
		mav.addObject("cOMN9999_en", cOMN9999_en);
		mav.addObject("notfound1_en", notfound1_en);

		mav.addObject("xXXX1000_en", xXXX1000_en);
		mav.addObject("notfound2_en", notfound2_en);

		return getOkModelAndView(mav);
	}

	@RequestProperty(title = "속성리소스")
	@RequestMapping("/test/properties.do")
	public ModelAndView properties() throws Exception {
		ModelAndView mav = new ModelAndView("test/properties");

		int number1 = propertiesService.getInt("TEST_NUMBER1"); //1234
		int number2 = propertiesService.getInt("TEST_NUMBER2"); //1,234

		String string1 = propertiesService.getString("TEST_STRING"); //문자열

		String[] array1 = propertiesService.getStringArray("TEST_ARRAY1"); //1, 2, 3, 4, 5
		String[] array2 = propertiesService.getStringArray("TEST_ARRAY2", "|"); //1 | 2 | 3 | 4 | 5

		String array1_1 = propertiesService.getString("TEST_ARRAY1"); //1, 2, 3, 4, 5
		String array2_1 = propertiesService.getString("TEST_ARRAY2"); //1 | 2 | 3 | 4 | 5
		List<String> list1 = StringUtil.spritList(array1_1, ",");
		List<String> list2 = StringUtil.spritList(array2_1, "|");

		String stringM1 = propertiesService.getString("TEST_MAP1"); //KEY1=1, KEY2=2, KEY3=3, KEY4=4, KEY5=5
		String stringM2 = propertiesService.getString("TEST_MAP2"); //KEY1=1 | KEY2=2 | KEY3=3 | KEY4=4 | KEY5=5
		Map<String, String> map1 = StringUtil.spritMap(stringM1, ",");
		Map<String, String> map2 = StringUtil.spritMap(stringM2, "|");
		
		mav.addObject("number1", number1);
		mav.addObject("number2", number2);

		mav.addObject("string1", string1);

		mav.addObject("array1", array1);
		mav.addObject("array2", array2);

		mav.addObject("list1", list1);
		mav.addObject("list2", list2);

		mav.addObject("map1", map1);
		mav.addObject("map2", map2);

		return getOkModelAndView(mav);
	}

	@RequestProperty(title = "요청데이터리소스", type="login")
	@RequestMapping("/test/requestData.do")
	public ModelAndView requestData(
			RequestContext requestContext) throws Exception {
		ModelAndView mav = new ModelAndView("test/requestData");

		//일반 개발자는 아래의 요청분석클래스 또는 <ei:requestContext id="requestContext"/>를 이용한다.
		String reqPath1 = requestContext.getRequestPath();
		String reqKey1 = requestContext.getRequestKey();
		String reqPattern1 = requestContext.getRequestPattern();
		String reqReqTitle1 = requestContext.getRequestProperty("title");
		String reqReqLayout1 = requestContext.getRequestProperty("layout");
		String reqReqType1 = requestContext.getRequestProperty("type");

		mav.addObject("reqPath1", reqPath1);
		mav.addObject("reqKey1", reqKey1);
		mav.addObject("reqPattern1", reqPattern1);
		mav.addObject("reqReqTitle1", reqReqTitle1);
		mav.addObject("reqReqLayout1", reqReqLayout1);
		mav.addObject("reqReqType1", reqReqType1);

		//공통 개발자가 아닐 경우는 net.e4net.eiwaf.web.RequestContext을 이용한다.
		//해당 요청데이터리소스가 미리 로딩되어 있지 않으면 예외가 발생한다.
		RequestData requestData = requestDataService.getRequestData("/main/intro.do");
		if (requestData != null) {
			String reqPath2 = requestData.getRequestPath();
			String reqKey2 = requestData.getRequestKey();
			String reqPattern2 = requestData.getRequestPattern();
			String reqReqTitle2 = null;
			String reqReqLayout2 = null;
			String reqReqType2 = null;
			RequestDataProperty requestDataProperty = requestData.getRequestProperty();
			if (requestDataProperty != null) {
				reqReqTitle2 = requestDataProperty.getProperty("title");
				reqReqLayout2 = requestDataProperty.getProperty("layout");
				reqReqType2 = requestDataProperty.getProperty("type");
			}

			mav.addObject("reqPath2", reqPath2);
			mav.addObject("reqKey2", reqKey2);
			mav.addObject("reqPattern2", reqPattern2);
			mav.addObject("reqReqTitle2", reqReqTitle2);
			mav.addObject("reqReqLayout2", reqReqLayout2);
			mav.addObject("reqReqType2", reqReqType2);
		}

		return getOkModelAndView(mav);
	}

	@RequestProperty(title = "[리소스]-리셋")
	@RequestMapping("/test/reset.do")
	public ModelAndView reset() throws Exception {
		ModelAndView mav = new ModelAndView("test/reset");

		resourceEventListener.onApplicationEvent(new ResourceEvent(ResourceType.CODE));
//		resourceEventListener.onApplicationEvent(new ResourceEvent(ResourceType.CONFIG));
//		resourceEventListener.onApplicationEvent(new ResourceEvent(ResourceType.MESSAGE));
//		resourceEventListener.onApplicationEvent(new ResourceEvent(ResourceType.PROPERTIES));
//		resourceEventListener.onApplicationEvent(new ResourceEvent(ResourceType.REQUESTDATA));
//		resourceEventListener.onApplicationEvent(new UserDefineResourceEvent("사용자정의리소스"));

		return getOkModelAndView(mav);
	}

}