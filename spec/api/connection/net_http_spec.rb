describe RSolr::Connection::NetHttp do
  
  def new_net_http
    RSolr::Connection::NetHttp.new
  end
  
  context '#request' do
    
    it 'should forward simple, non-data calls to #get' do
      http = new_net_http
      http.should_receive(:get).
        with('/select', :q=>'a').
          and_return({:status_code=>200})
      http.request('/select', :q=>'a') 
    end
    
    it 'should forward :method=>:post calls to #post with a special header' do
      http = new_net_http
      http.should_receive(:post).
        with('/select', 'q=a', {}, {"Content-Type"=>"application/x-www-form-urlencoded"}).
          and_return({:status_code=>200})
      http.request('/select', {:q=>'a'}, :method=>:post)
    end
    
    it 'should forward data calls to #post' do
      http = new_net_http
      http.should_receive(:post).
        with("/update", "<optimize/>", {}, {"Content-Type"=>"text/xml; charset=utf-8"}).
          and_return({:status_code=>200})
      http.request('/update', {}, '<optimize/>')
    end
    
  end
  
  context 'connection' do
    
    it 'will create an instance of Net::HTTP' do
      http = new_net_http
      c = http.send :connection
      c.should be_a(Net::HTTP)
    end
    
  end
  
  context 'get/post' do
    
    it 'should make a GET request as expected' do
      net_http_response = mock('net_http_response')
      net_http_response.should_receive(:code).
        and_return(200)
      net_http_response.should_receive(:body).
        and_return('The Response')
      http = new_net_http
      #http.should_receive(:build_url).
      #  with('/select', :q=>1).
      #    and_return('/select?q=1')
      c = http.send(:connection)
      c.should_receive(:get).
        with('/solr/select?q=1').
          and_return(net_http_response)
      context = http.send(:get, '/select', :q=>1)
      context.should be_a(Hash)
      context[:data].should == nil
      context[:body].should == 'The Response'
      context[:status_code].should == 200
      context[:path].should == '/select'
      context[:url].should == 'http://127.0.0.1:8983/solr/select?q=1'
      context[:headers].should == {}
      context[:params].should == {:q=>1}
    end
    
    it 'should make a POST request as expected' do
      net_http_response = mock('net_http_response')
      net_http_response.should_receive(:code).
        and_return(200)
      net_http_response.should_receive(:body).
        and_return('The Response')
      http = new_net_http
      #http.should_receive(:build_url).
      #  with('/update', {}).
      #    and_return('/update')
      c = http.send(:connection)
      c.should_receive(:post).
        with('/solr/update', '<rollback/>', {}).
          and_return(net_http_response)
      context = http.send(:post, '/update', '<rollback/>')
      context.should be_a(Hash)
      context[:data].should == '<rollback/>'
      context[:body].should == 'The Response'
      context[:status_code].should == 200
      context[:path].should == '/update'
      context[:url].should == 'http://127.0.0.1:8983/solr/update'
      context[:headers].should == {}
      context[:params].should == {}
    end
    
  end
  
  context 'build_url' do
    
    it 'should incude the base path to solr' do
      http = new_net_http
      result = http.send(:build_url, '/select', :q=>'*:*', :check=>'{!}')
      result.should == '/solr/select?check=%7B%21%7D&q=%2A%3A%2A'
    end
    
  end
  
end