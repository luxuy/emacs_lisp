# -*- coding: utf-8 -*-
require 'graphviz'
file=ARGV[0] #.encode('gbk')
p "--------#{file}"
#str= IO.read(file,"r:UTF-8")
str= File.open(file, "r:UTF-8", &:read)
#str.encode('utf8',"r:UTF-8")

#-------------------
def make_subg(arr,sub_name)
    s1="subgraph(:rank=>\"same\"){|#{sub_name}|\n"
    arr.map!{|c| sub_name+"."+c}
    return s1+arr.join("\n")+"\n}"
end
    

#--------先处理子组
subs=str.scan(/\{.+?\n.+?\}/m)
p subs
subs_items=[]
subs.each{|e|
    subs_items << e.scan(/[A-Z].*/)
    }
p subs_items

str.gsub!(/\{.+?\n.+?\}/m,"")
i=1
subs_items.each{|e|
    str<<"\n"<<make_subg(e,"a"*i)
    i+=1
    #puts str
}


#-----------------------------
str.gsub!(/((?<![A-z."])[A-Z]+(?![A-z]))/, "g." << '\1')
str.gsub!(/((?<![A-z])\[:.+\])/, "g" << '\1')
str.gsub!(/((node|edge|add_edges|add_nodes|add_graph|subgraph))/, "g." << '\1')


g=GraphViz::new("lx")
puts str    
eval str
g.output(:png=>"#{file}.png",:none=>"#{file}.gv")

