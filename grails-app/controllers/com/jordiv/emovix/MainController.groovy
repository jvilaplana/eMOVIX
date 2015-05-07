package com.jordiv.emovix

import grails.transaction.Transactional
import org.apache.tika.language.LanguageIdentifier
import twitter4j.FilterQuery
import twitter4j.StallWarning
import twitter4j.Status
import twitter4j.StatusDeletionNotice
import twitter4j.StatusListener
import twitter4j.TwitterStream
import twitter4j.TwitterStreamFactory

@Transactional(readOnly = true)
class MainController {

    def index() {
		render(view: "/index", model: [])
	}
	
	def about() {
		render(view: "/about", model: [])
	}
	
	def streaming() {
		println "START STREAM"
		TwitterStream twitterStream = new TwitterStreamFactory().getInstance();
		StatusListener listener = new StatusListener() {
			@Override
			public void onStatus(Status status) {
				System.out.println("@" + status.getUser().getScreenName() + " - " + status.getText());
			}

			@Override
			public void onDeletionNotice(StatusDeletionNotice statusDeletionNotice) {
				System.out.println("Got a status deletion notice id:" + statusDeletionNotice.getStatusId());
			}

			@Override
			public void onTrackLimitationNotice(int numberOfLimitedStatuses) {
				System.out.println("Got track limitation notice:" + numberOfLimitedStatuses);
			}

			@Override
			public void onScrubGeo(long userId, long upToStatusId) {
				System.out.println("Got scrub_geo event userId:" + userId + " upToStatusId:" + upToStatusId);
			}

			@Override
			public void onStallWarning(StallWarning warning) {
				System.out.println("Got stall warning:" + warning);
			}

			@Override
			public void onException(Exception ex) {
				ex.printStackTrace();
			}
		};
		twitterStream.addListener(listener);
		
		FilterQuery filterQuery = new FilterQuery();
		double[][] locations = [[ -9.05, 48.77 ], [ 2.19, 58.88 ]];
		filterQuery.locations(locations);
		twitterStream.filter(filterQuery);
		
		
		render "streaming..."
	}
	
	def tika() {
		
		def text = "Doncs avui fa molt de sol i no massa pluja"
		
		LanguageIdentifier li = new LanguageIdentifier(text);
		println li.getSupportedLanguages()
		if (li.isReasonablyCertain())
			render text + " -!!-> " + li.getLanguage();
		else
			render text + " --> " + li.getLanguage();
		
	}
}