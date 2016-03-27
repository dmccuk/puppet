Facter.add("nameserver_list") do
    setcode do
      nameserver = false
      File.open("/etc/resolv.conf", "r").each_line do |line|
        if line =~ /^nameserver\s*(\S*)/
          if nameserver
            nameserver = nameserver + " " + $1
          else
            nameserver = $1
          end
        end
      end
      nameserver
    end
end
