require 'spec_helper'

def mock_client(callback_url)
	mock(:authorize_url => callback_url)
end	

describe MyApp do
	context "/" do
		it "should be ok" do
			get '/'

			expect(last_response).to be_ok
		end
	end	

	context "/connect" do
		it "should find MyWeibo instance" do
			MyWeibo.should_receive(:fetch)
			get '/connect', :provider => 'weibo'
		end

		it "should find MyTwitter instance" do
			MyTwitter.should_receive(:fetch)
			get '/connect', :provider => 'twitter'
		end

		it "should be redirect to twitter authorize_url" do
			provider = 'twitter'
			client = mock_client(provider)
			client.should_receive(:authorize_url).with(provider)
			MyTwitter.should_receive(:fetch).and_return(client)

			get '/connect', :provider => 'twitter'

			expect(last_response).to be_redirect
		end
	end
	
	context "auth/:provider/callback" do
		
	end	
end
