package com.jordiv.emovix.twitter

import twitter4j.StallWarning;
import twitter4j.Status;
import twitter4j.StatusDeletionNotice;
import twitter4j.StatusListener;

import org.codehaus.groovy.grails.web.context.ServletContextHolder as SCH
import org.codehaus.groovy.grails.web.servlet.GrailsApplicationAttributes as GA

class CustomStatusListener implements StatusListener {
	
	@Override
	public void onException(Exception arg0) {
		arg0.printStackTrace()
		
		def ctx = SCH.servletContext.getAttribute(GA.APPLICATION_CONTEXT)
		def twitterService = ctx.twitterService
		
		twitterService.getStream()
	}

	@Override
	public void onDeletionNotice(StatusDeletionNotice arg0) {
		
	}

	@Override
	public void onScrubGeo(long arg0, long arg1) {
		
	}

	@Override
	public void onStallWarning(StallWarning arg0) {
		println "STALL WARNING:"
		println arg0
	}

	@Override
	public void onStatus(Status status) {
		def ctx = SCH.servletContext.getAttribute(GA.APPLICATION_CONTEXT)
		def twitterService = ctx.twitterService
		
		TwitterStatus twitterStatus = twitterService.saveTwitterStatus(status)
		//twitterService.detectLanguage(twitterStatus)
	}

	@Override
	public void onTrackLimitationNotice(int arg0) {
		// TODO Auto-generated method stub
		//println "TRACK LIMITATION NOTICE:"
		//println arg0
	}
}
