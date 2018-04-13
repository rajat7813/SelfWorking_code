package com.edyt.mock.filters;

import org.apache.log4j.Logger;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Enumeration;

public class HeaderLoggingFilter implements Filter {
    private Logger logger = Logger.getLogger(HeaderLoggingFilter.class);

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;

        if (logger.isDebugEnabled()) {
            StringBuilder stringBuilder = new StringBuilder();

            final Enumeration<String> headerNames = request.getHeaderNames();
            stringBuilder.append("uri: ").append(request.getRequestURI()).append("\n\n");
            stringBuilder.append("query string: ").append(request.getQueryString()).append("\n\n");

            while (headerNames.hasMoreElements()) {
                final String headerName = headerNames.nextElement();
                stringBuilder.append(headerName).append(": ").append(request.getHeader(headerName)).append("\n");
            }

            final String response = stringBuilder.toString();
            logger.debug(response);
        }
        filterChain.doFilter(servletRequest, servletResponse);
    }

    @Override
    public void destroy() {

    }
}
