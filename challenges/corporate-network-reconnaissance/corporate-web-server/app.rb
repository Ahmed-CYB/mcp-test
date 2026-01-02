require 'sinatra'
require 'mysql2'
require 'nokogiri'
require 'json'
require 'base64'

set :bind, '0.0.0.0'
set :port, 8080

configure do
  @@db = Mysql2::Client.new(
    host: 'localhost',
    username: 'webapp',
    password: 'web123',
    database: 'corporate_network'
  )
end

get '/' do
  erb :index
end

get '/comments' do
  results = @@db.query("SELECT * FROM comments ORDER BY created_at DESC")
  @comments = results.to_a
  erb :comments
end

post '/submit_comment' do
  begin
    xml_data = params[:xml_comment]
    
    # Parse XML comment with external entity resolution enabled
    doc = Nokogiri::XML(xml_data) do |config|
      config.options = Nokogiri::XML::ParseOptions::NOENT | Nokogiri::XML::ParseOptions::DTDLOAD
    end
    
    author = doc.xpath('//author').text
    content = doc.xpath('//content').text
    department = doc.xpath('//department').text
    
    if author.empty? || content.empty?
      @error = "Author and content are required"
      erb :index
    else
      @@db.query("INSERT INTO comments (author, content, department, created_at) VALUES ('#{@@db.escape(author)}', '#{@@db.escape(content)}', '#{@@db.escape(department)}', NOW())")
      redirect '/comments'
    end
    
  rescue => e
    @error = "XML parsing error: #{e.message}"
    erb :index
  end
end

get '/network_topology' do
  # Internal network documentation - requires authentication
  if request.env['HTTP_X_INTERNAL_ACCESS'] == 'corporate_admin'
    erb :topology
  else
    status 403
    "Access Denied - Internal Network Documentation"
  end
end

get '/admin_panel' do
  # Admin panel showing network ranges
  if params[:token] == 'net_admin_2024'
    @networks = [
      { range: '192.168.10.0/24', description: 'Web Servers', services: ['HTTP', 'HTTPS'] },
      { range: '192.168.20.0/24', description: 'File Servers', services: ['SMB', 'FTP'] },
      { range: '192.168.30.0/24', description: 'Legacy Systems', services: ['SNMP', 'Telnet'] }
    ]
    erb :admin
  else
    "Authentication Required"
  end
end

__END__

@@layout
<!DOCTYPE html>
<html>
<head>
    <title>Corporate Comment System</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; background: #f5f5f5; }
        .container { max-width: 800px; margin: 0 auto; background: white; padding: 20px; border-radius: 8px; }
        .header { background: #2c3e50; color: white; padding: 15px; margin: -20px -20px 20px -20px; }
        .form-group { margin: 15px 0; }
        label { display: block; margin-bottom: 5px; font-weight: bold; }
        textarea { width: 100%; height: 120px; padding: 10px; border: 1px solid #ddd; }
        input[type="submit"] { background: #3498db; color: white; padding: 10px 20px; border: none; cursor: pointer; }
        .comment { background: #ecf0f1; padding: 15px; margin: 10px 0; border-left: 4px solid #3498db; }
        .error { color: #e74c3c; background: #fadbd8; padding: 10px; margin: 10px 0; }
        .example { background: #d5f4e6; padding: 10px; margin: 10px 0; border-left: 3px solid #27ae60; }
        .network-info { background: #e8f4f8; padding: 10px; margin: 10px 0; border: 1px solid #3498db; }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Corporate Internal Comment System</h1>
            <p>Secure XML-based commenting for internal network documentation</p>
        </div>
        <%= yield %>
    </div>
</body>
</html>

@@index
<% if @error %>
    <div class="error"><%= @error %></div>
<% end %>

<h2>Submit Network Comment</h2>
<p>Use our XML format to submit structured comments about network infrastructure:</p>

<form method="post" action="/submit_comment">
    <div class="form-group">
        <label>XML Comment Data:</label>
        <textarea name="xml_comment" placeholder="Enter XML comment data..." required></textarea>
    </div>
    <input type="submit" value="Submit Comment">
</form>

<div class="example">
    <h3>Example XML Format:</h3>
    <pre>&lt;comment&gt;
  &lt;author&gt;John Smith&lt;/author&gt;
  &lt;department&gt;IT Security&lt;/department&gt;
  &lt;content&gt;Network segment 192.168.1.0/24 requires security audit&lt;/content&gt;
&lt;/comment&gt;</pre>
</div>

<div class="network-info">
    <h3>Internal Resources:</h3>
    <ul>
        <li><a href="/comments">View All Comments</a></li>
        <li><a href="/network_topology">Network Topology</a> (Restricted)</li>
        <li><a href="/admin_panel">Admin Panel</a> (Token Required)</li>
    </ul>
</div>

@@comments
<h2>Network Comments</h2>
<p><a href="/">&larr; Back to Submit</a></p>

<% @comments.each do |comment| %>
    <div class="comment">
        <strong><%= comment['author'] %></strong> (<%= comment['department'] %>)
        <br><em><%= comment['created_at'] %></em>
        <p><%= comment['content'] %></p>
    </div>
<% end %>

@@topology
<h2>Internal Network Topology</h2>

<div class="network-info">
    <h3>Network Infrastructure Map</h3>
    <p><strong>Primary Web Server:</strong> 192.168.10.15 (HTTP: 80, HTTPS: 443, SSH: 22)</p>
    <p><strong>File Server:</strong> 192.168.20.42 (SMB: 445, FTP: 21, SSH: 22)</p>
    <p><strong>Legacy SNMP Server:</strong> 192.168.30.88 (SNMP: 161, Telnet: 23, SSH: 22)</p>
    
    <h4>Network Discovery Notes:</h4>
    <ul>
        <li>Use nmap -sS for stealth scanning</li>
        <li>File server contains network diagrams in /shared/network/</li>
        <li>SNMP community string: 'corporate_ro'</li>
        <li>Legacy server runs vulnerable services for monitoring</li>
    </ul>
</div>

<div class="comment">
    <strong>Network Administrator</strong> (IT Security)
    <br><em>2024-01-15 14:30:22</em>
    <p>Complete network reconnaissance requires discovering all services across the three target machines. The final intelligence is distributed across multiple systems.</p>
</div>

@@admin
<h2>Network Administration Panel</h2>

<h3>Discovered Network Ranges:</h3>
<% @networks.each do |net| %>
    <div class="network-info">
        <strong><%= net[:range] %></strong> - <%= net[:description] %><br>
        Services: <%= net[:services].join(', ') %>
    </div>
<% end %>

<div class="comment">
    <h4>Reconnaissance Objective:</h4>
    <p>Map all services across the three network segments. Each machine contains different pieces of the intelligence puzzle. Use comprehensive port scanning to identify all running services.</p>
    <p><strong>Flag Location:</strong> Hidden in system files accessible via discovered network services</p>
</div>