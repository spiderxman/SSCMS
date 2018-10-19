package com.masago.common;



import javax.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;


public class CmnLogger {

	/* リクエストが多重の場合、ログレベルを操作する */
	private Integer requestAllowanceCnt = 1;

	private static Logger logger = LogManager.getLogger(LogManager.ROOT_LOGGER_NAME);
	
    public void error(Object message) {
    	logger.error(message);
    }
    
    public void error(Object message, HttpSession session) {
    	error(message, null, session);
    }

    public void error(Object message, Throwable t) {
        logger.error(message, t);
    }

    public void error(Object message, Throwable t, HttpSession session) {
    	if((Integer)session.getAttribute("requestCnt") > requestAllowanceCnt){
    		// リクエストが多重の場合はWARNで出力する
    		logger.warn(message, t);
    	}else{
    		// リクエストがシングルの場合は通常通りERRORで出力する
    		logger.error(message, t);
    	}
    }

    public void warn(Object message, Throwable t) {
    	logger.warn(message, t);
    }
    
    public void warn(Object message) {
    	logger.warn(message);
    }

    public void info(Object message) {
    	logger.info(message);
    }

    public void debug(Object message) {
    	logger.debug(message);
    }

    public void debug(Object message, Throwable t) {
    	logger.debug(message, t);
    }
}
