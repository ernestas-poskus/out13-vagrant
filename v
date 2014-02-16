#!/usr/bin/env ruby

if ARGV.length == 0
	puts "Gimme some args" 
	exit
end 

ar = []
$now = Time.now.strftime("%Y-%m-%d-%H_%M_%S")


# Chomp & Save
ARGV.each do |a|
	ar.push(a.chomp)
end


###################################################################################
def execute(command)
	`#{command}`
end

def excute_log(command, type, node) 
	`#{command} >> .vagrant/LOG_#{type}-#{node}-#{$now}-debug.txt`
end

def excute_log_append(command, type, node) 
	file = ".vagrant/LOG_#{node}-debug.txt"

	File.open(file, 'a') do |f|
		f.puts ""
		f.puts "_" * 69
		f.puts "#{$now} - #{node}: #{command}"
	end

	`#{command} >> #{file}`
end

def status(n)
	case execute("vagrant status #{n}")
		when /saved/
			resume(n)
		when /created/ || /poweroff/
			up(n)
		when /running/
			suspend(n)
		else
			puts 'Dont know what to do'
	end
end

def destroy(n, arg='-f')
	excute_log_append("vagrant destroy #{arg} #{n}", 'DESTROY', "#{n}")
end

def up(n, arg='--no-provision --parallel')
	excute_log("vagrant up #{n} #{arg}", "UP", "#{n}")
end

def halt(n, arg='-f')
	excute_log_append("vagrant halt #{n} #{arg}", 'HALT', "#{n}")
end

def provision(n, arg='--provision-with puppet') 
	excute_log_append("vagrant provision #{n} #{arg}", 'PROVISION', "#{n}")
end

def suspend(n)
	excute_log_append("vagrant suspend #{n}", 'SUSPEND', "#{n}")
end

def resume(n)
	excute_log_append("vagrant resume #{n}", 'RESUME', "#{n}")
end

def ssh(n)
	status(n)
	execute("vagrant ssh #{n}")
end
###################################################################################



# Constructor 
case ar[0]
	when 'd'
		destroy(ar[1])
	when 'ss'
		ssh(ar[1])
	when 'du'
		destroy(ar[1])
		up(ar[1])
	when 'h'
		halt(ar[1])
	when 'pr'
		provision(ar[1])
	else
		status(ar[0])
end