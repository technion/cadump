#!/usr/bin/env ruby
# technion@lolware.net

f = File.open('/etc/pki/tls/certs/ca-bundle.trust.crt', 'r:ISO-8859-1')
casubject = nil
i = 0

f.each_line do |line|
  if line.match(/Subject: /) 
    casubject = line
    i += 1
  end

  if line.match(/Exponent: 3 /)
    fail "Ummatched exponent" if casubject.nil?
    puts casubject
    puts line
    casubject = nil
  end
end

puts "There were #{i.to_s} identified certificates"
