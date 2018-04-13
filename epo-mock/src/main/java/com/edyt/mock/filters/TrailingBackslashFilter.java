package com.edyt.mock.filters;

import org.apache.http.HttpStatus;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Tomasz Kopczynski on 29.01.16.
 */
public class TrailingBackslashFilter implements Filter {
    @Override
    public void init(final FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(final ServletRequest request, final ServletResponse response, final FilterChain chain) throws IOException, ServletException {
        HttpServletResponse httpServletResponse = (HttpServletResponse) response;

        HttpServletRequest httpServletRequest = (HttpServletRequest) request;

        String contexPath = httpServletRequest.getContextPath();
        String requestURI = httpServletRequest.getRequestURI();

        if( (!contexPath.endsWith("/")) && contexPath.equals(requestURI) ) {
            httpServletResponse.setHeader("Location", httpServletRequest.getScheme() + "://" + httpServletRequest.getServerName() + ":" + httpServletRequest.getServerPort() + httpServletRequest.getContextPath() + "/");
            httpServletResponse.setStatus(HttpStatus.SC_MOVED_PERMANENTLY);

            return;
        }

        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {

    }
}
