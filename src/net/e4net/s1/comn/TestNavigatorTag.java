package net.e4net.s1.comn;

import net.e4net.eiwaf.util.StringUtil;
import net.e4net.eiwaf.web.tag.PageNavigatorTagSupport;

/**
 * 페이징 태그.
 * @author E4NET
 * @version 1.0
 */
public class TestNavigatorTag extends PageNavigatorTagSupport {

	private static final long serialVersionUID = -3955313434063472581L;

	private static final String TABLE_HEADER = "<table class=\"Paging\"><tr><td>";
	private static final String TABLE_FOOTER = "</td></tr></table>";

	protected void renderPageNavigator(StringBuilder buff, String[] navHref) {
		if (pageNav.getTotalRows() == 0) {
			buff.append(TABLE_HEADER)
				.append(TABLE_FOOTER);
			return;
		}

		String requestContext = getContextPath();
		String btnFirst = StringUtil.nvl(first, 
				"<img src=\""+ requestContext +"/images/icon_left01.gif\" style=\"margin-bottom:-2px;\">"
				);
		String btnBackUnit = StringUtil.nvl(backUnit, 
				"<img src=\""+ requestContext +"/images/icon_left02.gif\" style=\"margin-bottom:-2px;\">"
				);
		String btnNextUnit = StringUtil.nvl(nextUnit, 
				"<img src=\""+ requestContext +"/images/icon_right02.gif\" style=\"margin-bottom:-2px;\">"
				);
		String btnLast = StringUtil.nvl(last, 
				"<img src=\""+ requestContext +"/images/icon_right01.gif\" style=\"margin-bottom:-2px;\">"
				);

		buff.append(TABLE_HEADER);

		if (pageNav.hasBackPage()) {
			jsLink(buff, btnFirst, navHref, 1);
		} else {
			buff.append(btnFirst);
		}
		buff.append("&nbsp;");

		if (pageNav.hasBackPageUnit()) {
			jsLink(buff, btnBackUnit, navHref, pageNav.getBackPageUnit());
		} else {
			buff.append(btnBackUnit);
		}
		buff.append(" |&nbsp;");

		for (int ii = pageNav.getBeginUnitPage(); ii <= pageNav.getEndUnitPage(); ++ii) {
			if (ii != pageNav.getBeginUnitPage()) {
				buff.append(" | ");	
			}
			if (ii == pageNav.getPageNo()) {
				buff.append("<span class=\"current\">")
					.append(ii)
					.append("</span>");
			} else {
				jsLink(buff, String.valueOf(ii), navHref, ii);
			}
		}
		buff.append("&nbsp;| ");
		
		if (pageNav.hasNextPageUnit()) {
			jsLink(buff, btnNextUnit, navHref, pageNav.getNextPageUnit());
		} else {
			buff.append(btnNextUnit);
		}
		buff.append("&nbsp;");

		if (pageNav.hasNextPage()) {
			jsLink(buff, btnLast, navHref, pageNav.getTotalPage());
		} else {
			buff.append(btnLast);
		}

		buff.append(TABLE_FOOTER);
	}

}