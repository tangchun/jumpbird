function swap(t1, t2)
	t1.x, t2.x = t2.x, t1.x
end

local t1 = {x=100, y=20}
local t2 = t1 
t2.x = t2.x + 10
print(t1.x, t2.x)
swap (t1, t2)
print(t1.x, t2.x)

---------about table---------
local a = 1
local b = "1"
local t= {a = 1, ["a"]=2, [a] = 3}

print(t.a, t["a"], t[a], t[t.a], t.b, t[b])
--2,2,3,nil,nil,nil

print(1 and nil) -- nil
print(2 and false)
print(1==2)
print(false == nil)
print((false and nil) == false) -- true
print((nil and false) == false) -- false
print(false or nil == true)
print(nil and false == true) -- nil


print("----------------------------------------")
t = {x=1}
t.foo = function(t)
	print(t.x)
end
local a = {x = 2}
print(t.foo(a), t:foo(a))

print("--------------------math.random(3)----------------")
for i = 1 , 10 do
	local t = math.random(3)
	print(string.format("#cloud%d.png", t))
end